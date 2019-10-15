<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/_common.jsp" %>
<div class="formbody">
	<div class="formtitle"><span><c:if test="${'$'}{empty ${className?uncap_first}.${pkField}}">创建</c:if><c:if test="${'$'}{not empty ${className?uncap_first}.${pkField}}">修改</c:if>${description}</span></div>
	<form role="form" id="infoForm" method="post">
		<input type="hidden" name="${pkField}" id="${pkField}" value="${'$'}{${className?uncap_first}.${pkField}}">  
		<ul class="forminfo">
		<#list columns as po>
  		<#if po.isShowForm == 'Y'>
  		<li><label>${po.description}<b>*</b></label><input type="text" class="dfinput" name="${po.fieldName}" id="${po.fieldName}" 
	          	value="${'$'}{${className?uncap_first}.${po.fieldName}}" ${po.formValidType?default("")} maxlength="${po.columnLength?if_exists}"/></li>
      	</#if>
      	</#list>
      	<li><label>&nbsp;</label>
      	<c:if test="${'$'}{empty ${className?uncap_first}.${pkField}}">
		<sr:auth url="/${entityPackage}/${className?uncap_first}/save.ajax">
		<button type="submit" class="btn btn-success">保存</button>
		</sr:auth>
		</c:if>
	    <c:if test="${'$'}{not empty ${className?uncap_first}.${pkField}}">
	    <sr:auth url="/${entityPackage}/${className?uncap_first}/update.ajax">
	    <button type="submit" class="btn btn-success">修改</button>
	    </sr:auth>
	    </c:if>
      	
		<button type="button" class="btn btn-cancel" onclick="golist();">返回</button>
	    </li>
      	</ul>
	</form>
</div> 
<script type="text/javascript">
	$(function(){
		${'$'}('${'#'}infoForm').validate({
			submitHandler: function() {
				save(${'$'}('${'#'}infoForm'), '${'$'}{ctx}/${entityPackage}/${className?uncap_first}/save.ajax');
			}
		});
	});
</script>