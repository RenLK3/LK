package com.lk.web.controller.tool;

import com.lk.common.core.controller.BaseController;
import com.lk.common.core.domain.JSTree;
import com.lk.common.core.domain.LayResult;
import com.lk.common.core.domain.entity.SysDept;
import com.lk.common.core.domain.entity.SysUser;
import com.lk.common.utils.StringUtils;
import com.lk.framework.config.LKConfig;
import com.lk.system.domain.SysShare;
import com.lk.system.mapper.SysShareMapper;
import com.lk.system.service.ISysDeptService;
import com.lk.system.service.ISysRoleService;
import com.lk.system.service.ISysShareService;
import com.lk.system.service.ISysUserService;
import com.lk.xxl.service.XxlJobService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.FileEncodingApplicationListener;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
            return error("不能添加高于用户级别文档");
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
            return error("不能上传高级别文档");
        }
        if(StringUtils.isNotEmpty(name)){
            return error("不能空名称");
        }

        name = System.currentTimeMillis() + "_" + name;
        File path = new File(upload, name);

        if (!path.getParentFile().exists()) {
            path.getParentFile().mkdirs();
        }
        SysShare s = shareService.selectShareById(pId);
        if (s != null) {
            if (s.getType().equals(1)) {
                return error("请选择目录");
            }
        } else {
            return error("没有找到父目录");
        }
        try {
            BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(path));
            out.write(file.getBytes());
            out.close();
            SysShare share = new SysShare();
            share.setParentId(pId);
            share.setName(name);
            share.setLevel(level);
            share.setPath(path.getAbsolutePath());
            share.setCreateBy(getLoginName());
            return toAjax(shareService.insertFileShare(share));
        } catch (IOException e) {
            return error(e.getMessage());
        }
    }

    @RequiresPermissions("tool:share:edit")
    @PostMapping("/edit")
    @ResponseBody
    public LayResult edit(Long id, String name) {
        SysShare share = shareService.selectShareById(id);
        if (share.getShareId().equals(-1L)) {
            return error("不能更改主目录");
        }
        Long level = SysUser.maxLevel(getSysUser());
        if (SysUser.battleLevel(level, share.getLevel().longValue())) {
            share = new SysShare();
            share.setShareId(id);
            share.setName(name);
            share.setUpdateBy(getLoginName());
            return toAjax(shareService.updateShare(share));
        } else {
            return error("不能更改高级别文档");
        }
    }

    @RequiresPermissions("tool:share:edit")
    @PostMapping("/del")
    @ResponseBody
    public LayResult del(Long id) {
        SysShare share = shareService.selectShareById(id);
        if (share.getShareId().equals(-1L)) {
            return error("不能删除主目录");
        }
        Long level = SysUser.maxLevel(getSysUser());
        if (SysUser.battleLevel(level, share.getLevel().longValue())) {
            return toAjax(shareService.deleteShareById(id));
        } else {
            return error("不能删除高级别文档");
        }
    }

}
