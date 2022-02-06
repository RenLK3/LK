package com.lk;

import com.lk.common.utils.spring.SpringUtils;
import com.lk.xxl.domain.XxlJobGroup;
import com.lk.xxl.domain.XxlJobLog;
import com.lk.xxl.domain.XxlJobRegistry;
import com.lk.xxl.mapper.XxlJobGroupMapper;
import com.lk.xxl.mapper.XxlJobLogMapper;
import com.lk.xxl.mapper.XxlJobRegistryMapper;
import com.lk.xxl.service.XxlJobService;
import com.lk.xxl.task.TestTask;
import com.xxl.job.core.biz.model.ReturnT;
import com.xxl.job.core.handler.annotation.XxlJob;
import io.swagger.annotations.ApiOperation;
import org.junit.jupiter.api.Test;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.annotation.AnnotatedElementUtils;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternUtils;
import org.springframework.core.type.AnnotationMetadata;
import org.springframework.core.type.MethodMetadata;
import org.springframework.core.type.classreading.CachingMetadataReaderFactory;
import org.springframework.core.type.classreading.MetadataReader;
import org.springframework.core.type.classreading.MetadataReaderFactory;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.RequestHandler;
import springfox.documentation.builders.RequestHandlerSelectors;

import java.util.*;
import java.util.function.Predicate;

@SpringBootTest
class LKAdminApplicationTests {


    @Autowired
    private XxlJobService jobService;


    @Autowired
    private XxlJobLogMapper jobLogMapper;


    @Autowired
    private XxlJobGroupMapper jobGroupMapper;

    @Autowired
    private ResourceLoader resourceLoader;

    private static final String VALUE = "value";

    @Test
    void contextLoads() throws Exception {

        System.out.println();

    }


}
