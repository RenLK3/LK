package com.lk.web.controller.system;

import com.lk.common.annotation.Log;
import com.lk.common.constant.UserConstants;
import com.lk.common.core.controller.BaseController;
import com.lk.common.core.domain.LayResult;
import com.lk.common.core.domain.XmSelect;
import com.lk.common.core.domain.entity.SysMenu;
import com.lk.common.core.domain.entity.SysRole;
import com.lk.common.core.domain.vo.MenuExcelVO;
import com.lk.common.core.domain.vo.RoleExcelVO;
import com.lk.common.enums.BusinessType;
import com.lk.common.utils.ShiroUtils;
import com.lk.system.service.ISysMenuService;
import com.pig4cloud.plugin.excel.annotation.ResponseExcel;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.awt.*;
import java.util.ArrayList;
import java.util.List;


/**
 * @author LiKe_Ren
 */
@Controller
@RequestMapping("system/menu")
public class SysMenuController extends BaseController {
    private String prefix = "system/menu";

    @Autowired
    private ISysMenuService menuService;

    @RequiresPermissions("system:menu:view")
    @GetMapping()
    public String menu() {
        return prefix + "/menu";
    }

    @Log(title = "菜单管理",businessType = BusinessType.INSERT)
    @RequiresPermissions("system:menu:add")
    @GetMapping("/add")
    public String add(ModelMap model) {
        model.put("menus", menuService.selectMenuAll(getUserId()));
        model.put("level", getSysUser().maxLevel());
        return prefix + "/add";
    }

    @Log(title = "菜单管理",businessType = BusinessType.UPDATE)
    @RequiresPermissions("system:menu:edit")
    @GetMapping("/edit")
    public String edit(long id, ModelMap model) {
        model.put("menu", menuService.selectMenuById(id));
        model.put("level", getSysUser().maxLevel());
        return prefix + "/edit";
    }

    /**
     * 导出excel 表格
     *
     * @return
     */
    @RequiresPermissions("system:menu:export")
    @ResponseExcel
    @GetMapping("/export")
    public List<MenuExcelVO> export(SysMenu menu) {
        List<SysMenu> menus = menuService.selectMenusByUser(getSysUser());
        List<MenuExcelVO> menuExcelVOS = new ArrayList<>();
        menus.forEach(u -> {
            MenuExcelVO excelVO = new MenuExcelVO();
            BeanUtils.copyProperties(u, excelVO);
            menuExcelVOS.add(excelVO);
        });
        return menuExcelVOS;
    }

    @RequiresPermissions("system:menu:list")
    @GetMapping("/list")
    @ResponseBody
    public LayResult list() {
        List<SysMenu> menus = menuService.selectMenuAll(getSysUser().getUserId());
        return new LayResult(menus.size(), menus);
    }

    /**
     * 加载所有菜单列表树
     */
    @RequiresPermissions("system:menu:list")
    @PostMapping("/menuTreeData")
    @ResponseBody
    public LayResult menuTreeData(Long selectId)
    {
        List<XmSelect> menus = menuService.menuTreeData(ShiroUtils.getUserId(),selectId);
        return new LayResult(menus.size(),menus);
    }

    @Log(title = "菜单管理",businessType = BusinessType.INSERT)
    @RequiresPermissions("system:menu:add")
    @PostMapping("/add")
    @ResponseBody
    public LayResult add(@Validated SysMenu menu) {
        if (UserConstants.MENU_NAME_NOT_UNIQUE.equals(menuService.checkMenuNameUnique(menu)))
        {
            return error("新增菜单'" + menu.getMenuName() + "'失败，菜单名称已存在");
        }
        menu.setCreateBy(getLoginName());
        //AuthorizationUtils.clearAllCachedAuthorizationInfo();
        return toAjax(menuService.insertMenu(menu));
    }

    @Log(title = "菜单管理",businessType = BusinessType.UPDATE)
    @RequiresPermissions("system:menu:edit")
    @PostMapping("/edit")
    @ResponseBody
    public LayResult edit(@Validated SysMenu menu) {
        menu.setUpdateBy(getLoginName());
        return toAjax(menuService.updateMenu(menu));
    }

    @Log(title = "菜单管理",businessType = BusinessType.DELETE)
    @RequiresPermissions("system:menu:remove")
    @PostMapping("/remove")
    @ResponseBody
    public LayResult remove(long menuId) {
        return toAjax(menuService.deleteMenuById(menuId));
    }

    @Log(title = "菜单管理",businessType = BusinessType.UPDATE)
    @RequiresPermissions("system:menu:edit")
    @PostMapping("/state")
    @ResponseBody
    public LayResult state(long menuId, boolean state) {
        SysMenu menu = new SysMenu();
        menu.setMenuId(menuId);
        menu.setVisible(state ? "0" : "1");
        return toAjax(menuService.updateMenu(menu));
    }
}
