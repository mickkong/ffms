package com.finance.entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 用户实体
 * @author mickkong
 *
 */
public class User {
	private Integer id; // 编号
	private String username; // 用户名
	private String password; // 密码
	private String truename; // 真实姓名
	private String email; // 邮件
	private String phone; // 电话
	private String address; // 住址
	private Integer sex; // 性别
	private Integer age; // 年龄
	private String appellation; // 家庭称谓
	private Integer salary; // 薪水工资
	private String card; // 银行卡号
	private Integer isvalid; // 是否有效
	private String createtime; // 创建时间
	private String updatetime; // 修改时间
	
	private Integer roleid; // 角色ID
	private String rolename; // 角色名称
	private List<Map<Object,Object>> roleIDsList=new ArrayList<Map<Object,Object>>(); // 对应的角色列表id
	
	private String roleIDs=""; // 对应的角色列表id
	private String roleNames=""; // 对应的角色列表名称
	
	public List<Map<Object, Object>> getRoleIDsList() {
		return roleIDsList;
	}
	public void setRoleIDsList(List<Map<Object, Object>> roleIDsList) {
		this.roleIDsList = roleIDsList;
		if(null!=roleIDsList && roleIDsList.size()>0){
			int size=roleIDsList.size();
			for(int i=0;i<size;i++){
				roleIDs+=roleIDsList.get(i).get("roleid");
				roleNames+=roleIDsList.get(i).get("rolename");
				if(i!=(size-1)){
					roleIDs+=",";
					roleNames+=",";
				}
			}
		}
	}
	
	public Integer getRoleid() {
		return roleid;
	}
	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getRoleIDs() {
		return roleIDs;
	}
	public void setRoleIDs(String roleIDs) {
		this.roleIDs = roleIDs;
	}
	public String getRoleNames() {
		return roleNames;
	}
	public void setRoleNames(String roleNames) {
		this.roleNames = roleNames;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTruename() {
		return truename;
	}
	public void setTruename(String truename) {
		this.truename = truename;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getAppellation() {
		return appellation;
	}
	public void setAppellation(String appellation) {
		this.appellation = appellation;
	}
	public Integer getSalary() {
		return salary;
	}
	public void setSalary(Integer salary) {
		this.salary = salary;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public Integer getIsvalid() {
		return isvalid;
	}
	public void setIsvalid(Integer isvalid) {
		this.isvalid = isvalid;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	
}
