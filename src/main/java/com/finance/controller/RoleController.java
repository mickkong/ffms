package com.finance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finance.entity.PageBean;
import com.finance.entity.Role;
import com.finance.service.RoleService;
import com.finance.util.ResponseUtil;
import com.finance.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 角色Controller层
 * 
 * @author mickkong
 *
 */
@Controller
public class RoleController {
	
	@Resource
	private RoleService roleService;
	
	/**
	 * 角色信息页面
	 */
	@RequestMapping("/roleManage.do")
	public String roleManage(ModelMap map) {
		return "roleManage";
	}
	
	/**
	 * 查询角色集合
	 * 
	 * @param page
	 * @param rows
	 * @param s_role
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rolelist.do")
	public String list(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows, Role s_role, HttpServletResponse response)
			throws Exception {
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rolename", StringUtil.formatLike(s_role.getRolename()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Role> roleList = roleService.findRole(map);
		Long total = roleService.getTotalRole(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(roleList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 添加与修改角色
	 * 
	 * @param role
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rolesave.do")
	public String save(Role role, HttpServletResponse response) throws Exception {
		int resultTotal = 0; // 操作的记录条数
		JSONObject result = new JSONObject();
		if (role.getId() == null) {
			resultTotal = roleService.addRole(role);
		} else {
			resultTotal = roleService.updateRole(role);
		}

		if (resultTotal > 0) { // 执行成功
			result.put("errres", true);
			result.put("errmsg", "数据保存成功！");
		} else {
			result.put("errres", false);
			result.put("errmsg", "数据保存失败");
		}
		ResponseUtil.write(response, result);
		return null;
	}

	/**
	 * 删除角色
	 * 
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/roledelete.do")
	public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			roleService.deleteRole(Integer.parseInt(idsStr[i]));
		}
		result.put("errres", true);
		result.put("errmsg", "数据删除成功！");
		ResponseUtil.write(response, result);
		return null;
	}
}
