package com.finance.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finance.entity.PageBean;
import com.finance.entity.Security;
import com.finance.entity.Shares;
import com.finance.entity.User;
import com.finance.service.SecurityService;
import com.finance.service.SharesService;
import com.finance.service.UserService;
import com.finance.util.Constants;
import com.finance.util.ResponseUtil;
import com.finance.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class SharesController {
	@Resource
	private SharesService sharesService;
	@Resource
	private UserService userService;
	@Resource
	private SecurityService securityService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true)); // true:允许输入空值，false:不能为空值
	}
	
	
	/**
	 * 支出信息管理页面
	 */
	@RequestMapping("/sharesManage.do")
	public String payManage(ModelMap map, HttpServletRequest request) {
		List<Security> list = securityService.getAllSecurity();
		map.addAttribute("allSecuritys", list);
		
		HttpSession session = request.getSession();
		User curuser = (User)session.getAttribute(Constants.currentUserSessionKey);
		Map<String, Object> userMap = new HashMap<String, Object>();
		userMap.put("userid", curuser.getId());
		userMap.put("roleid", curuser.getRoleid());
		List<User> userlist = userService.getAllUser(userMap);
		map.addAttribute("allUsers", userlist);
		return "sharesManage";
	}

	/**
	 * 查询股票内容集合
	 * 
	 * @param page
	 * @param rows
	 * @param s_shares
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/shareslist.do")
	public String list(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows, Shares s_shares, HttpServletResponse response)
			throws Exception {
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("securityname", StringUtil.formatLike(s_shares.getSecurityname()));
		map.put("sharesname", StringUtil.formatLike(s_shares.getSharesname()));
		map.put("holder", StringUtil.formatLike(s_shares.getHolder()));
		map.put("roleid", s_shares.getRoleid());
		map.put("userid", s_shares.getUserid());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Shares> sharesList = sharesService.findShares(map);
		Long total = sharesService.getTotalShares(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(sharesList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}

	/**
	 * 添加与修改股票内容
	 * 
	 * @param shares
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sharessave.do")
	public String save(Shares shares, HttpServletResponse response) throws Exception {
		int resultTotal = 0; // 操作的记录条数
		JSONObject result = new JSONObject();
		
		if (shares.getId() == null) {
			resultTotal = sharesService.addShares(shares);
		} else {
			resultTotal = sharesService.updateShares(shares);
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
	 * 删除股票
	 * 
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sharesdelete.do")
	public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			sharesService.deleteShares(Integer.parseInt(idsStr[i]));
		}
		result.put("errres", true);
		result.put("errmsg", "数据删除成功！");
		ResponseUtil.write(response, result);
		return null;
	}
}
