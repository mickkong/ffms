<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/Head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link class="uiTheme" rel="stylesheet" type="text/css" href="${basePath}jquery-easyui-1.3.3/themes/<%=themeName %>/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath}jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${basePath}jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath}jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;

	function searchShares() {
		$("#dg").datagrid('load',{
			"sharesname" : $("#s_sharesname").val(),
			"holder" : $("#s_holder").combobox("getValue"),
			"securityname" : $("#s_securityname").combobox("getValue")
		});
	}

	function resetSearch() {
		$("#s_sharesname").val("");
		$("#s_holder").combobox("setValue", "");
		$("#s_securityname").combobox("setValue", "");
	}
	
	function deleteShares() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据！");
			return;
		}
		var strIds = [];
		for (var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].id);
		}
		var ids = strIds.join(",");
		$.messager.confirm("系统提示", "您确认要删除这<font color=red>"
				+ selectedRows.length + "</font>条数据吗？", function(r) {
			if (r) {
				$.post("${basePath}/sharesdelete.do", {
					ids : ids
				}, function(result) {
					if (result.errres) {
						$.messager.alert("系统提示", result.errmsg);
						$("#dg").datagrid("reload");
					} else {
						$.messager.alert("系统提示", "数据删除失败！");
					}
				}, "json");
			}
		});
	}

	function openSharesAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加股票信息");
		url = "${basePath}sharessave.do";
	}

	function openSharesModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "编辑股票信息");
		$('#fm').form('load', row);
		url = "${basePath}sharessave.do?id=" + row.id;
	}

	function saveShares() {
		$("#fm").form("submit",{
			url : url,
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(result) {
				var result = eval('(' + result + ')');
				if (result.errres) {
					$.messager.alert("系统提示", result.errmsg);
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				} else {
					$.messager.alert("系统提示", result.errmsg);
					return;
				}
			}
		});
	}
	
	function resetValue() {
		$("#holder").combobox("setValue", "");
		$("#securityname").combobox("setValue", "");
		$("#sharesname").val("");
		$("#price").numberbox("setValue", "");
		$("#number").numberbox("setValue", "");
		$("#sharestime").datetimebox("setValue", "");
	}

	function closeSharesDialog() {
		$("#dlg").dialog("close");
		resetValue();
	}

</script>
</head>
<body style="margin: 1px;">
	<table id="dg" title="持股管理" class="easyui-datagrid" fitColumns="true"
		pagination="true" rownumbers="true" url="${basePath}shareslist.do?roleid=${currentUser.roleid}&userid=${currentUser.id}"
		fit="true" toolbar="#tb" remoteSort="false" multiSort="true">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="50" align="center" sortable="true">编号</th>
				<th field="username" width="100" align="center" sortable="true">记录人</th>
				<th field="sharesname" width="100" align="center" sortable="true">股票名称</th>
				<th field="holder" width="100" align="center" sortable="true">持股人</th>
				<th field="securityname" width="100" align="center" sortable="true">证券账号</th>
				<th field="createtime" width="100" align="center" sortable="true">创建时间</th>
				<th field="updatetime" width="100" align="center" sortable="true">修改时间</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openSharesAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:openSharesModifyDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:deleteShares()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;股票名称：&nbsp;<input type="text" id="s_sharesname" size="15" onkeydown="if(event.keyCode==13) searchShares()" />
			&nbsp;持股人：&nbsp;<select class="easyui-combobox" id="s_holder" editable="true" style="width: 140px;" onkeydown="if(event.keyCode==13) searchShares()">
				<option value="">请选择...</option>
				<c:forEach items="${allUsers }" var="alluser">
					<option value="${alluser.username }">${alluser.username }</option>
				</c:forEach>
			</select>
			&nbsp;证券账号：&nbsp;<select class="easyui-combobox" id="s_securityname" editable="true" style="width: 140px;" onkeydown="if(event.keyCode==13) searchShares()">
				<option value="">请选择类型...</option>
				<c:forEach items="${allSecuritys }" var="allSecurity">
					<option value="${allSecurity.securityname }">${allSecurity.securityname }</option>
				</c:forEach>
			</select>
			<a href="javascript:searchShares()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a> 
			<a href="javascript:resetSearch()" class="easyui-linkbutton" iconCls="icon-reset" plain="true">清空</a>
		</div>
	</div>

	<div id="dlg" class="easyui-dialog" style="width: 670px; height: 200px; padding: 10px 20px" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>股票名称：</td>
					<td><input type="text" id="sharesname" name="sharesname" class="easyui-validatebox easyui-textbox" required="true" />&nbsp;<font
						color="red">*</font></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>持股人：</td>
					<td><select class="easyui-combobox" id="holder" name="holder" editable="true" style="width: 175px;">
							<option value="">请选择...</option>
							<c:forEach items="${allUsers }" var="alluser">
								<option value="${alluser.username }">${alluser.username }</option>
							</c:forEach>
						</select>&nbsp;<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td>证券账号：</td>
					<td><select class="easyui-combobox" id="securityid" name="securityid" editable="false" style="width: 175px;">
							<option value="">请选择类型...</option>
							<c:forEach items="${allSecuritys }" var="allSecurity">
								<option value="${allSecurity.id }">${allSecurity.securityname }</option>
							</c:forEach>
					</select>&nbsp;<font color="red">*</font></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td></td>
					<td><input type="hidden" id="userid" name="userid" class="easyui-validatebox easyui-textbox" required="true" value="${currentUser.id}"/></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveShares()" class="easyui-linkbutton" iconCls="icon-ok">保存</a> 
		<a href="javascript:closeSharesDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>