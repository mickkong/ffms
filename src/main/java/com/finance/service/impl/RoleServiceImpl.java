package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.finance.dao.RoleDao;
import com.finance.entity.Role;
import com.finance.service.RoleService;
/**
 * 角色Service实现类
 * @author mickkong
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService{
	@Resource
	private RoleDao roleDao;
	
	@Override
	public List<Role> getRoles() {
		return roleDao.getRoles();
	}
	
	@Override
	public List<Role> findRole(Map<String,Object> map){
		return roleDao.findRole(map);
	}
	
	@Override
	public Long getTotalRole(Map<String,Object> map){
		return roleDao.getTotalRole(map);
	}
	
	@Override
	public int updateRole(Role role){
		return roleDao.updateRole(role);
	}
	
	@Override
	public int addRole(Role role){
		return roleDao.addRole(role);
	}
	
	@Override
	public int deleteRole(Integer id){
		return roleDao.deleteRole(id);
	}
}
