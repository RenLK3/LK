package com.lk.web.controller.monitor;

import com.lk.common.core.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/monitor/timer")
public class SysTimerController extends BaseController {

    private String prefix = "monitor/timer";

    @RequiresPermissions("monitor:timer:view")
    @GetMapping()
    public String timer(){
        return prefix + "/timer";
    }
}
