package com.lk;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.JSONSerializer;
import com.lk.common.core.domain.JSTree;
import com.lk.common.core.domain.entity.SysDept;
import com.lk.common.core.domain.entity.SysMenu;
import com.lk.common.core.domain.entity.SysUser;
import com.lk.framework.shiro.service.SysPasswordService;
import com.lk.framework.web.domain.Server;
import com.lk.framework.web.domain.server.Cpu;
import com.lk.framework.web.domain.server.Mem;
import com.lk.system.domain.SysMessage;
import com.lk.system.mapper.SysMessageMapper;
import com.lk.system.service.ISysMenuService;
import com.lk.system.service.ISysRoleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.util.stream.Collectors;

@SpringBootTest
class LKAdminApplicationTests {

    @Autowired
    private ISysRoleService roleService;

    @Autowired
    private SysPasswordService passwordService;
    private static final int OSHI_WAIT_SECOND = 1000;
    /**
     * 设置CPU信息
     */
    private void setCpuInfo(CentralProcessor processor, Cpu cpu)
    {
        // CPU信息
        long[] prevTicks = processor.getSystemCpuLoadTicks();
        Util.sleep(OSHI_WAIT_SECOND);
        long[] ticks = processor.getSystemCpuLoadTicks();
        long nice = ticks[CentralProcessor.TickType.NICE.getIndex()] - prevTicks[CentralProcessor.TickType.NICE.getIndex()];
        long irq = ticks[CentralProcessor.TickType.IRQ.getIndex()] - prevTicks[CentralProcessor.TickType.IRQ.getIndex()];
        long softirq = ticks[CentralProcessor.TickType.SOFTIRQ.getIndex()] - prevTicks[CentralProcessor.TickType.SOFTIRQ.getIndex()];
        long steal = ticks[CentralProcessor.TickType.STEAL.getIndex()] - prevTicks[CentralProcessor.TickType.STEAL.getIndex()];
        long cSys = ticks[CentralProcessor.TickType.SYSTEM.getIndex()] - prevTicks[CentralProcessor.TickType.SYSTEM.getIndex()];
        long user = ticks[CentralProcessor.TickType.USER.getIndex()] - prevTicks[CentralProcessor.TickType.USER.getIndex()];
        long iowait = ticks[CentralProcessor.TickType.IOWAIT.getIndex()] - prevTicks[CentralProcessor.TickType.IOWAIT.getIndex()];
        long idle = ticks[CentralProcessor.TickType.IDLE.getIndex()] - prevTicks[CentralProcessor.TickType.IDLE.getIndex()];
        long totalCpu = user + nice + cSys + idle + iowait + irq + softirq + steal;
        cpu.setCpuNum(processor.getLogicalProcessorCount());
        cpu.setTotal(totalCpu);
        cpu.setSys(cSys);
        cpu.setUsed(user);
        cpu.setWait(iowait);
        cpu.setFree(idle);
    }

    /**
     * 设置内存信息
     */
    private void setMemInfo(GlobalMemory memory, Mem mem)
    {
        mem.setTotal(memory.getTotal());
        mem.setUsed(memory.getTotal() - memory.getAvailable());
        mem.setFree(memory.getAvailable());
    }


    @Test
    void contextLoads() {
        Server server = new Server();
        SystemInfo si = new SystemInfo();
        HardwareAbstractionLayer hal = si.getHardware();
        Long start = System.currentTimeMillis();
        setCpuInfo(hal.getProcessor(),server.getCpu());
        Long end = System.currentTimeMillis();

        System.out.println(JSONObject.toJSON(server.getCpu()) );
        System.out.println(((end - start) ) + " 毫秒");

        setMemInfo(hal.getMemory(),server.getMem());
        Long end1 = System.currentTimeMillis();
        System.out.println(JSONObject.toJSON(server.getMem()) );
        System.out.println(((end1 - end) ) + " 毫秒");




        System.out.println();
    }


}
