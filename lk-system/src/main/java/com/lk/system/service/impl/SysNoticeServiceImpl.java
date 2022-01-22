package com.lk.system.service.impl;

import com.lk.system.mapper.SysNoticeMapper;
import com.lk.system.service.ISysNoticeService;
import com.lk.common.core.domain.entity.SysNotice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysNoticeServiceImpl implements ISysNoticeService {

    @Autowired
    private SysNoticeMapper noticeMapper;

    /**
     * 根据条件分页查询
     *
     * @param notice@return 信息集合信息
     */
    @Override
    public List<SysNotice> selectNoticeList(SysNotice notice) {
        return noticeMapper.selectNoticeList(notice);
    }

    /**
     * 通过用户ID查询
     *
     * @param noticeId@return 对象信息
     */
    @Override
    public SysNotice selectNoticeById(Long noticeId) {
        return noticeMapper.selectNoticeById(noticeId);
    }

    /**
     * 通过ID删除
     *
     * @param noticeId@return 结果
     */
    @Override
    public int deleteNoticeById(Long noticeId) {
        return noticeMapper.deleteNoticeById(noticeId);
    }

    /**
     * 修改信息
     *
     * @param notice@return 结果
     */
    @Override
    public int updateNotice(SysNotice notice) {
        return noticeMapper.updateNotice(notice);
    }

    /**
     * 新增信息
     *
     * @param notice@return 结果
     */
    @Override
    public int insertNotice(SysNotice notice) {
        return noticeMapper.insertNotice(notice);
    }

}
