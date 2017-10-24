package com.finance.service;

import java.util.List;
import java.util.Map;

import com.finance.entity.Role;

/**
 * 角色
 * @author mickkong
 *
 */
public interface RoleService {
	/**
	 * 获得所有角色
	 * @return
	 */
	public List<Role> getRoles();
	
	/**
	 * 查询角色
	 * @param map
	 * @return
	 */
	public List<Role> findRole(Map<String,Object> map);
	
	/**
	 * 获取角色记录数
	 * @param map
	 * @return
	 */
	public Long getTotalRole(Map<String,Object> map);
	
	/**
	 * 更新角色
	 * @param role
	 * @return
	 */
	public int updateRole(Role role);
	
	/**
	 * 添加角色
	 * @param role
	 * @return
	 */
	public int addRole(Role role);
	
	/**
	 * 删除角色
	 * @param id
	 * @return
	 */
	public int deleteRole(Integer id);
}
