package com.lk.common.core.domain;

import java.util.ArrayList;
import java.util.List;

public class XmSelect {
    /**
     * 名称
     */
    private String name;
    /**
     * 值
     */
    private Long value;
    /**
     * 选中
     */
    private Boolean selected = false;
    /**
     * 不可用
     */
    private Boolean disabled;
    /**
     * 子列表
     */
    private List<XmSelect> children = new ArrayList<>();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getValue() {
        return value;
    }

    public void setValue(Long value) {
        this.value = value;
    }

    public Boolean getSelected() {
        return selected;
    }

    public void setSelected(Boolean selected) {
        this.selected = selected;
    }

    public Boolean getDisabled() {
        return disabled;
    }

    public void setDisabled(Boolean disabled) {
        this.disabled = disabled;
    }

    public List<XmSelect> getChildren() {
        return children;
    }

    public void setChildren(List<XmSelect> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "XmSelect{" +
                "name='" + name + '\'' +
                ", value=" + value +
                ", selected=" + selected +
                ", disabled=" + disabled +
                ", children=" + children +
                '}';
    }
}
