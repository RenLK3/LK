package com.lk.system.service;

import com.lk.system.domain.SysShare;

import java.util.List;

public interface ISysShareService {

    public SysShare selectShareById(Long shareId);

    public String parsePath(Long shareId);

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
    public int insertDirectionShare(SysShare share);


    public int insertFileShare(SysShare share);

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
