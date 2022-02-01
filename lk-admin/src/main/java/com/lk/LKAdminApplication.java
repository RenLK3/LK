package com.lk;

import com.lk.xxl.executor.annotation.EnablePigXxlJob;
import com.xxl.job.core.context.XxlJobHelper;
import com.xxl.job.core.executor.impl.XxlJobSpringExecutor;
import com.xxl.job.core.handler.annotation.XxlJob;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.Bean;

import java.util.concurrent.TimeUnit;


@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class LKAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(LKAdminApplication.class, args);
        System.out.println("---------------启动成功---------------");
    }

}