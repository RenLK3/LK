package com.lk;

import com.lk.xxl.domain.XxlJobLog;
import com.lk.xxl.mapper.XxlJobLogMapper;
import com.lk.xxl.service.XxlJobService;
import com.xxl.job.core.biz.model.ReturnT;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.*;

@SpringBootTest
class LKAdminApplicationTests {


    @Autowired
    private XxlJobService jobService;


    @Autowired
    private XxlJobLogMapper jobLogMapper;

    @Test
    void contextLoads() {

        List<XxlJobLog> logs =  jobLogMapper.selectLogList();
        System.out.println(logs);
    }


}
