package com.lk.web.controller.tool;

import com.lk.common.core.controller.BaseController;
import com.lk.common.core.domain.JSTree;
import com.lk.common.core.domain.LayResult;
import com.lk.common.core.domain.entity.SysDept;
import com.lk.common.core.domain.entity.SysUser;
import com.lk.common.core.domain.vo.DeptExcelVO;
import com.lk.common.utils.StringUtils;
import com.lk.common.utils.spring.SpringUtils;
import com.lk.system.domain.SysShare;
import com.lk.system.domain.vo.ShareExcelVO;
import com.lk.system.service.INetFileService;
import com.lk.system.service.ISysShareService;
import com.pig4cloud.plugin.excel.annotation.ResponseExcel;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("tool/share")
public class ShareController extends BaseController {
    private String prefix = "tool/share";

    @Value("${share.upload}")
    private String upload;

    @Value("${share.maxSize}")
    private String maxSize;

    @Autowired
    private ISysShareService shareService;

    @RequiresPermissions("tool:share:view")
    @GetMapping()
    public String share() {
        return prefix + "/share";
    }

    @RequiresPermissions("tool:share:add")
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    @RequiresPermissions("tool:share:edit")
    @GetMapping("/edit")
    public String edit() {
        return prefix + "/edit";
    }

    @RequiresPermissions("tool:share:list")
    @RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public LayResult list(Long shareId, String name, String type, int page, int limit) {
        List<SysShare> shareList = initTree(shareService.selectShareList(new SysShare()), shareId);
        List<SysShare> target = new ArrayList<>();
        List<SysShare> finalUserList = target;
        shareList.forEach(s -> {
            SysShare share = new SysShare();
            share.setShareId(s.getShareId());
            List<SysShare> users = shareService.selectShareList(share);
            if (users.size() > 0) {
                finalUserList.addAll(users);
            }
        });
        if (StringUtils.isNotEmpty(name)) {
            target = target.stream().filter(s -> s.getName().contains(name)).collect(Collectors.toList());
        }
        if (StringUtils.isNotEmpty(type)) {
            int tem = Integer.parseInt(type);
            target = target.stream().filter(s -> s.getType().equals(tem)).collect(Collectors.toList());
        }
        return page(target, page, limit);
    }

    @RequiresPermissions("tool:share:list")
    @GetMapping("/tree")
    @ResponseBody
    public List<JSTree> tree(long id) {
        SysShare share = new SysShare();
        share.setParentId(id);
        List<SysShare> shares = shareService.selectShareList(share);
        return initJSTree(shares);
    }

    public List<JSTree> initJSTree(List<SysShare> shareList) {
        if (shareList == null || shareList.size() == 0) return new ArrayList<>();
        List<JSTree> trees = new ArrayList<>();
        shareList.forEach(share -> {
            JSTree tree = new JSTree();
            tree.setId(share.getShareId());
            tree.setText(share.getName());
            if (share.getType().equals(0)) {
                tree.setIcon("fa fa-folder-open-o");
            } else {
                tree.setIcon("fa fa-file-archive-o");
            }

            tree.setChildren(true);
            JSTree.State state = new JSTree.State();
            state.setOpened(true);
            tree.setState(state);
            trees.add(tree);
        });
        return trees;
    }

    public List<SysShare> initTree(List<SysShare> shareList, long pid) {
        if (shareList == null || shareList.size() == 0) return new ArrayList<>();
        List<SysShare> filter;
        if (pid == -1L) {
            filter = shareList.stream().filter((d) -> d.getParentId().equals(-1L)).collect(Collectors.toList());
        } else {
            filter = shareList.stream().filter((d) -> d.getShareId().equals(pid)).collect(Collectors.toList());
        }
        if (filter.isEmpty()) return new ArrayList<>();
        List<SysShare> shares = new ArrayList<>(filter);
        filter.forEach(s -> tree(shareList, shares, s.getShareId()));
        return shares;
    }

    public void tree(List<SysShare> src, List<SysShare> dis, long pid) {
        List<SysShare> filter = src.stream().filter((d) -> d.getParentId().equals(pid)).collect(Collectors.toList());
        if (filter.isEmpty()) return;
        dis.addAll(filter);
        for (SysShare share : filter) {
            tree(src, dis, share.getShareId());
        }
    }

    @RequiresPermissions("tool:share:add")
    @PostMapping("/add")
    @ResponseBody
    public LayResult add(Long pId, int level, String name) {
        if (!SysUser.battleLevel(SysUser.maxLevel(getSysUser()), (long) level)) {
            return error("????????????????????????????????????");
        }
        SysShare share = new SysShare();
        share.setParentId(pId);
        share.setName(name);
        share.setCreateBy(getLoginName());
        return toAjax(shareService.insertDirectionShare(share));
    }

    @RequiresPermissions("tool:share:add")
    @PostMapping("/upload")
    @ResponseBody
    public LayResult upload(Long pId, int level, String name, MultipartFile file) {
        if (!SysUser.battleLevel(SysUser.maxLevel(getSysUser()), (long) level)) {
            return error("???????????????????????????");
        }
        if (StringUtils.isEmpty(name)) {
            return error("???????????????");
        }
        String oriName = name;
        name = System.currentTimeMillis() + "_" + name;
        File path = new File(upload, name);

        if (!path.getParentFile().exists()) {
            path.getParentFile().mkdirs();
        }
        SysShare s = shareService.selectShareById(pId);
        if (s != null) {
            if (s.getType().equals(1)) {
                return error("???????????????");
            }
        } else {
            return error("?????????????????????");
        }
        try {
            BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(path));
            out.write(file.getBytes());
            out.close();
            SysShare share = new SysShare();
            share.setParentId(pId);
            share.setName(oriName);
            share.setLevel(level);
            share.setPath(path.getAbsolutePath());
            share.setCreateBy(getLoginName());
            return toAjax(shareService.insertFileShare(share));
        } catch (IOException e) {
            return error(e.getMessage());
        }
    }

    @RequiresPermissions("tool:share:list")
    @RequestMapping( value = "/download/{shareId}", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    private void download(@PathVariable Long shareId, HttpServletResponse response) {
        try{
            SpringUtils.getBean(INetFileService.class).downloadFile(shareId,response);
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    @RequiresPermissions("tool:share:edit")
    @PostMapping("/edit")
    @ResponseBody
    public LayResult edit(Long id, String name) {
        SysShare share = shareService.selectShareById(id);
        if (share.getShareId().equals(-1L)) {
            return error("?????????????????????");
        }
        Long level = SysUser.maxLevel(getSysUser());
        if (SysUser.battleLevel(level, share.getLevel().longValue())) {
            share = new SysShare();
            share.setShareId(id);
            share.setName(name);
            share.setUpdateBy(getLoginName());
            return toAjax(shareService.updateShare(share));
        } else {
            return error("???????????????????????????");
        }
    }

    /**
     * ??????excel ??????
     *
     * @return
     */
    @RequiresPermissions("system:share:export")
    @ResponseExcel
    @GetMapping("/export")
    public List<ShareExcelVO> export(SysShare share) {
        List<SysShare> shares = shareService.selectShareList(new SysShare());
        List<ShareExcelVO> shareExcelVOS = new ArrayList<>();
        shares.forEach(u -> {
            ShareExcelVO excelVO = new ShareExcelVO();
            BeanUtils.copyProperties(u, excelVO);
            shareExcelVOS.add(excelVO);
        });
        return shareExcelVOS;
    }

    @RequiresPermissions("tool:share:edit")
    @PostMapping("/del")
    @ResponseBody
    public LayResult del(Long id) {
        SysShare share = shareService.selectShareById(id);
        if (share.getShareId().equals(-1L)) {
            return error("?????????????????????");
        }
        Long level = SysUser.maxLevel(getSysUser());
        if (SysUser.battleLevel(level, share.getLevel().longValue())) {
            return toAjax(shareService.deleteShareById(id));
        } else {
            return error("???????????????????????????");
        }
    }

}
