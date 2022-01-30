package com.lk.web.controller.tool;

import com.lk.common.core.controller.BaseController;
import com.lk.framework.config.LKConfig;
import com.lk.xxl.service.XxlJobService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("tool/share")
public class ShareController extends BaseController {
    private String prefix = "tool/share";

    @Value("${share.upload}")
    private String upload;

    @Value("${share.maxSize}")
    private String maxSize;

    @RequiresPermissions("tool:share:view")
    @GetMapping()
    public String share(){
        return prefix + "/share";
    }
}
