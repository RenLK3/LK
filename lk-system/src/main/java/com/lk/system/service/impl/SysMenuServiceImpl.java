package com.lk.system.service.impl;

import com.lk.system.mapper.SysMenuMapper;
import com.lk.system.mapper.SysRoleMenuMapper;
import com.lk.system.service.ISysUserService;
import com.lk.common.constant.UserConstants;
import com.lk.common.core.domain.JSTree;
import com.lk.common.core.domain.XmSelect;
import com.lk.common.core.domain.Ztree;
import com.lk.common.core.domain.entity.SysMenu;
import com.lk.common.core.domain.entity.SysRole;
import com.lk.common.core.domain.entity.SysUser;
import com.lk.common.utils.StringUtils;
import com.lk.system.service.ISysMenuService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.MessageFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 菜单 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class SysMenuServiceImpl implements ISysMenuService
{
    public static final String PREMISSION_STRING = "perms[\"{0}\"]";

    @Autowired
    private SysMenuMapper menuMapper;

    @Autowired
    private SysRoleMenuMapper roleMenuMapper;

    @Autowired
    private ISysUserService userService;

    /**
     * 根据用户查询菜单
     * 
     * @param user 用户信息
     * @return 菜单列表
     */
    @Override
    public List<SysMenu> selectMenusByUser(SysUser user)
    {
        List<SysMenu> menus = new LinkedList<SysMenu>();
        // 管理员显示所有菜单信息
        if (user.isAdmin())
        {
            menus = menuMapper.selectMenuNormalAll();
        }
        else
        {
            menus = menuMapper.selectMenusByUserId(user.getUserId());
        }
        return getChildPerms(menus, 0);
    }

    /**
     * 查询菜单集合
     * 
     * @return 所有菜单信息
     */
    @Override
    public List<SysMenu> selectMenuList(SysMenu menu, Long userId)
    {
        List<SysMenu> menuList = null;
        SysUser sysUser = userService.selectUserById(userId);
        if (sysUser.isAdmin())
        {
            menuList = menuMapper.selectMenuList(menu);
        }
        else
        {
            menu.getParams().put("userId", userId);
            menuList = menuMapper.selectMenuListByUserId(menu);
        }
        return menuList;
    }

    /**
     * 根据菜单父ID查询菜单
     *
     * @param parentId 菜单父ID
     * @return 菜单列表
     */
    @Override
    public List<SysMenu> selectMenuTreePId(Long userId,Long parentId) {
        return menuMapper.selectMenuTreePId(userId,parentId);
    }

    /**
     * 通过角色ID查询菜单
     *
     * @param roleId 角色ID
     * @return 菜单列表
     */
    @Override
    public List<SysMenu> selectMenuByRoleId(Long roleId) {
        return menuMapper.selectMenuByRoleId(roleId);
    }

    /**
     * 查询菜单集合
     * 
     * @return 所有菜单信息
     */
    @Override
    public List<SysMenu> selectMenuAll(Long userId)
    {
        List<SysMenu> menuList;
        SysUser sysUser = userService.selectUserById(userId);
        if (sysUser.isAdmin())
        {
            menuList = menuMapper.selectMenuAll();
        }
        else
        {
            menuList = menuMapper.selectMenuAllByUserId(userId);
        }
        return menuList;
    }

    /**
     * 根据用户ID查询权限
     * 
     * @param userId 用户ID
     * @return 权限列表
     */
    @Override
    public Set<String> selectPermsByUserId(Long userId)
    {
        List<String> perms = menuMapper.selectPermsByUserId(userId);
        Set<String> permsSet = new HashSet<>();
        for (String perm : perms)
        {
            if (StringUtils.isNotEmpty(perm))
            {
                permsSet.addAll(Arrays.asList(perm.trim().split(",")));
            }
        }
        return permsSet;
    }

    /**
     * 根据角色ID查询菜单
     * 
     * @param role 角色对象
     * @return 菜单列表
     */
    @Override
    public List<Ztree> roleMenuTreeData(SysRole role, Long userId)
    {
//        Long roleId = role.getRoleId();
        List<Ztree> ztrees = new ArrayList<Ztree>();
//        List<SysMenu> menuList = selectMenuAll(userId);
//        if (StringUtils.isNotNull(roleId))
//        {
//            List<String> roleMenuList = menuMapper.selectMenuTree(roleId);
//            ztrees = initZtree(menuList, roleMenuList, true);
//        }
//        else
//        {
//            ztrees = initZtree(menuList, null, true);
//        }
        return ztrees;
    }
    private List<XmSelect> convertXmSelect(List<SysMenu> menus,Long selectId) {
        List<XmSelect> selects = new ArrayList<>();
        menus.forEach(menu -> {
            XmSelect select = new XmSelect();
            select.setValue(menu.getMenuId());
            select.setName(menu.getMenuName());
            if(selectId.equals(menu.getMenuId())){
                select.setSelected(true);
            }

            selects.add(select);
        });
        return selects;
    }

    /**
     * 查询所有菜单
     * 
     * @return 菜单列表
     */
    @Override
    public List<XmSelect> menuTreeData(Long userId,Long selectId)
    {
        List<SysMenu> menuList = selectMenuAll(userId)
                .stream().filter(item->!item.getMenuType().equals("F")).collect(Collectors.toList());;
        List<XmSelect> ztrees = initZtree(menuList,selectId);
        return ztrees;
    }

    /**
     * 查询系统所有权限
     * 
     * @return 权限列表
     */
    @Override
    public LinkedHashMap<String, String> selectPermsAll(Long userId)
    {
        LinkedHashMap<String, String> section = new LinkedHashMap<>();
        List<SysMenu> permissions = selectMenuAll(userId);
        if (StringUtils.isNotEmpty(permissions))
        {
            for (SysMenu menu : permissions)
            {
                section.put(menu.getUrl(), MessageFormat.format(PREMISSION_STRING, menu.getPerms()));
            }
        }
        return section;
    }

    /**
     * 对象转菜单树
     * 
     * @param menuList 菜单列表
     * @return 树结构列表
     */
    public List<XmSelect> initZtree(List<SysMenu> menuList,Long selectId)
    {
        List<XmSelect> menus = new ArrayList<>();
        initZtree(menuList, menus, 0L, selectId);
        return menus;
    }

    /**
     * 对象转菜单树
     * @param src 源
     * @param dis 目标
     * @param pid 上层ID
     */
    public void initZtree(List<SysMenu> src, List<XmSelect> dis,Long pid,Long selectId)
    {
        List<SysMenu> filter = src.stream().filter((m)->m.getParentId() == pid).collect(Collectors.toList());
        if(filter.isEmpty()) return;
        dis.addAll(convertXmSelect(filter,selectId));
        for (int i = 0; i < dis.size(); i++) {
            XmSelect menu = dis.get(i);
            initZtree(src,menu.getChildren(),menu.getValue(),selectId);
        }
    }


    public String transMenuName(SysMenu menu, boolean permsFlag)
    {
        StringBuffer sb = new StringBuffer();
        sb.append(menu.getMenuName());
        if (permsFlag)
        {
            sb.append("<font color=\"#888\">&nbsp;&nbsp;&nbsp;" + menu.getPerms() + "</font>");
        }
        return sb.toString();
    }

    /**
     * 删除菜单管理信息
     * 
     * @param menuId 菜单ID
     * @return 结果
     */
    @Override
    public int deleteMenuById(Long menuId)
    {
        return menuMapper.deleteMenuById(menuId);
    }

    /**
     * 根据菜单ID查询信息
     * 
     * @param menuId 菜单ID
     * @return 菜单信息
     */
    @Override
    public SysMenu selectMenuById(Long menuId)
    {
        return menuMapper.selectMenuById(menuId);
    }

    /**
     * 查询子菜单数量
     * 
     * @param parentId 父级菜单ID
     * @return 结果
     */
    @Override
    public int selectCountMenuByParentId(Long parentId)
    {
        return menuMapper.selectCountMenuByParentId(parentId);
    }

    /**
     * 查询菜单使用数量
     * 
     * @param menuId 菜单ID
     * @return 结果
     */
    @Override
    public int selectCountRoleMenuByMenuId(Long menuId)
    {
        return roleMenuMapper.selectCountRoleMenuByMenuId(menuId);
    }

    /**
     * 新增保存菜单信息
     * 
     * @param menu 菜单信息
     * @return 结果
     */
    @Override
    public int insertMenu(SysMenu menu)
    {
        return menuMapper.insertMenu(menu);
    }

    /**
     * 修改保存菜单信息
     * 
     * @param menu 菜单信息
     * @return 结果
     */
    @Override
    public int updateMenu(SysMenu menu)
    {
        return menuMapper.updateMenu(menu);
    }

    /**
     * 校验菜单名称是否唯一
     * 
     * @param menu 菜单信息
     * @return 结果
     */
    @Override
    public String checkMenuNameUnique(SysMenu menu)
    {
        Long menuId = StringUtils.isNull(menu.getMenuId()) ? -1L : menu.getMenuId();
        SysMenu info = menuMapper.checkMenuNameUnique(menu.getMenuName(), menu.getParentId());
        if (StringUtils.isNotNull(info) && info.getMenuId().longValue() != menuId.longValue())
        {
            return UserConstants.MENU_NAME_NOT_UNIQUE;
        }
        return UserConstants.MENU_NAME_UNIQUE;
    }

    /**
     * 根据父节点的ID获取所有子节点
     * 
     * @param list 分类表
     * @param parentId 传入的父节点ID
     * @return String
     */
    public List<SysMenu> getChildPerms(List<SysMenu> list, int parentId)
    {
        List<SysMenu> returnList = new ArrayList<SysMenu>();
        for (Iterator<SysMenu> iterator = list.iterator(); iterator.hasNext();)
        {
            SysMenu t = (SysMenu) iterator.next();
            // 一、根据传入的某个父节点ID,遍历该父节点的所有子节点
            if (t.getParentId() == parentId)
            {
                recursionFn(list, t);
                returnList.add(t);
            }
        }
        return returnList;
    }

    /**
     * 递归列表
     * 
     * @param list
     * @param t
     */
    private void recursionFn(List<SysMenu> list, SysMenu t)
    {
        // 得到子节点列表
        List<SysMenu> childList = getChildList(list, t);
        t.setChildren(childList);
        for (SysMenu tChild : childList)
        {
            if (hasChild(list, tChild))
            {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 得到子节点列表
     */
    private List<SysMenu> getChildList(List<SysMenu> list, SysMenu t)
    {
        List<SysMenu> tlist = new ArrayList<SysMenu>();
        Iterator<SysMenu> it = list.iterator();
        while (it.hasNext())
        {
            SysMenu n = (SysMenu) it.next();
            if (n.getParentId().longValue() == t.getMenuId().longValue())
            {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<SysMenu> list, SysMenu t)
    {
        return getChildList(list, t).size() > 0 ? true : false;
    }
}
