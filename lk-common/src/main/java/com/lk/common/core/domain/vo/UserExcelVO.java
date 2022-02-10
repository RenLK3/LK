package com.lk.common.core.domain.vo;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.lk.common.core.domain.entity.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.List;

//@Data
@ColumnWidth(30)
public class UserExcelVO extends BaseEntity {
    private static final long serialVersionUID = 1L;

    @ExcelProperty("用户ID")
    private Long userId;

    /** 部门ID */
    @ExcelProperty("部门ID")
    private Long deptId;

    /** 登录名称 */
    @ExcelProperty("登录名称")
    private String loginName;

    /** 用户名称 */
    @ExcelProperty("用户名称")
    private String userName;

    /** 用户性别 */
    @ExcelProperty("用户性别")
    private String sex;

    /** 密码 */
    @ExcelProperty("密码")
    private String password;

    /** 帐号状态（0正常 1停用） */
    @ExcelProperty("帐号状态（0正常 1停用）")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    @ExcelProperty("删除标志（0代表存在 2代表删除）")
    private String delFlag;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }
}
