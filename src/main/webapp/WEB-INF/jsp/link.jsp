<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>SyPro</title>
<jsp:include page="inc.jsp"/>
</head>
<body>
	<div class="hero-unit">
		<h1>SyPro基础权限演示系统</h1>
		<div>
			<ul>
				<li>作者：孙宇</li>
				<li>前台由EasyUI1.3.3编写，后台是JAVA语言编写，应用框架spring mvc+hibernate4+maven</li>
			</ul>
		</div>
		<p>
			<a class="btn btn-primary btn-large" href="<%=request.getContextPath()%>/index.jsp" target="_blank"> 进入(里面有源码下载哦) </a>
		</p>
	</div>
	<div class="hero-unit">
		<h1>疯狂秀才权限管理系统</h1>
		<div>
			<ul>
				<li>作者：[.NET]疯狂秀才</li>
				<li>前台由EasyUI编写，后台是.NET语言编写</li>
			</ul>
		</div>
		<p>
			<a class="btn btn-primary btn-large" href="http://www.ilikego.net:81" target="_blank"> 进入 </a>
		</p>
	</div>
	<div class="hero-unit">
		<h1>BtBoys基础演示系统</h1>
		<div>
			<ul>
				<li>作者：郭华</li>
				<li>前台由EasyUI编写，后台我也不知道啥写的，是PHP？？</li>
			</ul>
		</div>
		<p>
			<a class="btn btn-primary btn-large" href="http://php-easyui-demo.btboys.com" target="_blank"> 进入 </a>
		</p>
	</div>
	<div class="hero-unit">
		<h1>EasyUI桌面版演示系统</h1>
		<div>
			<ul>
				<li>作者：郭华|孙宇|风亦飞</li>
				<li>EasyUI的桌面版演示</li>
			</ul>
		</div>
		<p>
			<a class="btn btn-primary btn-large" href="http://app.btboys.com" target="_blank"> 进入 </a>
		</p>
	</div>
</body>
</html>