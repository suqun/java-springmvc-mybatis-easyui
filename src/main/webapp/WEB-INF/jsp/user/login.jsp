<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" charset="utf-8">
	var loginDialog;
	var loginTabs;
	var userLoginCombobox;
	var userLoginCombogrid;
	$(function() {
		loginDialog = $('#loginDialog').show().dialog({
			modal : true,
			closable : false,
			buttons : [ {
				text : '注册',
				handler : function() {
					$('#registerDialog').dialog('open');
				}
			}, {
				text : '登录',
				handler : function() {
					loginFun();
				}
			} ]
		});

		userLoginCombobox = $('#userLoginCombobox').combobox({
			url : '${pageContext.request.contextPath}/userController/loginCombobox',
			valueField : 'name',
			textField : 'name',
			required : true,
			panelHeight : 'auto',
			delay : 500
		});

		userLoginCombogrid = $('#userLoginCombogrid').combogrid({
			url : '${pageContext.request.contextPath}/userController/loginCombogrid',
			panelWidth : 450,
			panelHeight : 200,
			idField : 'name',
			textField : 'name',
			pagination : true,
			fitColumns : true,
			required : true,
			rownumbers : true,
			mode : 'remote',
			delay : 500,
			sortName : 'name',
			sortOrder : 'asc',
			pageSize : 5,
			pageList : [ 5, 10 ],
			columns : [ [ {
				field : 'name',
				title : '登录名',
				width : 150
			}, {
				field : 'createdatetime',
				title : '创建时间',
				width : 150
			}, {
				field : 'modifydatetime',
				title : '最后修改时间',
				width : 150
			} ] ]
		});

		var sessionInfo_userId = '${sessionInfo.id}';
		if (sessionInfo_userId) {/*目的是，如果已经登陆过了，那么刷新页面后也不需要弹出登录窗体*/
			loginDialog.dialog('close');
		}

		$('#loginDialog input').keyup(function(event) {
			if (event.keyCode == '13') {
				loginFun();
			}
		});
		userLoginCombobox.combobox('textbox').keyup(function(event) {
			if (event.keyCode == '13') {
				loginFun();
			}
		});
		userLoginCombogrid.combogrid('textbox').keyup(function(event) {
			if (event.keyCode == '13') {
				loginFun();
			}
		});
	});
	function loginFun() {
		if (layout_west_tree) {//当west功能菜单树加载成功后再执行登录

			loginTabs = $('#loginTabs').tabs('getSelected');//当前选中的tab
			var form = loginTabs.find('form');//选中的tab里面的form

			if (form.form('validate')) {//validate方式，未使用form方式提交表单，该语句必须写
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				$.post('${pageContext.request.contextPath}/userController/login', form.serialize(), function(result) {
					if (result.success) {
						if (!layout_west_tree_url) {
							layout_west_tree.tree({
								url : '${pageContext.request.contextPath}/resourceController/tree',
								onBeforeLoad : function(node, param) {
									parent.$.messager.progress({
										title : '提示',
										text : '数据处理中，请稍后....'
									});
								}
							});
						}
						$('#loginDialog').dialog('close');
						$('#sessionInfoDiv').html($.formatString('[<strong>{0}</strong>]，欢迎你！您使用[<strong>{1}</strong>]IP登录！', result.obj.name, result.obj.ip));
						$.messager.show({
							title:'提示',
							msg:result.msg,
							timeout:5000,
							showType:'slide'
						});
					} else {
						$.messager.alert('错误', result.msg, 'error');
					}
					parent.$.messager.progress('close');
				}, "JSON");
			}
		}
	}
</script>
<div id="loginDialog" title="用户登录" style="width: 330px; height: 220px; overflow: hidden; display: none;">
	<div id="loginTabs" class="easyui-tabs" data-options="fit:true,border:false">
		<div title="用户输入模式" style="overflow: hidden; padding: 10px;">
			<form method="post">
				<table class="table table-hover table-condensed">
					<tr>
						<th>登录名</th>
						<td><input name="name" type="text" placeholder="请输入登录名" class="easyui-validatebox" data-options="required:true" value="孙宇"></td>
					</tr>
					<tr>
						<th>密码</th>
						<td><input name="pwd" type="password" placeholder="请输入密码" class="easyui-validatebox" data-options="required:true" value="123456"></td>
					</tr>
				</table>
			</form>
		</div>
		<div title="自动补全模式" style="overflow: hidden; padding: 10px;">
			<form method="post">
				<table class="table table-hover table-condensed">
					<tr>
						<th>登录名</th>
						<td><input id="userLoginCombobox" name="name" type="text" placeholder="请输入登录名" class="easyui-validatebox" data-options="required:true" value="孙宇" style="height: 29px;"></td>
					</tr>
					<tr>
						<th>密码</th>
						<td><input name="pwd" type="password" placeholder="请输入密码" class="easyui-validatebox" data-options="required:true" value="123456"></td>
					</tr>
				</table>
			</form>
		</div>
		<div title="数据表格模式" style="overflow: hidden; padding: 10px;">
			<form method="post">
				<table class="table table-hover table-condensed">
					<tr>
						<th>登录名</th>
						<td><input id="userLoginCombogrid" name="name" type="text" placeholder="请输入登录名" class="easyui-validatebox" data-options="required:true" value="孙宇" style="height: 29px;"></td>
					</tr>
					<tr>
						<th>密码</th>
						<td><input name="pwd" type="password" placeholder="请输入密码" class="easyui-validatebox" data-options="required:true" value="123456"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
 