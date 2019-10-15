<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/_common.jsp" %>
<h2>${description}</h2>
<br />
<div class="panel panel-primary">	
	<div class="panel-body">
		<form role="form" id="${className?uncap_first}Form" method="post" class="form-horizontal form-groups-bordered">
			<input type="hidden" name="${pkField}" id="${pkField}" value="${'$'}{${className?uncap_first}.${pkField}}">  
			<#list columns as po>
	  		<#if po.isShowForm == 'Y'>
	  		<div class="form-group">
	        	<label for="field-1" class="col-sm-3 control-label">${po.description}</label>
	        	<div class="col-sm-5">
		    	<input type="text" class="form-control" name="${po.fieldName}" id="${po.fieldName}" 
		          	value="${'$'}{${className?uncap_first}.${po.fieldName}}" ${po.formValidType?default("")} maxlength="${po.columnLength?if_exists}"/>
	      		</div>
	      	</div>
	      	</#if>
	      	</#list>
			
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-5">
					<button type="submit" class="btn btn-success">
					<c:if test="${'$'}{empty ${className?uncap_first}.${pkField}}">保存</c:if>
	          		<c:if test="${'$'}{not empty ${className?uncap_first}.${pkField}}">修改</c:if>
					</button>
					<button type="button" class="btn btn-cancel" onclick="golist();">返回</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		${'$'}('${'#'}${className?uncap_first}Form').validate({
			submitHandler: function() {
				save(${'$'}('${'#'}${className?uncap_first}Form'), '${'$'}{ctx}/${entityPackage}/${className?uncap_first}/save.ajax');
			}
		});
	});
</script>