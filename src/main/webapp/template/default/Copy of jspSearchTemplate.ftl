<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/_common.jsp" %>
<div class="col-md-12">
	<div class="panel-search">
	  <form id="${className?uncap_first}SearchForm" class="form-inline" action="">
	  	<input type="hidden" id="pageNo" name="pageNo"/>
	  	<#list columns as po>
	  	<#if po.isQuery == 'Y'>
	    <div class="form-group">
	      <label class="control-label">${po.description}</label>
	      <input type="text" class="form-control" name="${po.fieldName}" id="${po.fieldName}"> 
	    </div>
	    </#if>
	    </#list>
	  </form>
	  <br/>
	  <div class="btn-div">
	  		<button type="button" class="btn btn-primary" onclick="golist();">
				<i class="fa fa-search"></i> 搜索
			</button>
			<button type="button" class="btn btn-warning" onclick="add('${'$'}{ctx}/${entityPackage}/${className?uncap_first}/info');">
				<i class="fa fa-plus"></i> 新建
			</button>
		</div>
	</div>
	<div class="panel-content"></div>
</div>
<script type="text/javascript">
	$(function(){
		golist();
	});
	function page(number){
		$("#pageNo").val(number);
		golist();
	}
	function golist(){
		search(${'$'}('${'#'}${className?uncap_first}SearchForm'), '${'$'}{ctx}/${entityPackage}/${className?uncap_first}/list');
	}
</script>