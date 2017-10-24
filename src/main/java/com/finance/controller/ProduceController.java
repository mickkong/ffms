package com.finance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finance.entity.Datadic;
import com.finance.entity.Income;
import com.finance.entity.Pay;
import com.finance.entity.User;
import com.finance.service.DatadicService;
import com.finance.service.IncomeService;
import com.finance.service.PayService;
import com.finance.util.Constants;
import com.finance.util.ResponseUtil;
import com.finance.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 报表Controller层
 * 
 * @author mickkong
 *
 */
@Controller
public class ProduceController {
	
	@Resource
	private IncomeService incomeService;
	
	@Resource
	private PayService payService;
	
	@Resource
	private DatadicService datadicService;
	
	/**
	 * （时间-金额）收入曲线页面
	 * @return
	 */
	@RequestMapping("/incomeTimeManage.do")
	public String incomeTimeManage() {
		return "incomeTimeManage";
	}
	
	/**
	 * （时间-金额）生成收入曲线
	 * @param s_income
	 * @param response
	 * @return
	 */
	@RequestMapping("/produceIncomeTime.do")
	public String produceIncomeTime(Income s_income, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("incomer", StringUtil.formatLike(s_income.getIncomer()));
		map.put("starttime", s_income.getStarttime());
		map.put("endtime", s_income.getEndtime());
		map.put("roleid", s_income.getRoleid());
		map.put("userid", s_income.getUserid());
		List<Income> incomeList = incomeService.getIncomeLine(map);
		List<Income> incomers = incomeService.getIncomer();
		
		String curincomer;
		JSONArray incomeArray,obj;
		JSONObject result;
		
		JSONArray outerobj = new JSONArray();
		for(int i=0;i<incomers.size();i++){
			curincomer = incomers.get(i).getIncomer();
			incomeArray = new JSONArray();
			for(int j = 0; j < incomeList.size(); j++) {
				obj = new JSONArray();
				if(incomeList.get(j).getIncomer().equals(curincomer)){
					obj.add(incomeList.get(j).getIncometime());
					obj.add(incomeList.get(j).getMoney());
					incomeArray.add(obj);
				}
	        }
			if(incomeArray.size()>0){
				result = new JSONObject();
				result.put("name", curincomer);
				result.put("data", incomeArray);
				outerobj.add(result);
			}
		}
		ResponseUtil.write(response, outerobj);
		return null;
	}
	
	
	/**
	 * （时间-金额）支出曲线页面
	 * @return
	 */
	@RequestMapping("/payTimeManage.do")
	public String payTimeManage() {
		return "payTimeManage";
	}
	
	/**
	 * （时间-金额）生成支出曲线
	 * @param s_pay
	 * @param response
	 * @return
	 */
	@RequestMapping("/producePayTime.do")
	public String producePayLine(Pay s_pay, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("payer", StringUtil.formatLike(s_pay.getPayer()));
		map.put("starttime", s_pay.getStarttime());
		map.put("endtime", s_pay.getEndtime());
		map.put("roleid", s_pay.getRoleid());
		map.put("userid", s_pay.getUserid());
		List<Pay> payList = payService.getPayLine(map);
		List<Pay> payers = payService.getPayer();
		
		String curpayer;
		JSONArray payArray,obj;
		JSONObject result;
		
		JSONArray outerobj = new JSONArray();
		for(int i=0;i<payers.size();i++){
			curpayer = payers.get(i).getPayer();
			payArray = new JSONArray();
			for(int j = 0; j < payList.size(); j++) {
				obj = new JSONArray();
				if(payList.get(j).getPayer().equals(curpayer)){
					obj.add(payList.get(j).getPaytime());
					obj.add(payList.get(j).getMoney());
					payArray.add(obj);
				}
	        }
			if(payArray.size()>0){
				result = new JSONObject();
				result.put("name", curpayer);
				result.put("data", payArray);
				outerobj.add(result);
			}
		}
		ResponseUtil.write(response, outerobj);
		return null;
	}
	
	/**
	 * 用户收入情况比较
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/moneyAnalysis.do")
	public String moneyAnalysis(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		User curUser = (User)session.getAttribute(Constants.currentUserSessionKey);
		map.put("roleid", curUser.getRoleid());
		map.put("userid", curUser.getId());
		List<Income> incomeList = incomeService.getIncomeLine(map);
		List<Pay> payList = payService.getPayLine(map);
		
		JSONObject result = new JSONObject();
		int totalIncomeMoney=0,totalPayMoney=0,totalLostMoney=0;
		
		for(int i = 0; i < incomeList.size(); i++) {
			if(incomeList.get(i).getIncomer().equals(curUser.getUsername())){
				totalIncomeMoney = totalIncomeMoney+incomeList.get(i).getMoney();
	        }
		}
		for(int j = 0; j < payList.size(); j++) {
			if(payList.get(j).getPayer().equals(curUser.getUsername())){
				totalPayMoney = totalPayMoney+payList.get(j).getMoney();
	        }
		}
		totalLostMoney = totalIncomeMoney-totalPayMoney;
		
		result.put("totalIncomeMoney", totalIncomeMoney);
		result.put("totalPayMoney", totalPayMoney);
		result.put("totalLostMoney", totalLostMoney);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * （类型-金额）饼图页面
	 * @return
	 */
	@RequestMapping("/typePieManage.do")
	public String typePieManage() {
		return "typePieManage";
	}
	
	/**
	 * （类型-金额）生成收入饼图
	 * @param s_income
	 * @param response
	 * @return
	 */
	@RequestMapping("/produceIncomeType.do")
	public String produceIncomeType(Income s_income, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("incomer", StringUtil.formatLike(s_income.getIncomer()));
		map.put("starttime", s_income.getStarttime());
		map.put("endtime", s_income.getEndtime());
		map.put("roleid", s_income.getRoleid());
		map.put("userid", s_income.getUserid());
		List<Income> incomeList = incomeService.getIncomeLine(map);
		List<Datadic> incomeTypes = datadicService.getDatadicIncome();
		
		JSONArray incomeArray = new JSONArray(),obj;
		JSONObject result = new JSONObject();
		Integer incomeMoney,totalIncomeMoney=0;
		
		for(int k = 0; k < incomeList.size(); k++) {
			totalIncomeMoney = totalIncomeMoney + incomeList.get(k).getMoney();
		}
		
		for (int i = 0; i < incomeTypes.size(); i++) {
			obj = new JSONArray();
			incomeMoney=0;
			for(int j = 0; j < incomeList.size(); j++) {
				if(incomeList.get(j).getDataid().equals(incomeTypes.get(i).getId())){
					incomeMoney = incomeMoney + incomeList.get(j).getMoney();
				}
		    }
			obj.add(incomeTypes.get(i).getDatadicvalue()+"："+(double)Math.round(10000*incomeMoney/totalIncomeMoney)/100+"%");
			obj.add(incomeMoney);
			incomeArray.add(obj);
		}
			
		result.put("name", "(类型——金额)收入饼状图");
		result.put("data", incomeArray);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * （类型-金额）生成支出饼图
	 * @param s_pay
	 * @param response
	 * @return
	 */
	@RequestMapping("/producePayType.do")
	public String producePayType(Pay s_pay, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("payer", StringUtil.formatLike(s_pay.getPayer()));
		map.put("starttime", s_pay.getStarttime());
		map.put("endtime", s_pay.getEndtime());
		map.put("roleid", s_pay.getRoleid());
		map.put("userid", s_pay.getUserid());
		List<Pay> payList = payService.getPayLine(map);
		List<Datadic> payTypes = datadicService.getDatadicPay();
		
		JSONArray payArray = new JSONArray(),obj;
		JSONObject result = new JSONObject();
		Integer payMoney,totalPayMoney=0;
		
		for(int k = 0; k < payList.size(); k++) {
			totalPayMoney = totalPayMoney + payList.get(k).getMoney();
		}
		
		for (int i = 0; i < payTypes.size(); i++) {
			obj = new JSONArray();
			payMoney=0;
			for(int j = 0; j < payList.size(); j++) {
				if(payList.get(j).getDataid().equals(payTypes.get(i).getId())){
					payMoney = payMoney + payList.get(j).getMoney();
				}
		    }
			obj.add(payTypes.get(i).getDatadicvalue()+"："+(double)Math.round(10000*payMoney/totalPayMoney)/100+"%");
			obj.add(payMoney);
			payArray.add(obj);
		}
			
		result.put("name", "(类型——金额)支出饼状图");
		result.put("data", payArray);
		ResponseUtil.write(response, result);
		return null;
	}
}
