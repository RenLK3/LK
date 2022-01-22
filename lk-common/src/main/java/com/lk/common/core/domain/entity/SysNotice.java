package com.lk.common.core.domain.entity;

public class SysNotice extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /**  id */
    private Long noticeId;

    /**  名称 */
    private String name;

    /**  标题 */
    private String title;

    /**  内容 */
    private String content;

    /**  类型 */
    private String type;

    /**  状态 */
    private String status;

    public Long getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Long noticeId) {
        this.noticeId = noticeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "SysNotice{" +
                "noticeId=" + noticeId +
                ", name='" + name + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", type='" + type + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
