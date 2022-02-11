package com.lk.framework.aspect;

import com.alibaba.fastjson.JSONObject;
import com.lk.framework.manager.AsyncManager;
import com.lk.framework.manager.factory.AsyncFactory;
import com.lk.common.annotation.Log;
import com.lk.common.core.domain.entity.SysUser;
import com.lk.common.enums.BusinessStatus;
import com.lk.common.utils.ServletUtils;
import com.lk.common.utils.ShiroUtils;
import com.lk.common.utils.StringUtils;
import com.lk.system.domain.SysOperLog;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.Map;

/**
 * 面向切面 AOP
 * 通过预编译或运行时动态代理，进行统一管理
 */
@Aspect  // 切面供容器读取
@Component
public class LogAspect {
    private static final Logger log = LoggerFactory.getLogger(LogAspect.class);

    // 配置触发注解
    @Pointcut("@annotation(com.lk.common.annotation.Log)")
    public void logPointCut() {
    }

    // 执行之后统一获取
    @AfterReturning(pointcut = "@annotation(log)", returning = "jsonResult")
    public void doAfterReturning(JoinPoint joinPoint, Log log, Object jsonResult) {
        handleLog(joinPoint, log, null, jsonResult);
    }

    // 执行之前统一获取
//    @Before("@annotation(log)")
//    public void doBefore(JoinPoint joinPoint, Log log) {
//        //System.out.println(joinPoint);
//        System.out.println(log);
//        //log.startTime = System.currentTimeMillis();
//    }

    // 返回之后统一获取
    @AfterThrowing(pointcut = "@annotation(log)", throwing = "e")
    public void doAfterReturning(JoinPoint joinPoint, Log log, Exception e) {
        handleLog(joinPoint, log, e, null);
    }


    protected void handleLog(final JoinPoint joinPoint, Log controllerLog, final Exception e, Object jsonResult) {
        try {
            // 获取当前的用户
            SysUser currentUser = ShiroUtils.getSysUser();

            // *========数据库日志=========*//
            SysOperLog operLog = new SysOperLog();
            operLog.setStatus(BusinessStatus.SUCCESS.ordinal());
            // 请求的地址
            String ip = ShiroUtils.getIp();
            operLog.setOperIp(ip);
            operLog.setOperUrl(ServletUtils.getRequest().getRequestURI());
            if (currentUser != null) {
                operLog.setOperName(currentUser.getLoginName());
                if (StringUtils.isNotNull(currentUser.getDept())
                        && StringUtils.isNotEmpty(currentUser.getDept().getDeptName())) {
                    operLog.setDeptName(currentUser.getDept().getDeptName());
                }
            }

            if (e != null) {
                operLog.setStatus(BusinessStatus.FAIL.ordinal());
                operLog.setErrorMsg(StringUtils.substring(e.getMessage(), 0, 2000));
            }
            // 设置方法名称
            String className = joinPoint.getTarget().getClass().getName();
            String methodName = joinPoint.getSignature().getName();
            operLog.setMethod(className + "." + methodName + "()");
            // 设置请求方式
            operLog.setRequestMethod(ServletUtils.getRequest().getMethod());
            operLog.setCreateBy(ShiroUtils.getLoginName());
            operLog.setCreateTime(new Date());
            // 处理设置注解上的参数
            getControllerMethodDescription(joinPoint, controllerLog, operLog, jsonResult);
            // 保存数据库
            AsyncManager.me().execute(AsyncFactory.recordOper(operLog));
        } catch (Exception exp) {
            // 记录本地异常日志
            log.error("==前置通知异常==");
            log.error("异常信息:{}", exp.getMessage());
            exp.printStackTrace();
        }
    }

    /**
     * 获取注解中对方法的描述信息 用于Controller层注解
     *
     * @param log     日志
     * @param operLog 操作日志
     * @throws Exception
     */
    public void getControllerMethodDescription(JoinPoint joinPoint, Log log, SysOperLog operLog, Object jsonResult) throws Exception {
        // 设置action动作
        operLog.setBusinessType(log.businessType().ordinal());
        // 设置标题
        operLog.setTitle(log.title());
        // 设置操作人类别
        operLog.setOperatorType(log.operatorType().ordinal());
        // 是否需要保存request，参数和值
        if (log.isSaveRequestData()) {
            // 获取参数的信息，传入到数据库中。
            setRequestValue(joinPoint, operLog);
        }
        // 是否需要保存response，参数和值
        if (log.isSaveResponseData() && StringUtils.isNotNull(jsonResult)) {
            operLog.setJsonResult(StringUtils.substring(JSONObject.toJSONString(jsonResult), 0, 2000));
        }
    }

    /**
     * 获取请求的参数，放到log中
     *
     * @param operLog 操作日志
     * @throws Exception 异常
     */
    private void setRequestValue(JoinPoint joinPoint, SysOperLog operLog) throws Exception {
        Map<String, String[]> map = ServletUtils.getRequest().getParameterMap();
        if (StringUtils.isNotEmpty(map)) {
            String params = JSONObject.toJSONString(map);
            operLog.setOperParam(StringUtils.substring(params, 0, 2000));
        } else {
            Object args = joinPoint.getArgs();
            if (StringUtils.isNotNull(args)) {
                String params = argsArrayToString(joinPoint.getArgs());
                operLog.setOperParam(StringUtils.substring(params, 0, 2000));
            }
        }
    }

    /**
     * 忽略敏感属性
     */
//    public PropertyPreFilters.MySimplePropertyPreFilter excludePropertyPreFilter()
//    {
//        return new PropertyPreFilters().addFilter().addExcludes(EXCLUDE_PROPERTIES);
//    }

    /**
     * 参数拼装
     */
    private String argsArrayToString(Object[] paramsArray) {
        String params = "";
        if (paramsArray != null && paramsArray.length > 0) {
            for (Object o : paramsArray) {
                if (StringUtils.isNotNull(o) /*&& !isFilterObject(o)*/) {
                    try {
                        Object jsonObj = JSONObject.toJSONString(o/*, excludePropertyPreFilter()*/);
                        params += jsonObj.toString() + " ";
                    } catch (Exception e) {
                    }
                }
            }
        }
        return params.trim();
    }
}
