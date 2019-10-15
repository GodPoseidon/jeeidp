<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/_common.jsp" %>
<form id="listForm" action="">
<#assign colspan = 2>
<table class="tablelist">
	<thead>
		<tr>
			<th><input name="" id="allcheck" type="checkbox" value="" checked="checked"/></th>
			<#list columns as po>
			<#if po.isShowList == 'Y'>
			<#assign colspan = colspan + 1>
			<th>${po.description}</th>
			</#if>
			</#list>
			<th>操作</th>
		</tr>
    </thead>
    <tbody>
    <c:choose>
	   <c:when test="${'$'}{pageInfo.total <= 0}">
	   <tr><td colspan="${colspan}" style="text-align:center;">暂无数据</td></tr>  
	   </c:when>
	   <c:otherwise>
	   <c:forEach items="${'$'}{pageInfo.list}" var="${className?uncap_first}" varStatus="vs">
		<tr>
			<td><input name="idAry" type="checkbox" value="${'$'}{${className?uncap_first}.id}" /></td>
			<#list columns as po>
			<#if po.isShowList == 'Y'>
			<td>${'$'}{${className?uncap_first}.${po.fieldName}}</td>
			</#if>
			</#list>
			<td>
				<sr:auth url="/${entityPackage}/${className?uncap_first}/info">
				<a href="javascript:void(0);" class="tablelink" onclick="update('${'$'}{ctx}/${entityPackage}/${className?uncap_first}/info?${pkField}=${'$'}{${className?uncap_first}.${pkField}}')"><i class="entypo-pencil"></i>编辑</a>
				</sr:auth>
				<sr:auth url="/${entityPackage}/${className?uncap_first}/delete.ajax">
				<a href="javascript:void(0);" class="tablelink" onclick="del('${'$'}{ctx}/${entityPackage}/${className?uncap_first}/delete.ajax?${pkField}=${'$'}{${className?uncap_first}.${pkField}}')"><i class="entypo-cancel"></i>删除</a>
				</sr:auth>
			</td>
		</tr>
		</c:forEach>
	   </c:otherwise>
	</c:choose>
    </tbody>
</table>
</form>

<%@ include file="/WEB-INF/views/admin/home/page.jsp" %>
<script type="text/javascript">
$(function(){
	$('.tablelist tbody tr:odd').addClass('odd');
	$("#allcheck").click(function(){
		var isChecked = $(this).prop("checked");
	    $("input[name='idAry']").prop("checked", isChecked);
	});
});
</script>