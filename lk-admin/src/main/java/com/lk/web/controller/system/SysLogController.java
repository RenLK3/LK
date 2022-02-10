package com.lk.web.controller.system;

import com.lk.common.core.controller.BaseController;
import com.lk.common.core.domain.LayResult;
import com.lk.common.core.domain.entity.SysMenu;
import com.lk.common.core.domain.vo.MenuExcelVO;
import com.lk.common.utils.StringUtils;
import com.lk.system.domain.SysOperLog;
import com.lk.system.domain.vo.LogExcelVO;
import com.lk.system.service.ISysNoticeService;
import com.lk.system.service.ISysOperLogService;
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
 * @author LiKe_Ren
 */
@Controller
@RequestMapping("system/log")
public class SysLogController extends BaseController {
    private String prefix = "system/log";

    @Autowired
    private ISysOperLogService operLogService;

    @RequiresPermissions("system:log:view")
    @GetMapping()
    public String log( ) {
        return prefix + "/log";
    }

    @RequiresPermissions("system:log:list")
    @RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public LayResult list(SysOperLog operLog, int page, int limit) {
        return page(operLogService.selectOperLogList(operLog), page, limit);
    }

    /**
     * 导出excel 表格
     *
     * @return
     */
    @RequiresPermissions("system:log:export")
    @ResponseExcel
    @GetMapping("/export")
    public List<LogExcelVO> export(SysOperLog log) {
        List<SysOperLog> logs = operLogService.selectOperLogList(new SysOperLog());
        List<LogExcelVO> logExcelVOS = new ArrayList<>();
        logs.forEach(u -> {
            LogExcelVO excelVO = new LogExcelVO();
            BeanUtils.copyProperties(u, excelVO);
            logExcelVOS.add(excelVO);
        });
        return logExcelVOS;
    }


    @RequiresPermissions("system:log:remove")
    @PostMapping("/remove")
    @ResponseBody
    public LayResult remove(String operIds) {
        return toAjax(operLogService.deleteOperLogByIds(operIds));
    }

    @RequiresPermissions("system:log:remove")
    @PostMapping("/clear")
    @ResponseBody
    public LayResult clear(String operId) {
        if(StringUtils.isEmpty(operId))return error("不能为空!");
        return toAjax(operLogService.deleteOperLogByIds(operId));
    }
}
