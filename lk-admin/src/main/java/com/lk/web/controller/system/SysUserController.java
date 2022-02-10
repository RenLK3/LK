package com.lk.web.controller.system;

import com.lk.common.annotation.Log;
import com.lk.common.constant.UserConstants;
import com.lk.common.core.domain.JSTree;
import com.lk.common.core.domain.LayResult;
import com.lk.common.core.controller.BaseController;
import com.lk.common.core.domain.entity.SysDept;
import com.lk.common.core.domain.entity.SysMenu;
import com.lk.common.core.domain.entity.SysRole;
import com.lk.common.core.domain.entity.SysUser;
import com.lk.common.core.domain.vo.UserExcelVO;
import com.lk.common.enums.BusinessType;
import com.lk.framework.shiro.service.SysPasswordService;
import com.lk.system.domain.SysUserRole;
import com.lk.system.mapper.SysDeptMapper;
import com.lk.system.mapper.SysUserRoleMapper;
import com.lk.system.service.ISysDeptService;
import com.lk.system.service.ISysRoleService;
import com.lk.system.service.ISysUserService;
import com.pig4cloud.plugin.excel.annotation.ResponseExcel;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 用户
 *
 * @author LiKe_Ren
 */
@Controller
@RequestMapping("system/user")
public class SysUserController extends BaseController {
    private String prefix = "system/user";

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysRoleService roleService;

    @Autowired
    private SysPasswordService passwordService;

    @Autowired
    private SysUserRoleMapper userRoleMapper;

    @Autowired
    private ISysDeptService deptService;

    @RequiresPermissions("system:user:view")
    @GetMapping()
    public String user(ModelMap model) {
        model.put("roles", roleService.selectRoleAll());
        model.put("level", SysUser.maxLevel(getSysUser()));
        return prefix + "/user";
    }

    @RequiresPermissions("system:user:add")
    @GetMapping("/add")
    public String add(ModelMap model) {
        model.put("roles", roleService.selectRoleAll());
        return prefix + "/add";
    }

    @RequiresPermissions("system:user:edit")
    @GetMapping("/edit")
    public String edit(int id, ModelMap model) {
        model.put("roles", roleService.selectRoleAll());
        model.put("user", userService.selectUserById((long) id));

        return prefix + "/edit";
    }

    @RequiresPermissions("system:user:list")
    @RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public LayResult list(SysUser user, int page, int limit) {
        return page(userService.selectUserList(user), page, limit);
    }

    @RequiresPermissions("system:dept:list")
    @GetMapping("/tree")
    @ResponseBody
    public List<JSTree> tree(long id, long deptId) {
        SysDept sysDept = new SysDept();
        sysDept.setParentId(id);
        List<SysDept> deptList = deptService.selectDeptList(sysDept);
        return initJSTree(deptList, deptId);
    }

    public List<JSTree> initJSTree(List<SysDept> deptList, long deptId) {
        if (deptList == null || deptList.size() == 0) return new ArrayList<>();
        List<JSTree> trees = new ArrayList<>();
        deptList.forEach((dept) -> {
            JSTree tree = new JSTree();
            tree.setId(dept.getDeptId());
            tree.setText(dept.getDeptName());
            tree.setIcon("fa fa-folder");
            JSTree.State state = new JSTree.State();
            state.setOpened(true);
//            state.setChecked(true);
            if (deptId != 0 && tree.getId() == deptId) {
                state.setChecked(true);
            }
            tree.setState(state);
            tree.setChildren(true);

            trees.add(tree);
        });
        return trees;
    }

    public void tree(List<JSTree> trees, JSTree tree) {
        List<JSTree> filter = trees.stream().filter((d) -> d.getpId().equals(tree.getId())).collect(Collectors.toList());
        if (filter.isEmpty()) return;
        ((List<JSTree>) tree.getChildren()).addAll(filter);
        for (JSTree t : filter) {
            tree(trees, t);
        }
    }

    /**
     * 导出excel 表格
     *
     * @return
     */
    @RequiresPermissions("system:user:export")
    @ResponseExcel
    @GetMapping("/export")
    public List<UserExcelVO> export(SysUser user) {
        List<SysUser> users = userService.selectUserList(user);
        List<UserExcelVO> userExcelVOS = new ArrayList<>();
        users.forEach(u -> {
            UserExcelVO excelVO = new UserExcelVO();
            BeanUtils.copyProperties(u, excelVO);
            userExcelVOS.add(excelVO);
        });
        return userExcelVOS;
    }

    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @RequiresPermissions("system:user:add")
    @PostMapping("/add")
    @ResponseBody
    public LayResult add(@Validated SysUser user) {
        if (UserConstants.USER_NAME_NOT_UNIQUE.equals(userService.checkLoginNameUnique(user.getLoginName()))) {
            return error("新增用户'" + user.getLoginName() + "'失败，登录账号已存在");
        }
        user.setDeptId(0L);
        user.setPassword(passwordService.encryptPassword(user.getLoginName(), user.getPassword()));
        user.setCreateBy(getLoginName());
        return toAjax(userService.insertUser(user));
    }

    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @RequiresPermissions("system:user:edit")
    @PostMapping("/edit")
    @ResponseBody
    public LayResult edit(@Validated SysUser user) {
        userService.checkUserAllowed(user);

        user.setUpdateBy(getLoginName());
        return toAjax(userService.updateUser(user));
    }

    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @RequiresPermissions("system:user:remove")
    @PostMapping("/remove")
    @ResponseBody
    public LayResult remove(int userid) {
        return toAjax(userService.deleteUserById((long) userid));
    }

    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @RequiresPermissions("system:user:edit")
    @PostMapping("/state")
    @ResponseBody
    public LayResult state(long userid, boolean state) {
        SysUser user = new SysUser();
        user.setUserId(userid);
        user.setStatus(state ? "0" : "1");
        return toAjax(userService.changeStatus(user));
    }

    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @RequiresPermissions("system:user:edit")
    @PostMapping("/changeRole")
    @ResponseBody
    public LayResult changeRole(long userid, @RequestParam(value = "roleIds[]", required = false) List<Long> roleIds) {
        SysUser targetUser = new SysUser();
        targetUser.setUserId(userid);

        if (getSysUser().isAdmin()) {
            // 如果这个用户是超级管理员 它拥有所有权限
            if (roleIds != null && roleIds.size() != 0) {
                userRoleMapper.deleteUserRoleByUserId(userid);
                List<SysUserRole> userRoleList = new ArrayList<>();
                for (Long roleId : roleIds) {
                    SysUserRole userRole = new SysUserRole();
                    userRole.setUserId(userid);
                    userRole.setRoleId(roleId);
                    userRoleList.add(userRole);
                }
                userRoleMapper.batchUserRole(userRoleList);
            } else {
                userRoleMapper.deleteUserRoleByUserId(userid);
            }
        } else {
            // 如果不是可以添加同级别的权限
            Long thisLevel = SysUser.maxLevel(getSysUser());
            Long targetLevel = SysUser.maxLevel(userService.selectUserById(userid));
            if (thisLevel < targetLevel) { // 操作目标用户级别小
                userRoleMapper.deleteUserRoleByUserId(userid);
                if (roleIds != null) {
                    boolean allOk = true;
                    for (Long roleId : roleIds) {
                        SysRole role = roleService.selectRoleById(roleId);
                        if (thisLevel < role.getLevel()) {
                            List<SysUserRole> userRoles = new ArrayList<>();
                            SysUserRole userRole = new SysUserRole();
                            userRole.setUserId(targetUser.getUserId());
                            userRole.setRoleId(roleId);

                            userRoles.add(userRole);
                            userRoleMapper.batchUserRole(userRoles);
                        } else {
                            allOk = false;
                        }
                    }
                    if (!allOk) {
                        return error("无法操作部分高级别的角色");
                    }
                }
            } else {
                return error("无法操作高级别的角色");
            }

        }
        return ok();
    }
}
