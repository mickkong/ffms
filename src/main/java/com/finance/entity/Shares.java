package com.finance.entity;

public class Shares {
	private Integer id; // 主键，自动递增
	private Integer userid;//用户编号,外键
	private Integer roleid; // 创建人角色
	private Integer securityid;//证券账户编号，外键
	private String sharesname; // 股票名称
	private String holder; // 持股人
	private String createtime; // 创建时间
	private String updatetime; // 修改时间
	
	private String username; // 用户名
	private String securityname;//证券名称
	
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
	public Integer getSecurityid() {
		return securityid;
	}
	public void setSecurityid(Integer securityid) {
		this.securityid = securityid;
	}
	public String getSharesname() {
		return sharesname;
	}
	public void setSharesname(String sharesname) {
		this.sharesname = sharesname;
	}
	public String getHolder() {
		return holder;
	}
	public void setHolder(String holder) {
		this.holder = holder;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSecurityname() {
		return securityname;
	}
	public void setSecurityname(String securityname) {
		this.securityname = securityname;
	}
	
}
