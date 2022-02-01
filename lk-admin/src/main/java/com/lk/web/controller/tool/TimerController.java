package com.lk.web.controller.tool;

import com.lk.common.core.controller.BaseController;
import com.lk.common.core.domain.LayResult;
import com.lk.xxl.core.thread.JobTriggerPoolHelper;
import com.lk.xxl.core.trigger.TriggerTypeEnum;
import com.lk.xxl.domain.XxlJobInfo;
import com.lk.xxl.service.XxlJobService;
import com.xxl.job.core.biz.model.ReturnT;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("tool/timer")
public class TimerController extends BaseController {
    private String prefix = "tool/timer";

    @Autowired
    private XxlJobService jobService;

    @RequiresPermissions("tool:timer:view")
    @GetMapping()
    public String timer(){
        return prefix + "/timer";
    }

    @RequiresPermissions("tool:timer:list")
    @ResponseBody
    @PostMapping("/list")
    public LayResult list(int page,int limit){
        Map<String,Object> map = jobService.pageList(((page-1)*limit),((page*limit)),1,1,null,null,null);
        List<XxlJobInfo> xxlJobInfoList = (List<XxlJobInfo>) map.get("data");
        return new LayResult(xxlJobInfoList.size(),xxlJobInfoList);
    }

    @RequiresPermissions("tool:timer:edit")
    @ResponseBody
    @PostMapping("/state")
    public LayResult state(int id, boolean state){
        ReturnT<String> returnT;
        if(state){
            returnT = jobService.start(id);
            System.out.println("start");
        }else{
            returnT= jobService.stop(id);
            System.out.println("stop");
        }

        return ok();
    }

    @ResponseBody
    @GetMapping("/stop")
    public LayResult stop(int id){
        jobService.stop(id);
        return ok();
    }

    @GetMapping("/trigger")
    @ResponseBody
    //@PermissionLimit(limit = false)
    public ReturnT<String> triggerJob(int id, String executorParam, String addressList) {
        // force cover job param
        if (executorParam == null) {
            executorParam = "";
        }

        JobTriggerPoolHelper.trigger(id, TriggerTypeEnum.MANUAL, -1, null, executorParam, addressList);
        return ReturnT.SUCCESS;
    }
}
