package com.lk.system.service.impl;

import com.lk.system.domain.SysShare;
import com.lk.system.mapper.SysShareMapper;
import com.lk.system.service.ISysShareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
public class SysShareServiceImpl implements ISysShareService {

    @Autowired
    private SysShareMapper shareMapper;

    /**
     * 获取目录类型
     *
     * @return
     */
    @Override
    public List<SysShare> selectDirectionList() {
        return shareMapper.selectDirectionList();
    }

    /**
     * 获取文件类型
     *
     * @return
     */
    @Override
    public List<SysShare> selectFileList() {
        return shareMapper.selectFileList();
    }

    /**
     * 查询共享信息
     *
     * @param share 信息
     * @return 结果
     */
    @Override
    public List<SysShare> selectShareList(SysShare share) {
        return shareMapper.selectShareList(share);
    }

    @Override
    public SysShare selectShareById(Long shareId) {
        return shareMapper.selectShareById(shareId);
    }

    public String parsePath(Long shareId) {
        Long sId = shareId;
        String path = "";
        while (true) {
            SysShare share = shareMapper.selectShareById(sId);
            if ((sId = share.getParentId()) == -1L) {
                path = "/" + share.getName() + path;
                break;
            } else {
                path = "/" + share.getName() + path;
            }
        }
        return path;
    }

    /**
     * 新增共享信息
     *
     * @param share 信息
     * @return 结果
     */
    @Override
    public int insertDirectionShare(SysShare share) {
        share.setType(0);
//        share.setPath(parsePath(share.getParentId()) + "/" + share.getName());
        return shareMapper.insertShare(share);
    }

    @Override
    public int insertFileShare(SysShare share) {
        share.setType(1);
//        share.setPath(parsePath(share.getParentId()) + "/" + share.getName());
        return shareMapper.insertShare(share);
    }

    /**
     * 修改信息
     *
     * @param share 信息
     * @return 结果
     */
    @Override
    public int updateShare(SysShare share) {
//        share.setPath(parsePath(share.getParentId()) + "/" + share.getName());
        return shareMapper.updateShare(share);
    }

    /**
     * 删除信息
     *
     * @param shareId ID
     * @return 结果
     */
    @Override
    public int deleteShareById(Long shareId) {
        SysShare share = shareMapper.selectShareById(shareId);
        List<Long> ids = new ArrayList<>();
        ids.add(share.getShareId());
        if(share.getType() == 0){
            reptile(share,ids);
        }else{
            new File(share.getPath()).delete();
        }
        for (Long id:ids) {
            shareMapper.deleteShareById(id);
        }
        return ids.size();
    }

    private void reptile(SysShare share,List<Long> ids){
        SysShare sysShare = new SysShare();
        sysShare.setParentId(share.getShareId());
        List<SysShare> childShare = shareMapper.selectShareList(sysShare);
        for (SysShare s: childShare) {
            ids.add(s.getShareId());
            reptile(s,ids);
        }
    }
}
