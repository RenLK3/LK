package com.lk.common.core.controller;



import com.lk.common.core.domain.LayResult;
import com.lk.common.core.domain.entity.SysUser;
import com.lk.common.utils.ShiroUtils;
import com.lk.common.utils.StringUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * web层通用控制器基类
 *
 * @author LiKe_Ren
 */
public class BaseController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    public LayResult ok() {
        return LayResult.ok();
    }

    public LayResult ok(String msg){
        return new LayResult(msg);
    }

    public LayResult error() {
        return LayResult.error();
    }

    public LayResult error(String msg){
        return LayResult.error(msg);
    }

    public <T> LayResult page(List<T> data, int page, int limit){
        return LayResult.page(data,page,limit);
    }

    public LayResult toAjax(int rows){
        return rows == 0 ? error() : ok();
    }

    public LayResult toAjax(boolean res){
        return res  ? ok():  error() ;
    }
    /**
     * 页面跳转
     */
    public String redirect(String url)
    {
        return StringUtils.format("redirect:{}", url);
    }

    /**
     * 获取用户缓存信息
     */
    public SysUser getSysUser()
    {
        return ShiroUtils.getSysUser();
    }

    /**
     * 设置用户缓存信息
     */
    public void setSysUser(SysUser user)
    {
        ShiroUtils.setSysUser(user);
    }

    /**
     * 获取登录用户id
     */
    public Long getUserId()
    {
        return getSysUser().getUserId();
    }

    /**
     * 获取登录用户名
     */
    public String getLoginName()
    {
        return getSysUser().getLoginName();
    }
}
