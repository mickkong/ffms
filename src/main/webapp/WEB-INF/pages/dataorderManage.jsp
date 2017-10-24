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
	function searchDataorder(){
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
	
	function deleteDataorder(){
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
	
	function beginDataorder(){
		var c_tablename = $("#c_tablename").combobox("getValue");
		var c_startid = $("#c_startid").val();
		var c_endid = $("#c_endid").val();
		if(c_tablename==""||c_tablename==null){
			$.messager.alert("系统提示","请选择表名！");
			return;
		}
		if(c_startid==""||c_startid==null||c_startid<1){
			$.messager.alert("系统提示","起始数据应大于1！");
			return;
		}
		if(c_endid==""||c_endid==null||c_endid<1){
			$.messager.alert("系统提示","截止数据应大于1！");
			return;
		}
		if((c_startid!="")&&(c_endid!="")&&(c_startid>c_endid)){
			$.messager.alert("系统提示","起始数据应大于截止数据！");
			return;
		}
		$.messager.confirm("系统提示","您确定要删除【" + c_tablename + "】表中的第" + c_startid + "-" + c_endid + "条数据吗？",function(r){
			if(r){
				$.messager.progress({
	                title:'整理数据',
	                msg:'数据整理中，请稍候...'
	            });
				$.post("${basePath}dataorder.do",{userid:"${currentUser.id}",tablename:c_tablename,startid:c_startid,endid:c_endid},function(result){
					$.messager.progress('close');
					if(result.errres){
						$.messager.alert("系统提示",result.errmsg);
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","数据整理失败！");
					}
				},"json");
			}
		});
	}
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="数据库整理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${basePath}databaselist.do?dataid=4" fit="true" toolbar="#tb" remoteSort="false" multiSort="true">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="id" width="50" align="center" sortable="true">编号</th>
	 		<th field="username" width="100" align="center" sortable="true">操作人</th>
	 		<th field="time" width="100" align="center" sortable="true">整理时间</th>
	 		<th field="datadicvalue" width="100" align="center" sortable="true">操作</th>
	 		<th field="location" width="200" align="center" sortable="true">描述</th>
	 	</tr>
	 </thead>
	</table>
	<div id="tb">
		<div>
			&nbsp;数据表：&nbsp;<select class="easyui-combobox" id="c_tablename"  editable="false" style="width:140px;">
				<option value="">请选择数据表...</option>
				<option value="t_income">收入表</option>
				<option value="t_pay">支出表</option>
				<option value="t_security">证券表</option>
				<option value="t_shares">股票表</option>
				<option value="t_trade">证券流水账表</option>
			</select>
			&nbsp;数据范围：&nbsp;<input type="text" class="easyui-numberbox" id="c_startid" size="10"/>&nbsp;&nbsp;~&nbsp;&nbsp;
			<input type="text" class="easyui-numberbox" id="c_endid" size="10"/>
			<a href="javascript:beginDataorder()" class="easyui-linkbutton" iconCls="icon-undo" plain="true">删除所选数据</a>
			<a href="javascript:deleteDataorder()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除记录</a>
		</div>
		<div>
			&nbsp;操作人：&nbsp;<input type="text" id="s_username" size="20" onkeydown="if(event.keyCode==13) searchDataorder()"/>
			&nbsp;整理起止时间：&nbsp;<input type="text" id="s_starttime" class="easyui-datetimebox" size="20" onkeydown="if(event.keyCode==13) searchDataorder()"/>
			<span style="font-weight:bold;">&sim;</span>&nbsp;<input type="text" id="s_endtime" class="easyui-datetimebox" size="20" onkeydown="if(event.keyCode==13) searchDataorder()"/>
			<a href="javascript:searchDataorder()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			<a href="javascript:resetSearch()" class="easyui-linkbutton" iconCls="icon-reset" plain="true">清空</a>
		</div>
	</div>
</body>
</html>