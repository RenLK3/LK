package com.lk.web.controller.monitor;

import com.lk.common.core.controller.BaseController;
import com.lk.framework.web.domain.Server;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/monitor/server")
public class SysServerController extends BaseController {
    private String prefix = "monitor/server";

    @RequiresPermissions("monitor:server:view")
    @GetMapping()
    public String server(ModelMap model) throws Exception {
        Server server = new Server();
        server.copyTo();
        model.put("server",server);
        model.put("nat_mem_percent",((server.getMem().getUsed()/server.getMem().getTotal())*100+"").substring(0,5));
        model.put("nat_cpu_percent",((((server.getCpu().getTotal()-server.getCpu().getFree())/server.getCpu().getTotal())*100)+"").substring(0,5));

        return prefix + "/server";
    }


}
