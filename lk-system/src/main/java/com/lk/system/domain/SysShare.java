package com.lk.system.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.lk.common.core.domain.entity.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;


/**
 * 共享文件表 sys_share
 * 
 * @author lk
 */
public class SysShare extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long shareId;

    /** 父ID */
    private Long parentId;

    /** 名称 */
    private String name;

    /** 类型 */
    private Integer type;

    /** 路径 */
    private String path;

    /** 级别 */
    private Integer level;

    /** 大小 */
    private Long size;

    public Long getShareId() {
        return shareId;
    }

    public void setShareId(Long shareId) {
        this.shareId = shareId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "SysShare{" +
                "shareId=" + shareId +
                ", parentId=" + parentId +
                ", name='" + name + '\'' +
                ", type=" + type +
                ", path='" + path + '\'' +
                ", level=" + level +
                ", size=" + size +
                '}';
    }
}
