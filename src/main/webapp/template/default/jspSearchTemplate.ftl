<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/_common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>餐厅信息</title>
<link href="${'$'}{res}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${'$'}{res}/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${'$'}{res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${'$'}{res}/js/select-ui.min.js"></script>
<script type="text/javascript" src="${'$'}{res}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${'$'}{res}/js/common/common.js"></script>
<script src="${'$'}{res}/js/fileupload/jquery.ui.widget.js"></script>
<script src="${'$'}{res}/js/fileupload/jquery.fileupload.js"></script>
<style>
span.error{color:#C00;}
</style>
</head>

<body>
<div class="col-md-12">
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    	<li><a href="#">首页</a></li>
    	<li><a href="#">${description}管理</a></li>
    	<li><a href="#">${description}信息</a></li>
    </ul>
    </div>
    <div class="rightinfo">
    	<div class="tools panel-search">
    	<form id="searchForm" action="">
    	<input type="hidden" id="pageNo" name="pageNo"/>
    	<#if list?? && list?size > 0>
    	<ul class="seachform" style="float:left;">
    		<#list columns as po>
	  		<#if po.isQuery == 'Y'>
    		<li><label>${'$'}{po.description}</label><input name="${'$'}{po.fieldName}" id="${'$'}{po.fieldName}" type="text" class="scinput" /></li>
    		</#if>
    		</#list>
		    <li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询" onclick="golist(1);"/></li>
		</ul>
		</#if>
		</form>
        <ul class="toolbar1">
        	<sr:auth url="/${entityPackage}/${className?uncap_first}/save.ajax">
        	<li class="click" onclick="add('${'$'}{ctx}/${entityPackage}/${className?uncap_first}/info');"><span><img src="${'$'}{res}/images/t01.png"/></span>添加</li>
        	</sr:auth>
        	<sr:auth url="/${entityPackage}/${className?uncap_first}/batchdel.ajax">
        	<li class="click" onclick="batchdel(${'$'}('#listForm'), 'idAry', '${'$'}{ctx}/${entityPackage}/${className?uncap_first}/batchdel.ajax');"><span><img src="${'$'}{res}/images/t03.png"/></span>批量删除</li>
        	</sr:auth>
        </ul>
		</div>
		<div class="panel-content"></div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		golist();
	});
	function page(number){
		golist(number);
	}
	function golist(number){ 
		${'$'}("#pageNo").val(number);
		search(${'$'}('#searchForm'), '${'$'}{ctx}/${entityPackage}/${className?uncap_first}/list');
	}
</script>
</body>
</html>