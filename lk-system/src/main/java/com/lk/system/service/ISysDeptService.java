package com.lk.system.service;

import com.lk.common.core.domain.entity.SysDept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 部门管理 服务层
 *
 */
public interface ISysDeptService {
    /**
     * 查询部门
     * @param dept 部门信息
     * @return 部门信息集合
     */
    public List<SysDept> selectDeptList(SysDept dept);

    /**
     * 删除部门
     *
     * @param deptId 部门ID
     * @return 结果
     */
    public int deleteDeptById(Long deptId);

    /**
     * 新增部门
     *
     * @param dept 部门信息
     * @return 结果
     */
    public int insertDept(SysDept dept);

    /**
     * 修改部门
     *
     * @param dept 部门信息
     * @return 结果
     */
    public int updateDept(SysDept dept);

    /**
     * 更新部门
     *
     * @param deptId
     * @param userId
     * @return
     */
    public int updateUserDept(@Param("userId") Long[] userId, @Param("deptId") Long deptId);
}
