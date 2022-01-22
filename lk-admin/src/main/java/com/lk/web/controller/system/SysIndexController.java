package com.lk.web.controller.system;

import com.lk.common.core.controller.BaseController;
import com.lk.common.core.domain.entity.SysMenu;
import com.lk.common.core.domain.entity.SysUser;
import com.lk.system.service.ISysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * 主页
 * @author LiKe_Ren
 */
@Controller
public class SysIndexController extends BaseController {

    @Autowired
    private ISysMenuService menuService;

    // 系统首页
    @GetMapping("/index")
    public String index(ModelMap mmap)
    {
        // 取身份信息
        SysUser user = getSysUser();
        // 根据用户id取出菜单
        List<SysMenu> menus = menuService.selectMenusByUser(user);
        mmap.put("menus", menus);
        mmap.put("user", user);
        return "index";
    }
}
