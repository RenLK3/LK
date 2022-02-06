package com.lk.web.controller.tool;

import com.lk.common.core.controller.BaseController;
import com.lk.common.core.domain.LayResult;
import com.lk.common.core.text.Convert;
import com.lk.common.utils.StringUtils;
import com.lk.xxl.core.thread.JobTriggerPoolHelper;
import com.lk.xxl.core.trigger.TriggerTypeEnum;
import com.lk.xxl.domain.XxlJobGroup;
import com.lk.xxl.domain.XxlJobInfo;
import com.lk.xxl.domain.XxlJobLog;
import com.lk.xxl.mapper.XxlJobGroupMapper;
import com.lk.xxl.mapper.XxlJobInfoMapper;
import com.lk.xxl.mapper.XxlJobLogMapper;
import com.lk.xxl.service.XxlJobService;
import com.xxl.job.core.biz.model.ReturnT;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("tool/timer")
public class TimerController extends BaseController {
    private String prefix = "tool/timer";

    @Autowired
    private XxlJobService jobService;

    @Autowired
    private XxlJobLogMapper jobLogMapper;

    @Autowired
    private XxlJobGroupMapper jobGroupMapper;

    @Autowired
    private XxlJobInfoMapper jobInfoMapper;

    @RequiresPermissions("tool:timer:view")
    @GetMapping()
    public String timer(ModelMap map) {
        map.put("groups", jobGroupMapper.findAll());
        return prefix + "/timer";
    }

    @RequiresPermissions("tool:timer:view")
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    @RequiresPermissions("tool:timer:view")
    @GetMapping("/edit")
    public String edit(int id, ModelMap map) {
        map.put("id", id);
        map.put("jobinfo", jobInfoMapper.loadById(id));
        return prefix + "/edit";
    }

    @RequiresPermissions("tool:timer:view")
    @GetMapping("/log")
    public String log(ModelMap map) {
        List<Integer> ids = new ArrayList<>();
        jobService.selectJobInfoList().stream().forEach(jobInfo -> ids.add(jobInfo.getId()));
        map.put("jobids", ids);
        return prefix + "/log";
    }

    @RequiresPermissions("tool:timer:view")
    @GetMapping("/cron")
    public String cron() {
        return prefix + "/cron";
    }

    @RequiresPermissions("tool:timer:list")
    @ResponseBody
    @PostMapping("/list")
    public LayResult list(int page, int limit) {
        Map<String, Object> map = jobService.pageList(((page - 1) * limit), ((page * limit)));
        List<XxlJobInfo> xxlJobInfoList = (List<XxlJobInfo>) map.get("data");
        return new LayResult(xxlJobInfoList.size(), xxlJobInfoList);
    }

    @RequiresPermissions("tool:timer:list")
    @ResponseBody
    @PostMapping("/log/list")
    public LayResult logList(String id, String address, int page, int limit) {
        List<XxlJobLog> logs = jobLogMapper.selectLogList();
        if (StringUtils.isNotEmpty(id)) {
            try {
                int tem = Integer.parseInt(id);
                logs = logs.stream().filter(log -> log.getJobId() == tem).collect(Collectors.toList());
            } catch (NumberFormatException e) {// 不需要提示
            }
        }
        if (StringUtils.isNotEmpty(address)) {
            logs = logs.stream().filter(log -> log.getExecutorAddress().contains(address)).collect(Collectors.toList());
        }
        return page(logs, page, limit);
    }

    @RequiresPermissions("tool:timer:del")
    @PostMapping("/log/del")
    @ResponseBody
    public LayResult logDelP(String ids) {
        return toAjax(jobLogMapper.deleteJobLogByIds(Convert.toStrArray(ids)));
    }


    @RequiresPermissions("tool:timer:edit")
    @ResponseBody
    @PostMapping("/state")
    public LayResult state(int id, boolean state) {
        ReturnT<String> returnT;
        if (state) {
            returnT = jobService.start(id);
        } else {
            returnT = jobService.stop(id);
        }
        if (returnT.getCode() == 200)
            return ok();
        else
            return error(returnT.getMsg());
    }

    @RequiresPermissions("tool:timer:edit")
    @PostMapping("/trigger")
    @ResponseBody
    //@PermissionLimit(limit = false)
    public LayResult triggerJob(int id, String param, String address) {
        // force cover job param
        if (param == null) {
            param = "";
        }

        JobTriggerPoolHelper.trigger(id, TriggerTypeEnum.MANUAL, -1, null, param, address);
        return ok();
    }

    @RequiresPermissions("tool:timer:add")
    @PostMapping("/group/add")
    @ResponseBody
    public LayResult addG(XxlJobGroup group) {
        group.setAddressType(1);
        return toAjax(jobGroupMapper.save(group));
    }

    @RequiresPermissions("tool:timer:edit")
    @PostMapping("/group/change")
    @ResponseBody
    public LayResult changeGroup(XxlJobInfo jobInfo) {
        return toAjax(jobService.changeGroup(jobInfo));
    }

    @RequiresPermissions("tool:timer:add")
    @PostMapping("/add")
    @ResponseBody
    public LayResult addP(XxlJobInfo jobInfo) {
        jobInfo.setJobGroup(1);
        jobInfo.setScheduleType("CRON");
        jobInfo.setMisfireStrategy("DO_NOTHING");
        jobInfo.setExecutorRouteStrategy("FIRST");
        jobInfo.setExecutorBlockStrategy("SERIAL_EXECUTION");
        jobInfo.setGlueType("BEAN");
        jobInfo.setGlueSource("");
        jobInfo.setGlueRemark("GLUE代码初始化");
        jobInfo.setChildJobId("");
        return toAjax(jobInfoMapper.save(jobInfo));
    }

    @RequiresPermissions("tool:timer:edit")
    @PostMapping("/edit")
    @ResponseBody
    public LayResult editP(XxlJobInfo jobInfo) {

        return toAjax(jobInfoMapper.updateBaseInfo(jobInfo));
    }


    @RequiresPermissions("tool:timer:del")
    @PostMapping("/del")
    @ResponseBody
    public LayResult delP(int id) {
        ReturnT<String> returnT = jobService.remove(id);
        if (returnT.getCode() == 200) {
            return ok(returnT.getMsg());
        } else {
            return error(returnT.getMsg());
        }
    }
}
