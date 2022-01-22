package com.lk;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class LKAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(LKAdminApplication.class, args);
        System.out.println("---------------启动成功---------------");
    }

}