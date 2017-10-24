package com.finance.entity;

public class Security {
	private Integer id; // 编号
	private Integer userid; // 证券人ID
	private Integer roleid; // 创建人角色
	private String securityname; // 证券账号
	private String securitypassward; // 证券密码
	private String company; // 公司
	private Integer dataid; // 类型
	private String starttime; // 有效开始时间
	private String endtime; // 有效截止时间
	private String createtime; // 创建时间
	private String updatetime; // 更新时间

	private String datadicname; // 数据字典名字
	private String datadicvalue; // 数据字典值
	
    private String username;// 持有人
	
	private String searchStarttime;//搜索起始时间
	private String searchEndtime;//搜索截止时间
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getRoleid() {
		return roleid;
	}
	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}
	public String getSecurityname() {
		return securityname;
	}
	public void setSecurityname(String securityname) {
		this.securityname = securityname;
	}
	public String getSecuritypassward() {
		return securitypassward;
	}
	public void setSecuritypassward(String securitypassward) {
		this.securitypassward = securitypassward;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Integer getDataid() {
		return dataid;
	}
	public void setDataid(Integer dataid) {
		this.dataid = dataid;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
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
	public String getDatadicname() {
		return datadicname;
	}
	public void setDatadicname(String datadicname) {
		this.datadicname = datadicname;
	}
	public String getDatadicvalue() {
		return datadicvalue;
	}
	public void setDatadicvalue(String datadicvalue) {
		this.datadicvalue = datadicvalue;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSearchStarttime() {
		return searchStarttime;
	}
	public void setSearchStarttime(String searchStarttime) {
		this.searchStarttime = searchStarttime;
	}
	public String getSearchEndtime() {
		return searchEndtime;
	}
	public void setSearchEndtime(String searchEndtime) {
		this.searchEndtime = searchEndtime;
	}

}
