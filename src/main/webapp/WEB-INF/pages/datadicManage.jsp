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
<script type="text/javascript" src="${basePath}jquery-easyui-1.3.3/jquery.cookie.js"></script>
<script type="text/javascript">

	var url;
	
	function searchDatadic(){
		$("#dg").datagrid('load',{
			"datadicname":$("#s_datadicname").combobox("getValue"),
			"datadicvalue":$("#s_datadicvalue").val()
		});
	}
	
	function resetSearch(){
		$("#s_datadicname").combobox("setValue","");
		$("#s_datadicvalue").val("");
	}
	
	function deleteDatadic(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${basePath}datadicdelete.do",{ids:ids},function(result){
					if(result.errres){
						$.messager.alert("系统提示",result.errmsg);
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","数据删除失败！");
					}
				},"json");
			}
		});
	}
	
	
	function openDatadicAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加数据字典");
		url="${basePath}datadicsave.do";
	}
	
	function openDatadicModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑数据字典");
		$('#fm').form('load',row);
		url="${basePath}datadicsave.do?id="+row.id;
	}
	
	function saveDatadic(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				if($("#datadicname").combobox("getValue")==""||$("#datadicname").combobox("getValue")==null){
					$.messager.alert("系统提示","请选择数据字典名称！");
					return false;
				}
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.errres){
					$.messager.alert("系统提示",result.errmsg);
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示",result.errmsg);
					return;
				}
			}
		});
	}
	
	function resetValue(){
		$("#datadicname").combobox("setValue","");
		$("#datadicvalue").val("");
	}
	
	function closeDatadicDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="数据字典管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${basePath}datadiclist.do" fit="true" toolbar="#tb" remoteSort="false" multiSort="true">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="id" width="50" align="center" sortable="true">编号</th>
	 		<th field="datadicname" width="100" align="center" sortable="true">数据字典名称</th>
	 		<th field="datadicvalue" width="100" align="center" sortable="true">数据字典值</th>
	 	</tr>
	 </thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openDatadicAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openDatadicModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteDatadic()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;数据字典名称：&nbsp;<select class="easyui-combobox" id="s_datadicname"  editable="false" style="width:175px;">
					<option value="">请选择名称...</option>
	 				<c:forEach items="${datadicnames }" var="datadicname">
						<option value="${datadicname.datadicname }">${datadicname.datadicname }</option>
					</c:forEach>
				</select>&nbsp;
			&nbsp;数据字典值：&nbsp;<input type="text" id="s_datadicvalue" size="20" onkeydown="if(event.keyCode==13) searchDatadic()"/>
			<a href="javascript:searchDatadic()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			<a href="javascript:resetSearch()" class="easyui-linkbutton" iconCls="icon-reset" plain="true">清空</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 400px;height:200px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post">
	 		<table cellspacing="15px">
	 			<tr>
	 				<td>数据字典名称：</td>
	 				<td>
	 					<select class="easyui-combobox" id="datadicname" name="datadicname" editable="false" style="width:140px;">
	 						<option value="">请选择名称...</option>
	 						<c:forEach items="${datadicnames }" var="datadicname">
								<option value="${datadicname.datadicname }">${datadicname.datadicname }</option>
							</c:forEach>
	 					</select>&nbsp;<font color="red">*</font>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td>数据字典值：</td>
	 				<td><input type="text" id="datadicvalue" name="datadicvalue" class="easyui-validatebox easyui-textbox" size="20" required="true"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveDatadic()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeDatadicDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>