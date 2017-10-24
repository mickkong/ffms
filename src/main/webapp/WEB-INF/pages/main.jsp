<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/Head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>家庭理财管理系统主页</title>
<link class="uiTheme" rel="stylesheet" type="text/css" href="${basePath}jquery-easyui-1.3.3/themes/<%=themeName %>/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath}jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${basePath}jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath}jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath}jquery-easyui-1.3.3/jquery.cookie.js"></script>
<script type="text/javascript">
	$(function(){
		$("#ith").combobox({
			panelHeight:200,
			onChange:function(newVal, oldVal){
				var oldHref = $('.uiTheme').attr('href');
				var newHref = oldHref.substring(0,oldHref.indexOf('themes')) + 'themes/' + newVal + '/easyui.css';
				//console.log(newHref);
				$('.uiTheme').attr('href', newHref);
				//设置cookie值，并设置7天有效时间
				$.cookie('themeName', newVal, {
					expires : 7
				});
			}
		});
		$.post("${basePath}moneyAnalysis.do", {}, function(result) {
			$.messager.show({
                title:'金额提醒',
                msg:'您目前的消费金额情况如下：<br/>总收入金额：'+result.totalIncomeMoney+"元。<br/>总支出金额："+result.totalPayMoney+"元。<br/>您的余额为："+result.totalLostMoney+"元。",
                timeout:30000,
                showType:'show',
                height:'100%'
            });
		},"json");
		setMoneyTime();
		function setMoneyTime(){
			setTimeout(function(){
		        $.post("${basePath}moneyAnalysis.do", {}, function(result) {
		        	setMoneyTime();
		        	if(result.totalLostMoney<2000){
		        		$.messager.show({
		                     title:'金额提醒',
		                     msg:'您的余额已不足2000元。<br/>您目前的消费金额情况如下：<br/>总收入金额：'+result.totalIncomeMoney+"元。<br/>总支出金额："+result.totalPayMoney+"元。<br/>您的余额为："+result.totalLostMoney+"元。",
		                     timeout:20000,
		                     showType:'show',
		                     height:'100%'
		                });
		        	}
		    	},"json");
		    },60000);
		}
	});
	
	var url;

	function openTab(text, url, iconCls) {
		if ($("#tabs").tabs("exists", text)) {
			$("#tabs").tabs("select", text);
		} else {
			var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${basePath}"
					+ url + "'></iframe>";
			$("#tabs").tabs("add", {
				title : text,
				iconCls : iconCls,
				closable : true,
				content : content
			});
		}
	}

	function openPasswordModifyDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "修改密码");
		url = "${basePath}modifyPassword.do?id=${currentUser.id}";
	}

	function closePasswordModifyDialog() {
		$("#dlg").dialog("close");
		$("#oldPassword").val("");
		$("#newPassword").val("");
		$("#newPassword2").val("");
	}

	function modifyPassword() {
		$("#fm").form("submit", {
			url : url,
			onSubmit : function() {
				var oldPassword = $("#oldPassword").val();
				var newPassword = $("#newPassword").val();
				var newPassword2 = $("#newPassword2").val();
				if (!$(this).form("validate")) {
					return false;
				}
				if (oldPassword != '${currentUser.password}') {
					$.messager.alert("系统提示", "用户原密码输入错误！");
					return false;
				}
				if (newPassword != newPassword2) {
					$.messager.alert("系统提示", "确认密码输入错误！");
					return false;
				}
				return true;
			},
			success : function(result) {
				var result = eval('(' + result + ')');
				if (result.success) {
					$.messager.alert("系统提示", "密码修改成功，下一次登录生效！");
					closePasswordModifyDialog();
				} else {
					$.messager.alert("系统提示", "密码修改失败");
					return;
				}
			}
		});
	}
	
	function openMessageModifyDialog(){
		$("#mdlg").dialog("open").dialog("setTitle", "修改用户信息");
		url = "${basePath}usersave.do?id=${currentUser.id}";
	}
	
	function modifyMessage(){
		$("#mfm").form("submit",{
			url:url,
			onSubmit:function(){
				if($("#roleid").combobox("getValue")==""||$("#roleid").combobox("getValue")==null){
					$.messager.alert("系统提示","请选择用户角色！");
					return false;
				}
				if($("#sex").combobox("getValue")==""||$("#sex").combobox("getValue")==null){
					$.messager.alert("系统提示","请选择性别！");
					return false;
				}
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.errres){
					$.messager.alert("系统提示",result.errmsg);
					$("#mdlg").dialog("close");
				}else{
					$.messager.alert("系统提示",result.errmsg);
					return;
				}
			}
		});
	}
	
	function closeMessageModifyDialog(){
		$("#mdlg").dialog("close");
	}

	function logout() {
		$.messager.confirm("系统提示", "您确定要退出系统吗", function(r) {
			if (r) {
				window.location.href = "${basePath}logout.do";
			}
		});
	}
</script>
</head>
<body class="easyui-layout">
	<div region="north" style="height: 78px;">
		<table style="padding: 5px" width="100%">
			<tr>
				<td width="20%"><img
					src="${basePath}resource/images/bglogo.png" /></td>
				<td valign="bottom" align="right" width="80%">
					<font size="3">&nbsp;&nbsp;<strong>欢迎：</strong>${currentUser.username }&nbsp;&nbsp;&nbsp;&nbsp;</font>
					<a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 80px;">修改密码</a>
					&nbsp;&nbsp;&nbsp;&nbsp;主题风格：
					<select id="ith" class="easyui-combobox" name="theme">
						<option value="default">default</option>
						<option value="black">black</option>
						<option value="gray">gray</option>
						<option value="bootstrap">bootstrap</option>
						<option value="metro">metro</option>
						<option value="metro-blue">metro-blue</option>
						<option value="metro-gray">metro-gray</option>
						<option value="metro-green">metro-green</option>
						<option value="metro-orange">metro-orange</option>
						<option value="metro-red">metro-red</option>
						<option value="ui-cupertino">ui-cupertino</option>
						<option value="ui-dark-hive">ui-dark-hive</option>
						<option value="ui-pepper-grinder">ui-pepper-grinder</option>
						<option value="ui-sunny">ui-sunny</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 80px;">安全退出</a>
				</td>
			</tr>
		</table>
	</div>
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" data-options="iconCls:'icon-home'">
				<div align="center" style="padding-top: 100px">
					<font color="red" size="10">欢迎使用</font>
				</div>
			</div>
		</div>
	</div>

	<div region="west" style="width: 200px" title="导航菜单" split="true">
		<div class="easyui-accordion" data-options="fit:true,border:false">
			<div title="收支管理" data-options="selected:true,iconCls:'icon-yxgl'" style="padding: 10px">
				<a href="javascript:openTab('收入信息维护','incomeManage.do','icon-yxjhgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-yxjhgl'" style="width: 150px;">收入信息维护</a> 
				<a href="javascript:openTab('支出信息维护','payManage.do','icon-khkfjh')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khkfjh'" style="width: 150px;">支出信息维护</a>
			</div>
			<div title="财务管理" data-options="iconCls:'icon-khgl'" style="padding: 10px;">
				<a href="javascript:openTab('证券帐户管理','securityManage.do','icon-khxxgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khxxgl'" style="width: 150px;">证券帐户管理</a>
				<a href="javascript:openTab('持股管理','sharesManage.do','icon-khlsgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khlsgl'" style="width: 150px;">持股管理</a> 
				<a href="javascript:openTab('证券流水账管理','tradeManage.do','icon-khlsgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khlsgl'" style="width: 150px;">证券流水账管理</a>
			</div>
			<div title="报表管理" data-options="iconCls:'icon-chart'" style="padding: 10px">
				<a href="javascript:openTab('按时间收入报表','incomeTimeManage.do','icon-khgxfx')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khgxfx'" style="width: 150px;">按时间收入报表</a> 
				<a href="javascript:openTab('按时间支出报表','payTimeManage.do','icon-khgcfx')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khgcfx'" style="width: 150px;">按时间支出报表</a>
				<a href="javascript:openTab('按类型报表','typePieManage.do','icon-khgcfx')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khgcfx'" style="width: 150px;">按类型报表</a>
			</div>
			<c:if test="${currentUser.roleid==1 }">
			<div title="数据库管理" data-options="iconCls:'icon-jcsjgl'" style="padding: 10px">
				<a href="javascript:openTab('数据库备份','databackManage.do','icon-cpxxgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cpxxgl'" style="width: 150px;">数据库备份</a>
				<a href="javascript:openTab('数据库恢复','datarecoverManage.do','icon-cpxxgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cpxxgl'" style="width: 150px;">数据库恢复</a>
				<a href="javascript:openTab('数据库初始化','datainitManage.do','icon-cpxxgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cpxxgl'" style="width: 150px;">数据库初始化</a>
				<a href="javascript:openTab('数据库整理','dataorderManage.do','icon-cpxxgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cpxxgl'" style="width: 150px;">数据库整理</a>
			</div>
			</c:if>
			<div title="用户管理" data-options="iconCls:'icon-item'" style="padding: 10px">
				<c:if test="${currentUser.roleid==1 }">
					<a href="javascript:openTab('用户信息管理','userManage.do','icon-sjzdgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-sjzdgl'" style="width: 150px;">用户信息管理</a>
					<a href="javascript:openTab('角色管理','roleManage.do','icon-sjzdgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-sjzdgl'" style="width: 150px;">角色管理</a>
					<a href="javascript:openTab('数据字典管理','datadicManage.do','icon-sjzdgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-sjzdgl'" style="width: 150px;">数据字典管理</a>
				</c:if>
				<a href="javascript:openMessageModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khxxgl'" style="width: 150px;">修改用户信息</a> 
				<a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a> 
				<a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
			</div>
		</div>
	</div>


	<div id="dlg" class="easyui-dialog" style="width: 400px; height: 250px; padding: 10px 20px" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>用户名：</td>
					<td><input type="text" id="username" name="username" value="${currentUser.username }" readonly="readonly" style="width: 200px" /></td>
				</tr>
				<tr>
					<td>原密码：</td>
					<td><input type="password" id="oldPassword" class="easyui-validatebox" required="true" style="width: 200px" /></td>
				</tr>
				<tr>
					<td>新密码：</td>
					<td><input type="password" id="newPassword" name="password" class="easyui-validatebox" required="true" style="width: 200px" /></td>
				</tr>
				<tr>
					<td>确认新密码：</td>
					<td><input type="password" id="newPassword2" class="easyui-validatebox" required="true" style="width: 200px" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:modifyPassword()" class="easyui-linkbutton" iconCls="icon-ok">保存</a> 
		<a href="javascript:closePasswordModifyDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
	
	<div id="mdlg" class="easyui-dialog" style="width: 670px;height:300px;padding: 10px 20px" closed="true" buttons="#mdlg-buttons">
	 	<form id="mfm" method="post">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>用户名：</td>
	 				<td><input type="text" id="m_username" name="username" class="easyui-validatebox easyui-textbox" required="true" value="${usermessage.username }"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>真实姓名：</td>
	 				<td><input type="text" id="truename" name="truename" class="easyui-validatebox easyui-textbox" required="true" value="${usermessage.truename }"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>性别：</td>
	 				<td>
	 					<select class="easyui-combobox" id="sex" name="sex" editable="false" style="width:175px;">
	 						<option value="">请选择...</option>
	 						<option value="1" <c:if test="${usermessage.sex==1 }"> selected="selected" </c:if>>男</option>
	 						<option value="2" <c:if test="${usermessage.sex==2 }"> selected="selected" </c:if>>女</option>
	 					</select>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>年龄：</td>
	 				<td><input type="text" id="age" name="age" class="easyui-validatebox easyui-numberbox" required="true" value="${usermessage.age }"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>联系电话：</td>
	 				<td><input type="text" id="phone" name="phone" class="easyui-validatebox easyui-textbox" required="true" value="${usermessage.phone }"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>邮箱：</td>
	 				<td><input type="text" id="email" name="email" class="easyui-validatebox easyui-textbox" validType="email" required="true" value="${usermessage.email }"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>家庭称谓：</td>
	 				<td><input type="text" id="appellation" name="appellation" class="easyui-validatebox easyui-textbox" required="true" value="${usermessage.appellation }"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>住址：</td>
	 				<td><input type="text" id="address" name="address" class="easyui-validatebox easyui-textbox" required="true"value="${usermessage.address }"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>银行卡号：</td>
	 				<td><input type="text" id="card" name="card" class="easyui-validatebox easyui-textbox" required="true" value="${usermessage.card }"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>工资：</td>
	 				<td><input type="text" id="salary" name="salary" class="easyui-validatebox easyui-numberbox" required="true" value="${usermessage.salary }"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>用户角色：</td>
	 				<td>
	 					<select class="easyui-combobox" id="roleid" name="roleid" editable="false" readonly="readonly" style="width:175px;">
	 						<option value="">请选择角色...</option>
	 						<c:forEach items="${roles }" var="role">
								<option value="${role.id }" <c:if test="${usermessage.roleid==role.id }"> selected="selected" </c:if>>${role.rolename }</option>
							</c:forEach>
	 					</select>&nbsp;<font color="red">*</font>
	 				</td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td></td>
	 				<td><input type="hidden" id="password" name="password" class="easyui-validatebox easyui-textbox" required="true" value="${usermessage.password }"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
	<div id="mdlg-buttons">
		<a href="javascript:modifyMessage()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeMessageModifyDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>