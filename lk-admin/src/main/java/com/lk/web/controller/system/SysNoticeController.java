package com.lk.web.controller.system;

import com.lk.common.core.controller.BaseController;
import com.lk.common.core.domain.LayResult;
import com.lk.common.core.domain.entity.SysMenu;
import com.lk.common.core.domain.entity.SysNotice;
import com.lk.common.core.domain.entity.SysUser;
import com.lk.common.core.domain.vo.MenuExcelVO;
import com.lk.common.core.domain.vo.NoticeExcelVO;
import com.lk.system.domain.SysMessage;
import com.lk.system.mapper.SysMessageMapper;
import com.lk.system.service.ISysNoticeService;
import com.lk.system.service.ISysRoleService;
import com.pig4cloud.plugin.excel.annotation.ResponseExcel;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * 用户
 *
 * @author LiKe_Ren
 */
@Controller
@RequestMapping("system/notice")
public class SysNoticeController extends BaseController {
    private String prefix = "system/notice";

    @Autowired
    private ISysRoleService roleService;

    @Autowired
    private ISysNoticeService noticeService;

    @Autowired
    private SysMessageMapper messageMapper;

    @RequiresPermissions("system:notice:view")
    @GetMapping()
    public String notice(ModelMap model) {
        model.put("roles", roleService.selectRoleAll());
        model.put("level", SysUser.maxLevel(getSysUser()));
        return prefix + "/notice";
    }

    @RequiresPermissions("system:notice:add")
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    @RequiresPermissions("system:notice:edit")
    @GetMapping("/edit")
    public String edit(Long id, ModelMap model) {
        model.put("notice", noticeService.selectNoticeById(id));
        return prefix + "/edit";
    }

    @RequiresPermissions("system:notice:add")
    @PostMapping(value = "/queue")
    @ResponseBody
    public LayResult queue(Long[] userIds, Long[] noticeIds) {
        List<SysMessage> messages = new ArrayList<>();
        for (Long userId : userIds) {
            for (Long noticeId : noticeIds) {
                SysMessage message = new SysMessage();
                message.setUserId(userId);
                message.setNoticeId(noticeId);
                messages.add(message);
            }
        }
        messageMapper.insertUnreadMessageList(messages);
        return ok();
    }

    @RequiresPermissions("system:notice:list")
    @RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public LayResult list(SysNotice notice, int page, int limit) {
        return page(noticeService.selectNoticeList(notice), page, limit);
    }

    @RequiresPermissions("system:notice:add")
    @PostMapping("/add")
    @ResponseBody
    public LayResult add(@Validated SysNotice notice) {
        return toAjax(noticeService.insertNotice(notice));
    }

    @RequiresPermissions("system:notice:edit")
    @PostMapping("/edit")
    @ResponseBody
    public LayResult edit(@Validated SysNotice notice) {
        return toAjax(noticeService.updateNotice(notice));
    }

    /**
     * 导出excel 表格
     *
     * @return
     */
    @RequiresPermissions("system:notice:export")
    @ResponseExcel
    @GetMapping("/export")
    public List<NoticeExcelVO> export(SysNotice notice) {
        List<SysNotice> notices = noticeService.selectNoticeList(new SysNotice());
        List<NoticeExcelVO> noticeExcelVOS = new ArrayList<>();
        notices.forEach(u -> {
            NoticeExcelVO excelVO = new NoticeExcelVO();
            BeanUtils.copyProperties(u, excelVO);
            noticeExcelVOS.add(excelVO);
        });
        return noticeExcelVOS;
    }

    @RequiresPermissions("system:notice:remove")
    @PostMapping("/remove")
    @ResponseBody
    public LayResult remove(Long noticeId) {
        return toAjax(noticeService.deleteNoticeById(noticeId));
    }

    @RequiresPermissions("system:notice:edit")
    @PostMapping("/state")
    @ResponseBody
    public LayResult state(Long noticeId, boolean state) {
        SysNotice notice = new SysNotice();
        notice.setNoticeId(noticeId);
        notice.setStatus(state ? "0" : "1");
        notice.setUpdateBy(getSysUser().getUserName());
        return toAjax(noticeService.updateNotice(notice));
    }

    @RequiresPermissions("system:notice:edit")
    @PostMapping("/type")
    @ResponseBody
    public LayResult type(Long noticeId, Long type) {
        if (noticeId == null || type == null || noticeId == 0L) return error("值不能为空!");
        SysNotice notice = new SysNotice();
        notice.setNoticeId(noticeId);
        notice.setType(type.toString());
        return toAjax(noticeService.updateNotice(notice));
    }
}
