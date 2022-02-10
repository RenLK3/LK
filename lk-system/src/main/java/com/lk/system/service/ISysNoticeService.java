package com.lk.system.service;

import com.lk.common.core.domain.entity.SysNotice;

import java.util.List;


/**
 * 用户 业务层
 * 
 * @author LiKe_Ren
 */
public interface ISysNoticeService
{
    /**
     * 根据条件分页查询
     *
     * @param
     * @return 信息集合信息
     */
    public List<SysNotice> selectNoticeList(SysNotice notice);


    /**
     * 通过用户ID查询
     *
     * @param
     * @return 对象信息
     */
    public SysNotice selectNoticeById(Long noticeId);

    /**
     * 通过ID删除
     *
     * @param
     * @return 结果
     */
    public int deleteNoticeById(Long noticeId);

    /**
     * 修改信息
     *
     * @param
     * @return 结果
     */
    public int updateNotice(SysNotice notice);

    /**
     * 新增信息
     *
     * @param
     * @return 结果
     */
    public int insertNotice(SysNotice notice);

}
