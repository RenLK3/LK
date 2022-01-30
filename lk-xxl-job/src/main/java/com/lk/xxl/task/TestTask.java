package com.lk.xxl.task;

import com.xxl.job.core.handler.annotation.XxlJob;
import org.springframework.context.annotation.Bean;

public class TestTask {

    @XxlJob("demoJobHandler")
    public void demoJobHandler() throws Exception {
        System.out.println("--------> Hello <-------");
    }
}
