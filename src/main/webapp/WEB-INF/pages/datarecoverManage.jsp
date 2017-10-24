<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/Head.jsp"%>
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
<script type="text/javascript" src="${basePath}jquery-easyui-1.3.3/jquery.cookie.js"></script>
<script type="text/javascript">
	function searchDatarecover(){
		var s_starttime = $("#s_starttime").datetimebox("getValue");
		var s_endtime = $("#s_endtime").datetimebox("getValue");
		if((s_starttime!="")&&(s_endtime!="")&&(s_starttime>s_endtime)){
			$.messager.alert("系统提示","起始时间不能大于截止时间！");
			return;
		}
		$("#dg").datagrid('load',{
			"username":$("#s_username").val(),
			"starttime":s_starttime,
			"endtime":s_endtime
		});
	}
	
	function resetSearch(){
		$("#s_username").val("");
		$("#s_starttime").datetimebox("setValue","");
		$("#s_endtime").datetimebox("setValue","");
	}
	
	function deleteDatarecover(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的记录！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删除这<font color=red>"+selectedRows.length+"</font>条记录吗？",function(r){
			if(r){
				$.post("${basePath}databasedelete.do",{ids:ids},function(result){
					if(result.errres){
						$.messager.alert("系统提示",result.errmsg);
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","记录删除失败！");
					}
				},"json");
			}
		});
	}
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="数据库恢复" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${basePath}databaselist.do?dataid=2" fit="true" toolbar="#tb" remoteSort="false" multiSort="true">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="id" width="40" align="center" sortable="true">编号</th>
	 		<th field="username" width="80" align="center" sortable="true">恢复人</th>
	 		<th field="filename" width="100" align="center" sortable="true">恢复文件名</th>
	 		<th field="time" width="100" align="center" sortable="true">恢复时间</th>
	 		<th field="location" width="250" align="center" sortable="true">恢复路径</th>
	 		<th field="datadicvalue" width="80" align="center" sortable="true">操作</th>
	 	</tr>
	 </thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:deleteDatarecover()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除记录</a>
		</div>
		<div>
			&nbsp;恢复人：&nbsp;<input type="text" id="s_username" size="20" onkeydown="if(event.keyCode==13) searchDatarecover()"/>
			&nbsp;恢复起止时间：&nbsp;<input type="text" id="s_starttime" class="easyui-datetimebox" size="20" onkeydown="if(event.keyCode==13) searchDatarecover()"/>
			<span style="font-weight:bold;">&sim;</span>&nbsp;<input type="text" id="s_endtime" class="easyui-datetimebox" size="20" onkeydown="if(event.keyCode==13) searchDatarecover()"/>
			<a href="javascript:searchDatarecover()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			<a href="javascript:resetSearch()" class="easyui-linkbutton" iconCls="icon-reset" plain="true">清空</a>
		</div>
	</div>
</body>
</html>