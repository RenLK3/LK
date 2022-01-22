package com.lk.common.core.domain;

import java.util.ArrayList;
import java.util.List;

public class JSTree {
    /**
     * id
     */
    private Long id;
    /**
     * 文本
     */
    private String text;
    /**
     * 图标
     */
    private String icon;

    private String type;

    private Long pId;
    /**
     * 状态
     */
    private State state = new State();

    private Object children = new ArrayList<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Long getpId() {
        return pId;
    }

    public void setpId(Long pId) {
        this.pId = pId;
    }

    public Object getChildren() {
        return children;
    }

    public void setChildren(Object children) {
        this.children = children;
    }

    public static class State{
        private boolean opened ;
        private boolean disabled ;
        //private boolean selected ;
        private boolean checked ;

        public boolean isChecked() {
            return checked;
        }

        public void setChecked(boolean checked) {
            this.checked = checked;
        }

        public boolean isOpened() {
            return opened;
        }

        public void setOpened(boolean opened) {
            this.opened = opened;
        }

        public boolean isDisabled() {
            return disabled;
        }

        public void setDisabled(boolean disabled) {
            this.disabled = disabled;
        }
//        public boolean isDisabled() {
//            return disabled;
//        }
//
//        public void setDisabled(boolean disabled) {
//            this.disabled = disabled;
//        }

//        public boolean isSelected() {
//            return selected;
//        }
//
//        public void setSelected(boolean selected) {
//            this.selected = selected;
//        }
    }
}
