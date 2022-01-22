package com.lk.system.mapper;

import com.lk.common.core.domain.entity.SysNotice;
import com.lk.system.domain.SysMessage;

import java.util.List;

/**
 * 消息表 数据层
 * 
 * @author LiKe_Ren
 */

public interface SysMessageMapper
{
    /**
     * 查询未读信息数量
     * @param userId
     * @return
     */
    public int selectUnreadMessageSize(Long userId);
    /**
     * 查询未读的信息
     * @param message
     * @return
     */
    public List<SysNotice> selectMessageUnreadList(SysMessage message);

    /**
     * 查询已读的信息
     * @param message
     * @return
     */
    public List<SysNotice> selectMessageReadList(SysMessage message);

    /**
     * 插入未读的信息
     * @param messages
     * @return
     */
    public int insertUnreadMessageList(List<SysMessage> messages);

    /**
     * 从未读更新到已读信息
     * @param message
     * @return
     */
    public int updateReadMessage(SysMessage message) ;

    /**
     * 从未读更新到已读信息
     * @param id
     * @return
     */
    public int updateReadMessageByUserId(Long id) ;

    /**
     * 根据用户id删除已读的信息
     * @param id
     * @return
     */
    public int deleteReadMessageByUserId(Long id);

    /**
     * 根据用户id删除未读的信息
     * @param id
     * @return
     */
    public int deleteUnreadMessageByUserId(Long id);

    /**
     * 根据通知id删除已读的信息
     * @param messages
     * @return
     */
    public int deleteReadMessageList(List<SysMessage> messages);

    /**
     * 根据用户id删除未读的信息
     * @param messages
     * @return
     */
    public int deleteUnreadMessageList(List<SysMessage> messages);
}
