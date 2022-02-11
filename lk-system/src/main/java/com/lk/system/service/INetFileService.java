package com.lk.system.service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface INetFileService {
    void downloadFile(Long shareId,HttpServletResponse response) throws IOException;
}
