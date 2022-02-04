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
import com.lk.system.domain.SysShare;
import com.lk.system.mapper.SysMessageMapper;
import com.lk.system.mapper.SysShareMapper;
import com.lk.system.service.ISysMenuService;
import com.lk.system.service.ISysRoleService;
import com.lk.system.service.ISysShareService;
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
import java.util.*;
import java.util.List;
import java.util.stream.Collectors;

@SpringBootTest
class LKAdminApplicationTests {


    @Autowired
    private SysShareMapper shareMapper;

    private void reptile(SysShare share, List<Long> ids) {
        SysShare sysShare = new SysShare();
        sysShare.setParentId(share.getShareId());
        List<SysShare> childShare = shareMapper.selectShareList(sysShare);
        for (SysShare s : childShare) {
            ids.add(s.getShareId());
            reptile(s, ids);
        }
    }

    @Test
    void contextLoads() {
        System.out.println(SysUser.battleLevel(1L,2L));
        System.out.println(SysUser.battleLevel(2L,2L));;
        System.out.println(SysUser.battleLevel(3L,2L));;
        System.out.println(SysUser.battleLevel(1L,2L));;
    }


}
