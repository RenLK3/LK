package com.lk.common.core.domain.vo;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.lk.common.core.domain.entity.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@ColumnWidth(30)
public class DeptExcelVO extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 部门ID */
    @ExcelProperty("部门ID")
    private Long deptId;

    /** 父部门ID */
    @ExcelProperty("父部门ID")
    private Long parentId;

    /** 部门名称 */
    @ExcelProperty("部门名称")
    private String deptName;

    /** 父部门名称 */
    @ExcelProperty("父部门名称")
    private String parentName;

    /** 排除编号 */
    @ExcelProperty("排除编号")
    private Long excludeId;

    public Long getDeptId()
    {
        return deptId;
    }

    public void setDeptId(Long deptId)
    {
        this.deptId = deptId;
    }

    public Long getParentId()
    {
        return parentId;
    }

    public void setParentId(Long parentId)
    {
        this.parentId = parentId;
    }

//    @NotBlank(message = "部门名称不能为空")
//    @Size(min = 0, max = 30, message = "部门名称长度不能超过30个字符")
    public String getDeptName()
    {
        return deptName;
    }

    public void setDeptName(String deptName)
    {
        this.deptName = deptName;
    }

    public String getParentName()
    {
        return parentName;
    }

    public void setParentName(String parentName)
    {
        this.parentName = parentName;
    }

    @JsonIgnore
    public Long getExcludeId()
    {
        return excludeId;
    }

    public void setExcludeId(Long excludeId)
    {
        this.excludeId = excludeId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("deptId", getDeptId())
            .append("parentId", getParentId())
            .append("deptName", getDeptName())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
