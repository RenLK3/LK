package com.lk.framework.web.service;

import com.alibaba.fastjson.JSONArray;
import com.lk.common.core.domain.entity.SysRole;
import com.lk.common.utils.ShiroUtils;
import com.lk.common.utils.spring.SpringUtils;
import com.lk.system.mapper.SysMessageMapper;
import com.lk.system.mapper.SysUserMapper;
import com.lk.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 * @author LiKe_Ren
 */
@Service("html")
public class HtmlService {

    /**
     * 转换成html文本
     * @param list
     * @param <T>
     * @return
     */
    public <T> String toHtmlText(List<T> list) {
        if (list == null || list.size() == 0) return "[]";
        JSONArray jsonArray = new JSONArray((List<Object>) list);

        return jsonArray.toJSONString();
    }

    /**
     * 获取未读的消息数
     * @return
     */
    public int unreadCount() {
        return SpringUtils.getBean(SysMessageMapper.class).selectUnreadMessageSize(ShiroUtils.getSysUser().getUserId());
    }

    /**
     * 获取登录的用户的角色最大级别
     * @return
     */
    public Long getLoginRoleLevel(){
        return ShiroUtils.getSysUser().maxLevel();
    }

    /**
     * 获取某个用户的角色最大级别
     * @param userId
     * @return
     */
    public Long getRoleMaxLevel(Long userId){
        return SpringUtils.getBean(ISysUserService.class).selectUserById(userId).maxLevel();
    }

    /**
     * 获取登录的用户id
     * @return
     */
    public Long getLoginUserId(){
        return ShiroUtils.getUserId();
    }
}
