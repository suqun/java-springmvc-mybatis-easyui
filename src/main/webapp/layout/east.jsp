<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript" charset="utf-8">
	$(function() {

		$('#layout_east_calendar').calendar({
			fit : true,
			current : new Date(),
			border : false,
			onSelect : function(date) {
				$(this).calendar('moveTo', new Date());
			}
		});

		$('#layout_east_onlinePanel').panel({
			tools : [ {
				iconCls : 'database_refresh',
				handler : function() {
				}
			} ]
		});

	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',border:false" style="height: 180px; overflow: hidden;">
		<div id="layout_east_calendar"></div>
	</div>
	<div data-options="region:'center',border:false" style="overflow: hidden;">
		<div id="layout_east_onlinePanel" data-options="fit:true,border:false" title="SYPRO收到的捐助">
			<div class="well well-small" style="margin: 3px;">
				<a href="https://me.alipay.com/sypro" target="_blank"><img alt="捐助SyPro" src="<%=request.getContextPath()%>/style/images/alipay.jpg" /></a>
				<hr />
				<div>
					<span class="label label-important">阿鹏</span><br /> 2012.08.20 11:38:49<br /> 2012.08.20 13:15:35<br />2012.12.12 16:35:14
				</div>
				<div>
					<span class="label label-success">阿宾</span><br />2013.05.10 14:49:13)
				</div>
				<div>
					<span class="label label-important">阿雷</span><br />2013.05.12 12:20:34
				</div>
				<div>
					<span class="label label-success">阿伟</span><br />2013.05.12 18:27:21
				</div>
				<div>
					<span class="label label-success">阿毛</span><br />2013.05.14 22:20:48
				</div>
				<div>
					<span class="label label-success">阿东</span><br />2013.05.14 22:23:46
				</div>
				<div>
					<span class="label label-success">阿宇</span><br />2013.05.16 15:17:26
				</div>
				<div>
					<span class="label label-success">阿星</span><br />2013.05.17 14:24:40
				</div>
				<div>
					<span class="label label-success">阿P</span><br />2013.05.17 14:44:32
				</div>
				<div>
					<span class="label label-success">阿军</span><br />2013.05.31 20:07:09
				</div>
				<hr />
				如果发现系统有BUG，请给我发Email:215144509@qq.com
			</div>
		</div>
	</div>
</div>