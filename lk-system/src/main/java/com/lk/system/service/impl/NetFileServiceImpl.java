package com.lk.system.service.impl;

import com.lk.system.domain.SysShare;
import com.lk.system.service.INetFileService;
import com.lk.system.service.ISysShareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

@Service
public class NetFileServiceImpl implements INetFileService {

    @Autowired
    private ISysShareService shareService;

    @Override
    public void downloadFile(Long shareId, HttpServletResponse response) throws IOException {
        SysShare share = shareService.selectShareById(shareId);
        if (share.getType() == 0) {
            throw new IOException("不能下载目录!");
        }
        File file = new File(share.getPath());
        if (file.exists()) {
            response.setContentType("application/force-download");// 设置强制下载不打开
            response.addHeader("Content-Disposition", "attachment;fileName=" + file.getName());
            byte[] buffer = new byte[1024];
            BufferedInputStream bufferedInputStream;
            BufferedOutputStream bufferedOutputStream;

            bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
            bufferedOutputStream = new BufferedOutputStream(response.getOutputStream());
            int len;
            while ((len = bufferedInputStream.read(buffer)) != -1) {
                bufferedOutputStream.write(buffer, 0, len);
            }
            bufferedInputStream.close();
            bufferedOutputStream.close();

        }else{
            throw new IOException("没有找到文件!");
        }
    }
}
