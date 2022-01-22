package com.lk.web.controller.system;

import com.lk.common.core.controller.BaseController;
import com.lk.common.core.domain.JSTree;
import com.lk.common.core.domain.LayResult;
import com.lk.common.core.domain.entity.SysDept;
import com.lk.common.core.domain.entity.SysMenu;
import com.lk.common.core.domain.entity.SysUser;
import com.lk.common.utils.ShiroUtils;
import com.lk.common.utils.StringUtils;
import com.lk.system.service.ISysDeptService;
import com.lk.system.service.ISysMenuService;
import com.lk.system.service.ISysRoleService;
import com.lk.system.service.ISysUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


/**
 * @author LiKe_Ren
 */
@Controller
@RequestMapping("system/dept")
public class SysDeptController extends BaseController {
    private String prefix = "system/dept";

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysDeptService deptService;

    @RequiresPermissions("system:dept:view")
    @GetMapping()
    public String menu() {
        return prefix + "/dept";
    }

    @RequiresPermissions("system:dept:add")
    @GetMapping("/add")
    public String add( ) {
        return prefix + "/add";
    }

    @RequiresPermissions("system:dept:edit")
    @GetMapping("/edit")
    public String edit( ) {
        return prefix + "/edit";
    }

    @RequiresPermissions("system:dept:list")
    @RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public LayResult list(Long deptId, String loginName, String status) {
        if (deptId == null) deptId = 0L;
        List<SysDept> deptList = initTree(deptService.selectDeptList(new SysDept()), deptId);
        List<SysUser> userList = new ArrayList<>();
        List<SysUser> finalUserList = userList;
        deptList.forEach(dept -> {
            SysUser user = new SysUser();
            user.setDeptId(dept.getDeptId());
            List<SysUser> users = userService.selectUserList(user);
            if (users.size() > 0) {
                finalUserList.addAll(users);
            }
        });
        if (StringUtils.isNotEmpty(loginName)) {
            userList = userList.stream().filter(user -> user.getLoginName().contains(loginName)).collect(Collectors.toList());
        }
        if (StringUtils.isNotEmpty(status)) {
            userList = userList.stream().filter(user -> user.getStatus().equals(status)).collect(Collectors.toList());
        }
        return new LayResult(userList.size(), userList);
    }

    @RequiresPermissions("system:dept:list")
    @GetMapping("/tree")
    @ResponseBody
    public List<JSTree> tree(long id) {
        SysDept sysDept = new SysDept();
        sysDept.setParentId(id);
        List<SysDept> deptList = deptService.selectDeptList(sysDept);
        return initJSTree(deptList);
    }


    public List<JSTree> initJSTree(List<SysDept> deptList) {
        if (deptList == null || deptList.size() == 0) return new ArrayList<>();
        List<JSTree> trees = new ArrayList<>();
        deptList.forEach((dept) -> {
            JSTree tree = new JSTree();
            tree.setId(dept.getDeptId());
            tree.setText(dept.getDeptName());
            tree.setIcon("fa fa-folder");
            tree.setChildren(true);
            JSTree.State state = new JSTree.State();
            state.setOpened(true);
            tree.setState(state);
            trees.add(tree);
        });
        return trees;
    }

    public List<SysDept> initTree(List<SysDept> deptList, long pid) {
        if (deptList == null || deptList.size() == 0) return new ArrayList<>();
        List<SysDept> filter;
        if (pid == 0L) {
            filter = deptList.stream().filter((d) -> d.getParentId().equals(0L)).collect(Collectors.toList());
        } else {
            filter = deptList.stream().filter((d) -> d.getDeptId().equals(pid)).collect(Collectors.toList());
        }
        if (filter.isEmpty()) return new ArrayList<>();
        List<SysDept> depts = new ArrayList<>(filter);
        filter.forEach(dept -> tree(deptList, depts, dept.getDeptId()));

        return depts;
    }

    public void tree(List<SysDept> src, List<SysDept> dis, long pid) {
        List<SysDept> filter = src.stream().filter((d) -> d.getParentId().equals(pid)).collect(Collectors.toList());
        if (filter.isEmpty()) return;
        dis.addAll(filter);
        for (SysDept dept : filter) {
            tree(src, dis, dept.getDeptId());
        }
    }

    @RequiresPermissions("system:dept:add")
    @PostMapping("/addDept")
    @ResponseBody
    public LayResult addDept(Long pId, String name) {
        SysDept dept = new SysDept();
        dept.setParentId(pId);
        dept.setDeptName(name);
        return toAjax(deptService.insertDept(dept));
    }

    @RequiresPermissions("system:dept:edit")
    @PostMapping("/editDept")
    @ResponseBody
    public LayResult editDept(Long id, String name) {
        SysDept dept = new SysDept();
        dept.setDeptId(id);
        dept.setDeptName(name);
        return toAjax(deptService.updateDept(dept));
    }

    @RequiresPermissions("system:dept:edit")
    @PostMapping("/delDept")
    @ResponseBody
    public LayResult delDept(Long id) {
        return toAjax(deptService.deleteDeptById(id));
    }

    @RequiresPermissions("system:dept:edit")
    @PostMapping("/userDept")
    @ResponseBody
    public LayResult userDept(Long deptId, Long[] userId) {
        return toAjax(deptService.updateUserDept(userId, deptId));
    }

    @RequiresPermissions("system:dept:edit")
    @PostMapping("/delUserDept")
    @ResponseBody
    public LayResult delUserDept(Long userId) {
        return toAjax(deptService.updateUserDept(new Long[]{userId}, 0L));
    }
}
