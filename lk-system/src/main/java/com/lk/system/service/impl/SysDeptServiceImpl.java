package com.lk.system.service.impl;

import com.lk.system.service.ISysDeptService;
import com.lk.common.constant.UserConstants;
import com.lk.common.core.domain.entity.SysDept;
import com.lk.common.exception.ServiceException;
import com.lk.system.mapper.SysDeptMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 部门管理 服务实现
 *
 */
@Service
public class SysDeptServiceImpl implements ISysDeptService
{
    @Autowired
    private SysDeptMapper deptMapper;

    /**
     * 查询部门
     * 
     * @param dept 部门信息
     * @return 部门信息集合
     */
    @Override
    public List<SysDept> selectDeptList(SysDept dept)
    {
        return deptMapper.selectDeptList(dept);
    }


    /**
     * 删除部门
     * 
     * @param deptId 部门ID
     * @return 结果
     */
    @Override
    public int deleteDeptById(Long deptId)
    {
        deptMapper.deleteUserAllDeptId(deptId);
        return deptMapper.deleteDeptById(deptId);
    }

    /**
     * 新增部门
     * 
     * @param dept 部门信息
     * @return 结果
     */
    @Override
    public int insertDept(SysDept dept)
    {
        return deptMapper.insertDept(dept);
    }

    /**
     * 修改部门
     * 
     * @param dept 部门信息
     * @return 结果
     */
    @Override
    @Transactional
    public int updateDept(SysDept dept)
    {
        return deptMapper.updateDept(dept);
    }

    /**
     * 更新部门
     *
     * @param deptId
     * @param userId
     * @return
     */
    @Override
    public int updateUserDept( Long[] userId,  Long deptId) {
        return deptMapper.updateUserDept(userId,deptId);
    }
}
