package com.lk.system.mapper;

import com.lk.common.core.domain.entity.SysDept;
import com.lk.system.domain.SysShare;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 共享管理 数据层
 *
 * @author lk
 */
public interface SysShareMapper {
    /**
     * 获取目录类型
     *
     * @return
     */
    public List<SysShare> selectDirectionList();

    /**
     * 获取文件类型
     *
     * @return
     */
    public List<SysShare> selectFileList();

    /**
     * 查询共享信息
     *
     * @param share 信息
     * @return 结果
     */
    public List<SysShare> selectShareList(SysShare share);

    /**
     * 新增共享信息
     *
     * @param share 信息
     * @return 结果
     */
    public int insertShare(SysShare share);


    /**
     * 修改信息
     *
     * @param share 信息
     * @return 结果
     */
    public int updateShare(SysShare share);

    /**
     * 删除信息
     *
     * @param shareId ID
     * @return 结果
     */
    public int deleteShareById(Long shareId);
}
