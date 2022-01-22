package com.lk.system.domain;

import java.util.Date;
import java.util.Objects;

public class SysMessage {
    private static final long serialVersionUID = 1L;
    /**
     * 用户id
     */
    private Long userId;
    /**
     * 通知id
     */
    private Long noticeId;
    /**
     * 更新时间
     */
    private Date updateTime;

    public SysMessage() {
    }

    public SysMessage(Long userId, Long noticeId, Date updateTime) {
        this.userId = userId;
        this.noticeId = noticeId;
        this.updateTime = updateTime;
    }

    public SysMessage(Long userId) {
        this.userId = userId;
    }

    public SysMessage(Long userId, Long noticeId) {
        this.userId = userId;
        this.noticeId = noticeId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Long noticeId) {
        this.noticeId = noticeId;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "SysMessage{" +
                "userId=" + userId +
                ", noticeId=" + noticeId +
                ", updateTime=" + updateTime +
                '}';
    }
}
