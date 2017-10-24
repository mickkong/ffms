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

import com.finance.entity.Datadic;
import com.finance.entity.PageBean;
import com.finance.service.DatadicService;
import com.finance.util.ResponseUtil;
import com.finance.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 数据字典Controller层
 * 
 * @author mickkong
 *
 */
@Controller
public class DatadicController {
	
	@Resource
	private DatadicService datadicService;
	
	/**
	 * 数据字典信息页面
	 */
	@RequestMapping("/datadicManage.do")
	public String datadicManage(ModelMap map) {
		List<Datadic> list = datadicService.getDatadicname();
		map.addAttribute("datadicnames", list);
		return "datadicManage";
	}
	
	/**
	 * 查询数据字典集合
	 * 
	 * @param page
	 * @param rows
	 * @param s_datadic
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/datadiclist.do")
	public String list(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows, Datadic s_datadic, HttpServletResponse response)
			throws Exception {
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("datadicname", s_datadic.getDatadicname());
		map.put("datadicvalue", StringUtil.formatLike(s_datadic.getDatadicvalue()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Datadic> datadicList = datadicService.findDatadic(map);
		Long total = datadicService.getTotalDatadic(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(datadicList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 添加与修改数据字典
	 * 
	 * @param datadic
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/datadicsave.do")
	public String save(Datadic datadic, HttpServletResponse response) throws Exception {
		int resultTotal = 0; // 操作的记录条数
		JSONObject result = new JSONObject();
		if (datadic.getId() == null) {
			resultTotal = datadicService.addDatadic(datadic);
		} else {
			resultTotal = datadicService.updateDatadic(datadic);
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
	 * 删除数据字典
	 * 
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/datadicdelete.do")
	public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			datadicService.deleteDatadic(Integer.parseInt(idsStr[i]));
		}
		result.put("errres", true);
		result.put("errmsg", "数据删除成功！");
		ResponseUtil.write(response, result);
		return null;
	}
}
