package com.lk.web.controller.monitor;

import com.lk.common.core.controller.BaseController;
import com.lk.framework.web.domain.Server;
import com.lk.framework.web.domain.server.SysFile;
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
        model.put("server", server);
        model.put("nat_mem_percent", ((server.getMem().getUsed() / server.getMem().getTotal()) * 100 + "").substring(0, 5));
        model.put("nat_cpu_percent", ((100 - server.getCpu().getFree()) + "").substring(0, Math.min(((100 - server.getCpu().getFree()) + "").length(), 5)));
        model.put("nat_jvm_mem_percent", ((server.getJvm().getTotal() / server.getJvm().getMax()) * 100 + "").substring(0, 5));

        double maxDiskCap = 0;
        double usedDisk = 0;
        for (SysFile sysFile : server.getSysFiles()) {
            maxDiskCap += Double.parseDouble(sysFile.getTotal().substring(0, sysFile.getTotal().length() - 4));
            usedDisk += Double.parseDouble(sysFile.getUsed().substring(0, sysFile.getTotal().length() - 4));
        }
        model.put("disk_cap", maxDiskCap);
        model.put("disk_used", usedDisk);


        return prefix + "/server";
    }


}
