package com.lk.web.controller.system;

import com.lk.common.constant.UserConstants;
import com.lk.common.core.controller.BaseController;
import com.lk.common.core.domain.JSTree;
import com.lk.common.core.domain.LayResult;
import com.lk.common.core.domain.entity.SysDept;
import com.lk.common.core.domain.entity.SysMenu;
import com.lk.common.core.domain.entity.SysRole;
import com.lk.common.core.domain.entity.SysUser;
import com.lk.system.mapper.SysRoleMenuMapper;
import com.lk.system.service.ISysMenuService;
import com.lk.system.service.ISysRoleService;
import com.lk.system.service.ISysUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 用户
 *
 * @author LiKe_Ren
 */
@Controller
@RequestMapping("system/role")
public class SysRoleController extends BaseController {
    private String prefix = "system/role";

    @Autowired
    private ISysRoleService roleService;

    @Autowired
    private ISysMenuService menuService;


    @RequiresPermissions("system:role:view")
    @GetMapping()
    public String user() {
        return prefix + "/role";
    }

    @RequiresPermissions("system:role:add")
    @GetMapping("/add")
    public String add(ModelMap model) {
        model.put("roles", roleService.selectRoleAll());
        model.put("level", SysUser.maxLevel(getSysUser()));
        return prefix + "/add";
    }

    @RequiresPermissions("system:role:edit")
    @GetMapping("/edit")
    public String edit(long id, ModelMap model) {
        SysRole role = roleService.selectRoleById(id);
        model.put("role", role);
        model.put("level", getSysUser().maxLevel());
        return prefix + "/edit";
    }

    @RequiresPermissions("system:role:list")
    @PostMapping("/list")
    @ResponseBody
    public LayResult list(SysRole role, int page, int limit) {
        return page(roleService.selectRoleList(role), page, limit);
    }

    @RequiresPermissions("system:role:add")
    @PostMapping("/add")
    @ResponseBody
    public LayResult add(@Validated SysRole role) {
        if (UserConstants.ROLE_NAME_NOT_UNIQUE.equals(roleService.checkRoleNameUnique(role))) {
            return error("新增角色'" + role.getRoleName() + "'失败，角色名称已存在");
        } else if (UserConstants.ROLE_KEY_NOT_UNIQUE.equals(roleService.checkRoleKeyUnique(role))) {
            return error("新增角色'" + role.getRoleName() + "'失败，角色权限已存在");
        }
        role.setCreateBy(getLoginName());
        return toAjax(roleService.insertRole(role));
    }

    @RequiresPermissions("system:role:edit")
    @PostMapping("/edit")
    @ResponseBody
    public LayResult edit(SysRole role) {
        roleService.checkRoleAllowed(role);
        if (UserConstants.ROLE_NAME_NOT_UNIQUE.equals(roleService.checkRoleNameUnique(role))) {
            return error("修改角色'" + role.getRoleName() + "'失败，角色名称已存在");
        } else if (UserConstants.ROLE_KEY_NOT_UNIQUE.equals(roleService.checkRoleKeyUnique(role))) {
            return error("修改角色'" + role.getRoleName() + "'失败，角色权限已存在");
        }
        role.setUpdateBy(getLoginName());
        return toAjax(roleService.updateRole(role));
    }

    @RequiresPermissions("system:role:list")
    @PostMapping("/tree")
    @ResponseBody
    public LayResult tree(Long targetRoleId) {
        List<JSTree> trees = convertTree(menuService.selectMenuAll(getUserId()));
        List<JSTree> targetMenus;
        JSTree tree = new JSTree();
        tree.setId(0L);

        if (!targetRoleId.equals(0L)) {
            List<JSTree> selectedTree = convertTree(menuService.selectMenuByRoleId(targetRoleId));
            initJSTree(trees, selectedTree);
        }
        tree(trees, tree);

        targetMenus = (List<JSTree>) tree.getChildren();
        return new LayResult(targetMenus.size(), targetMenus);
    }


    private List<JSTree> convertTree(List<SysMenu> menus) {
        List<JSTree> trees = new ArrayList<>();
        menus.forEach(menu -> {
            JSTree tree = new JSTree();
            tree.setId(menu.getMenuId());
            tree.setText(menu.getMenuName());
            tree.setType(menu.getMenuType());
            tree.setpId(menu.getParentId());
            switch (menu.getMenuType()) {
                case "M":
                    tree.setIcon("fa fa-folder");
                    break;
                case "C":
                    tree.setIcon("fa fa-list-ul");
                    break;
                case "F":
                    tree.setIcon("fa fa-toggle-on");
                    break;
            }
            trees.add(tree);
        });
        return trees;
    }

    public void initJSTree(List<JSTree> jsTrees, List<JSTree> selectedTree) {
        selectedTree.stream().filter(sm -> sm.getType().equals("F")).forEach(tree -> {
            List<JSTree> target = jsTrees.stream().filter(sm -> sm.getId().equals(tree.getId())).collect(Collectors.toList());
            if (target.size() > 0) target.get(0).getState().setChecked(true);
        });

        selectedTree.stream().filter(sm -> sm.getType().equals("C")).forEach(tree -> {
            List<JSTree> jsTarget = jsTrees.stream().filter(sm -> sm.getType().equals("F") && sm.getpId().equals(tree.getId())).collect(Collectors.toList());
            List<JSTree> target = selectedTree.stream().filter(sm -> sm.getType().equals("F") && sm.getpId().equals(tree.getId())).collect(Collectors.toList());
            if (jsTarget.size() != 0 && jsTarget.size() == target.size()) {
                List<JSTree> t = jsTrees.stream().filter(sm -> sm.getId().equals(tree.getId())).collect(Collectors.toList());
                if (t.size() > 0) t.get(0).getState().setChecked(true);
            }
        });

        selectedTree.stream().filter(sm -> sm.getType().equals("M")).forEach(tree -> {
            List<JSTree> jsTarget = jsTrees.stream().filter(sm -> sm.getType().equals("C") && sm.getpId().equals(tree.getId())).collect(Collectors.toList());
            List<JSTree> target = selectedTree.stream().filter(sm -> sm.getType().equals("C") && sm.getpId().equals(tree.getId())).collect(Collectors.toList());
            if (jsTarget.size() > 0) {
                List<JSTree> t = jsTrees.stream().filter(sm -> sm.getId().equals(tree.getId())).collect(Collectors.toList());
                if (t.size() > 0) t.get(0).getState().setOpened(true);
            }
            if (jsTarget.size() != 0 && jsTarget.size() == target.size()) {
                List<JSTree> t = jsTrees.stream().filter(sm -> sm.getId().equals(tree.getId())).collect(Collectors.toList());
                if (t.size() > 0) t.get(0).getState().setChecked(true);
            }
        });
    }

    public void tree(List<JSTree> trees, JSTree tree) {
        List<JSTree> filter = trees.stream().filter((d) -> d.getpId().equals(tree.getId())).collect(Collectors.toList());
        if (filter.isEmpty()) return;
        ((List<JSTree>) tree.getChildren()).addAll(filter);
        for (JSTree t : filter) {
            tree(trees, t);
        }
    }

    @RequiresPermissions("system:role:remove")
    @PostMapping("/remove")
    @ResponseBody
    public LayResult remove(int roleId) {
        return toAjax(roleService.deleteRoleById((long) roleId));
    }

    @RequiresPermissions("system:role:edit")
    @PostMapping("/state")
    @ResponseBody
    public LayResult state(int roleId, boolean state) {
        SysRole role = new SysRole();
        role.setRoleId((long) roleId);
        role.setStatus(state ? "0" : "1");
        return toAjax(roleService.changeStatus(role));
    }

    @RequiresPermissions("system:role:add")
    @PostMapping("/level")
    @ResponseBody
    public LayResult level() {
        SysUser user = getSysUser();
        List<Long> levels = new ArrayList<>();
        for (long i = user.maxLevel() + 1; i < 999; i++) {
            levels.add(i);
        }
        return new LayResult(levels.size(), levels);
    }
}
