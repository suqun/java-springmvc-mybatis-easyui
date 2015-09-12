<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>系统登录</title>
<jsp:include page="inc.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/Css/login.css" type="text/css">
 
<script type="text/javascript" charset="utf-8">
	var loginDialog;
	$(function() {
		loginDialog = $('#loginDialog').show().dialog({
		    id: 'loginBtn',
			modal : true,
			closable : false,
			draggable : false,
			buttons : [ {
				text : '登录',
				disabled : true,
				handler : function() {
					loginFun();
				}
			} ]
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
		
		//登陆按钮前添加图形验证码
		var $verifyInput = $('<input class="verify-input" id="verifyInput" name="code" maxlength="6"/>');
		var $verifyImg = $('<img src="${pageContext.request.contextPath}/captchaServlet" id="verifyImg" class="verify-img"/>');
	    $('.dialog-button').prepend($verifyInput).prepend($verifyImg); 
	    
	    //对图形验证码添加事件 
	  	$verifyImg.on('click', function() {
	        $(this).attr('src', '${pageContext.request.contextPath}/captchaServlet');
	    });
	    
 	  	$verifyInput.keydown(function() {
	        return $('#form-body').form('validate');
	    }).keyup(function() {   
	            var target = this;
		        if (target.value.length === 6) {
		            target.disabled = true;
		            $(target).blur();
		            $.post('${pageContext.request.contextPath}/userController/verifyCode', {
		                code: this.value
		            }, function(result) {
		                if (result.success) {
		                    //$('#loginBtn').linkbutton('enable').click();//登陆
							loginFun();
		                } else {
		                    target.disabled = false;
		                    $(target).focus().val('');
		                    $verifyImg.click();
		                }
		            }, 'JSON').error(function() {
		                target.disabled = false;
		                $(target).focus().val('');
		                $verifyImg.click();
		            });
		        }
	    });	    
	});
	
	function loginFun() {
			if ($('#form-body').form('validate')) {//validate方式，未使用form方式提交表单，该语句必须写
				$.post('${pageContext.request.contextPath}/userController/login', $('#form-body').serialize(), function(result) {
					if (result.success) {
						$('#loginDialog').dialog('close');
						location.replace('${pageContext.request.contextPath}/index.jsp');
					} else {
						$.messager.alert('错误', result.msg, 'error');
					}
					parent.$.messager.progress('close');
				}, "JSON");
			}
	}
	
	
</script>
</head>
<body>
	 <div id="loginDialog" title=" " style="width: 500px; height: 300px; overflow: hidden; display: none;">
			<div title="用户输入模式" style="overflow: hidden; padding: 15px;">
				<form id="form-body" method="post">
					<ul> 
		                <li>账	号 <input class="easyui-validatebox account form-textbox" type="text" name="name" value="larry" required="required"></li>
		                <li>密	码 <input class="easyui-validatebox  password form-textbox" type="password" name="pwd" value="123456" required="required"></li>
	                </ul>
				</form> 
				<div id="logo">
		            <h1>SpringMVC+EasyUI基础演示系统</h1>
		        </div>
			</div>
			 
		</div> 
</body> 
</html>