package com.lk.common.core.domain.vo;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.lk.common.core.domain.entity.BaseEntity;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.ArrayList;
import java.util.List;


@ColumnWidth(30)
public class MenuExcelVO extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 菜单ID
     */
    @ExcelProperty("菜单ID")
    private Long menuId;

    /**
     * 菜单名称
     */
    @ExcelProperty("菜单名称")
    private String menuName;

    /**
     * 父菜单名称
     */
    @ExcelProperty("父菜单名称")
    private String parentName;

    /**
     * 父菜单ID
     */
    @ExcelProperty("父菜单ID")
    private Long parentId;

    /**
     * 显示顺序
     */
    @ExcelProperty("显示顺序")
    private Long orderNum;

    /**
     * 菜单URL
     */
    @ExcelProperty("菜单URL")
    private String url;

    /**
     * 级别
     */
    @ExcelProperty("级别")
    private Long level;

    /**
     * 类型（M目录 C菜单 F按钮）
     */
    @ExcelProperty("类型（M目录 C菜单 F按钮）")
    private String menuType;

    /**
     * 菜单状态（0显示 1隐藏）
     */
    @ExcelProperty("菜单状态（0显示 1隐藏）")
    private String visible;

    /**
     * 权限字符串
     */
    @ExcelProperty("权限字符串")
    private String perms;

    /**
     * 菜单图标
     */
    @ExcelProperty("菜单图标")
    private String icon;

    /**
     * 子菜单
     */
//    @ExcelProperty("子菜单")
//    private List<MenuExcelVO> children = new ArrayList<MenuExcelVO>();

    public Long getMenuId() {
        return menuId;
    }

    public void setMenuId(Long menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Long getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Long orderNum) {
        this.orderNum = orderNum;
    }

    public Long getLevel() {
        return level;
    }

    public void setLevel(Long level) {
        this.level = level;
    }

    //    @NotBlank(message = "显示顺序不能为空")
//    public String getOrderNum()
//    {
//        return orderNum;
//    }
//
//    public void setOrderNum(String orderNum)
//    {
//        this.orderNum = orderNum;
//    }

    //    @Size(min = 0, max = 200, message = "请求地址不能超过200个字符")
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

//    public String getTarget()
//    {
//        if (StringUtils.isEmpty(target))
//        {
//            return StringUtils.EMPTY;
//        }
//        return target;
//    }
//
//    public void setTarget(String target)
//    {
//        this.target = target;
//    }

    //    @NotBlank(message = "菜单类型不能为空")
    public String getMenuType() {
        return menuType;
    }

    public void setMenuType(String menuType) {
        this.menuType = menuType;
    }

    public String getVisible() {
        return visible;
    }

    public void setVisible(String visible) {
        this.visible = visible;
    }

//    public String getIsRefresh()
//    {
//        return isRefresh;
//    }
//
//    public void setIsRefresh(String isRefresh)
//    {
//        this.isRefresh = isRefresh;
//    }

    //    @Size(min = 0, max = 100, message = "权限标识长度不能超过100个字符")
    public String getPerms() {
        if (StringUtils.isEmpty(perms)) {
            return StringUtils.EMPTY;
        }
        return perms;
    }

    public void setPerms(String perms) {
        this.perms = perms;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

//    public List<MenuExcelVO> getChildren() {
//        return children;
//    }

//    public void setChildren(List<MenuExcelVO> children) {
//        this.children = children;
//    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("menuId", getMenuId())
                .append("menuName", getMenuName())
                .append("parentId", getParentId())
                //.append("orderNum", getOrderNum())
                .append("url", getUrl())
                //.append("target", getTarget())
                .append("menuType", getMenuType())
                .append("visible", getVisible())
                .append("perms", getPerms())
                .append("icon", getIcon())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
