package com.lk;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.JSONSerializer;
import com.lk.common.core.domain.JSTree;
import com.lk.common.core.domain.entity.SysDept;
import com.lk.common.core.domain.entity.SysMenu;
import com.lk.common.core.domain.entity.SysUser;
import com.lk.framework.config.LKConfig;
import com.lk.framework.shiro.service.SysPasswordService;
import com.lk.framework.web.domain.Server;
import com.lk.framework.web.domain.server.Cpu;
import com.lk.framework.web.domain.server.Mem;
import com.lk.system.domain.SysMessage;
import com.lk.system.mapper.SysMessageMapper;
import com.lk.system.service.ISysMenuService;
import com.lk.system.service.ISysRoleService;
import com.lk.xxl.domain.XxlJobInfo;
import com.lk.xxl.service.XxlJobService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import oshi.SystemInfo;
import oshi.hardware.CentralProcessor;
import oshi.hardware.GlobalMemory;
import oshi.hardware.HardwareAbstractionLayer;
import oshi.util.Util;

import java.awt.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@SpringBootTest
class LKAdminApplicationTests {

    /**
     * path
     */
    @Value("${share.upload}")
    private String upload;

    @Value("${share.maxSize}")
    private String maxSize;

    @Autowired
    private XxlJobService jobService;

    @Test
    void contextLoads() {
        int page = 1;
        int limit = 10;
        Map<String,Object> map = jobService.pageList(((page-1)*limit),((page*limit)),1,0,null,null,null);
        List<XxlJobInfo> xxlJobInfoList = (List<XxlJobInfo>) map.get("data");

//        String ll = LKAdminApplicationTests.size;
        System.out.println(LKConfig.getProfile());
    }


}
