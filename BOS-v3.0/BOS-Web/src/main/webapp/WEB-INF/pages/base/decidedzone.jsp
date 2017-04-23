<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理定区/调度排班</title>
<!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<!-- 导入easyui类库 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/ext/portal.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/default.css">	
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.portal.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.cookie.js"></script>
<script
	src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<script type="text/javascript">


	function doAdd(){
		$('#addDecidedzoneWindow').window("open");
	}
	
	function doEdit(){
		alert("修改...");
	}
	
	function doDelete(){
		var arr = $("#grid").datagrid('getSelections');
		if(arr.length==0){
			$.messager.alert('警告','请选择需要删除项','warning');	
		}else{
		$("#formgrid").submit();
	}}
	
	function doSearch(){
		$('#searchWindow').window("open");
	}
	
	function doAssociations(){
	/*
	*	1,发送ajax请求，查询关联的客户和没有关联的客户，2次
		2，获取返回数据，添加到左右选择框中，左边是未关联的客户，右边是需要关联的客户
	*/	
	//查询未关联客户
	var rowData = $("#grid").datagrid('getSelected');
	
	if(rowData==null){
		$.messager.alert('警告','关联的分区不能为空','warning');	
	}else{
		 
		$.post("${pageContext.request.contextPath }/decidedZone_findNoAssociationCustomer.action",
				   function(data){
					$("#noassociationSelect option").remove();
						$(data).each(function(){
						   var option = $("<option value='"+this.id+"'>"+this.cname+"</option>");
						   $("#noassociationSelect").append(option);
						 });
			   },"json");
		//查询关联客户
			$.post("${pageContext.request.contextPath }/decidedZone_findAssociationCustomer.action", { "id": rowData.id },
			   function(data){
						$("#associationSelect option").remove();
						$(data).each(function(){
						   var option = $("<option value='"+this.id+"'>"+this.cname+"</option>");
						   $("#associationSelect").append(option);
						   $("#associationSelect option").prop("disabled",true);
						 });
						   },"json");
			$('#customerWindow').window("open");
		}
	}
	
	//工具栏
	var toolbar = [ {
		id : 'button-search',	
		text : '查询',
		iconCls : 'icon-search',
		handler : doSearch
	}, {
		id : 'button-add',
		text : '增加',
		iconCls : 'icon-add',
		handler : doAdd
	}, {
		id : 'button-edit',	
		text : '修改',
		iconCls : 'icon-edit',
		handler : doEdit
	},{
		id : 'button-delete',
		text : '删除',
		iconCls : 'icon-cancel',
		handler : doDelete
	},{
		id : 'button-association',
		text : '关联客户',
		iconCls : 'icon-sum',
		handler : doAssociations
	}];
	// 定义列
	var columns = [ [ {
		field : 'id',
		checkbox : true,
		title : '定区编号',
		width : 120,
		align : 'center'
	},{
		field : 'name',
		title : '定区名称',
		width : 120,
		align : 'center'
	}, {
		field : 'staff.name',
		title : '负责人',
		width : 120,
		align : 'center',
		formatter : function(data,row ,index){
			return row.staff.name;
		}
	}, {
		field : 'staff.telephone',
		title : '联系电话',
		width : 120,
		align : 'center',
		formatter : function(data,row ,index){
			return row.staff.telephone;
		}
	}, {
		field : 'staff.station',
		title : '所属公司',
		width : 120,
		align : 'center',
		formatter : function(data,row ,index){
			return row.staff.station;
		}
	} ] ];
	
	$(function(){
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		// 收派标准数据表格
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : true,
			rownumbers : true,
			singleSelect:true,
			striped : true,
			pageList: [5,8,10],
			pagination : true,
			toolbar : toolbar,
			url : "${pageContext.request.contextPath }/decidedZone_pageQuery.action",
			idField : 'id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加、修改定区
		$('#addDecidedzoneWindow').window({
	        title: '添加修改定区',
	        width: 600,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false,
	        onBeforeClose:function(){
	        	$("#_form")[0].reset();
	        }
	    });
		$('#customerWindow').window({
	        title: '关联客户',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height:300,
	        resizable:false
	    });
		
		// 查询定区
		$('#searchWindow').window({
	        title: '查询定区',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		$("#btn").click(function(){
			alert("执行查询...");
		});
		
		
		$("#toRight").click(function(){
			$("#associationSelect").append($("#noassociationSelect option:selected"));	
		});
		$("#toLeft").click(function(){
			$("#noassociationSelect").append($("#associationSelect option:selected"));	
		});
		
		$("#associationBtn").click(function(){
			$("#associationSelect").prop("select","selected");
			$("#customerDecidedZoneId").val($("#grid").datagrid('getSelected').id);
			$("#customerForm").submit();
			
		});
		
		
	});

	function doDblClickRow(rowIndex, rowData){
		
	/* 	alert("双击表格数据..."); */
		$('#association_subarea').datagrid( {
			fit : true,
			border : true,
			rownumbers : true,
			striped : true,
			url : "${pageContext.request.contextPath }/decidedZone_associationSubarea.action",
			queryParams:{id:rowData.id},
			columns : [ [{
				field : 'id',
				title : '分拣编号',
				width : 120,
				align : 'center'
			},{
				field : 'province',
				title : '省',
				width : 120,
				align : 'center',
				formatter : function(data,row ,index){
					return row.region.province;
				}
			}, {
				field : 'city',
				title : '市',
				width : 120,
				align : 'center',
				formatter : function(data,row ,index){
					return row.region.city;
				}
			}, {
				field : 'district',
				title : '区',
				width : 120,
				align : 'center',
				formatter : function(data,row ,index){
					return row.region.district;
				}
			}, {
				field : 'addresskey',
				title : '关键字',
				width : 120,
				align : 'center'
			}, {
				field : 'startnum',
				title : '起始号',
				width : 100,
				align : 'center'
			}, {
				field : 'endnum',
				title : '终止号',
				width : 100,
				align : 'center'
			} , {
				field : 'single',
				title : '单双号',
				width : 100,
				align : 'center'
			} , {
				field : 'position',
				title : '位置',
				width : 200,
				align : 'center'
			} ] ]
		});

	/* 返回数据为null时候,置空 */
	 /* $('#association_customer').datagrid('load',{'total': 0,'rows':[]}); */
		$('#association_customer').datagrid( {
			fit : true,
			border : true,
			rownumbers : true,
			striped : true,
			url : "decidedZone_findAssociationCustomer.action",
			queryParams:{id:$("#grid").datagrid('getSelected').id},
			columns : [[{
				field : 'id',
				title : '客户编号',
				width : 120,
				align : 'center'
			},{
				field : 'cname',
				title : '客户名称',
				width : 120,
				align : 'center'
			}, {
				field : 'address',
				title : '所属单位',
				width : 120,
				align : 'center'
			}]]
		});
			
	}
	
	function _validatebox(){
		if($("#_form").form('validate')){
			//校验通过
			$("#_form").submit();
		}else{
			$.messager.alert('警告','表单数据异常','warning');
		}
	}
	/* 主键唯一性校验 */
	$.extend($.fn.validatebox.defaults.rules, {

		uniqueId: {
			validator: function(value){
				var flag;
				$.ajax({
					type: "POST",
					url: "${pageContext.request.contextPath }/decidedZone_ajaxId.action",
					data: {id:value},
					async: false,/* 必须要指定异步为false */
					success: function(data){
						flag = data;
					 }
				});
			return flag;
		},
		message: "管理定区编号重复,定区的唯一标识,不能重复,请参考<格式:参考手册>"
			}
		});
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<form id="formgrid" action="${pageContext.request.contextPath }/decidedZone_delete.action" method="post">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	
	<div region="south" border="false" style="height:150px">
		<div id="tabs" fit="true" class="easyui-tabs">
			<div title="关联分区" id="subArea"
				style="width:100%;height:100%;overflow:hidden">
				<table id="association_subarea"></table>
			</div>	
			<div title="关联客户" id="customers"
				style="width:100%;height:100%;overflow:hidden">
				<table id="association_customer"></table>
			</div>	
		</div>
	</div>
	</form>
	<!-- 添加 修改分区 -->
	<div class="easyui-window" title="定区添加修改" id="addDecidedzoneWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="javascript:_validatebox();" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<!-- <div style="overflow:auto;padding:5px;" border="false"> -->
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="_form" action="${pageContext.request.contextPath }/decidedZone_saveOrUpdate.action" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">定区信息</td>
					</tr>
					<tr>
						<td>定区编码</td>
						<td><input type="text" name="id" class="easyui-validatebox" data-options="required:true,validType:['uniqueId']"/></td>
					</tr>
					<tr>
						<td>定区名称</td>
						<td><input type="text" name="name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>选择负责人</td>
						<td>
							<input class="easyui-combobox" name="staff.id" id="staffId"
    							data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath }/staff_findStandard.action'" />  
						</td>
					</tr>
					<tr height="300">
						<td valign="top">关联分区</td>
						<td>
							<table id="subareaGrid" name="subareas" class="easyui-datagrid" border="false" style="width:300px;height:300px" data-options="url:'${pageContext.request.contextPath }/subarea_findStandard.action',fitColumns:true,singleSelect:false">
								<thead>  
							        <tr>  
							            <th data-options="field:'sid',width:30,checkbox:true">编号</th>  
							            <th data-options="field:'addresskey',width:150">关键字</th>  
							            <th data-options="field:'position',width:200,align:'right'">位置</th>  
							        </tr>  
							    </thead> 
							</table>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- 查询定区 -->
	<div class="easyui-window" title="查询定区窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="overflow:auto;padding:5px;" border="false">
			<form>
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">查询条件</td>
					</tr>
					<tr>
						<td>定区编码</td>
						<td><input type="text" name="id" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>所属单位</td>
						<td><input type="text" name="staff.station" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>是否关联分区</td>
						<td><input type="text" name="subareaName" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td colspan="2"><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<div class="easyui-window" title="关联客户窗口" id="customerWindow" collapsible="false" closed="true" minimizable="false" maximizable="false" style="top:20px;left:200px;width: 400px;height: 300px;">
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="customerForm" action="${pageContext.request.contextPath }/decidedZone_associateCustomerToDecidedZone.action" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="3">关联客户</td>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="id" id="customerDecidedZoneId" />
							<select id="noassociationSelect" multiple="multiple" size="10"></select>
						</td>
						<td>
							<input type="button" value=">>" id="toRight"><br/>
							<input type="button" value="<<" id="toLeft" />
						</td>
						<td>
							<select id="associationSelect" name="customerIds" multiple="multiple" size="10"></select>
						</td>
					</tr>
					<tr>
						<td colspan="3"><a id="associationBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">关联客户</a> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	
</body>
</html>