package com.lk.web.controller.monitor;

import com.lk.common.core.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/monitor/swagger")
public class SwaggerController extends BaseController
{
    @RequiresPermissions("monitor:swagger:view")
    @GetMapping()
    public String index()
    {
        return redirect("/swagger-ui/index.html");
    }
}
