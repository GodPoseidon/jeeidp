<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/_common.jsp" %>
<br />
<div id="table-2_wrapper" class="dataTables_wrapper form-inline no-footer">
	<#assign colspan = 2>
	<table class="table table-bordered table-striped datatable">
		<thead>
			<tr>
				<th>#</th>
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
					<td>${'$'}{vs.count + page.offset}</td>
					<#list columns as po>
					<#if po.isShowList == 'Y'>
					<td>${'$'}{${className?uncap_first}.${po.fieldName}}</td>
					</#if>
					</#list>
					<td>
						<a href="javascript:void(0);" class="btn btn-default btn-sm btn-icon icon-left" onclick="update('${'$'}{ctx}/${entityPackage}/${className?uncap_first}/info?${pkField}=${'$'}{${className?uncap_first}.${pkField}}')"><i class="entypo-pencil"></i>编辑</a>
						<a href="javascript:void(0);" class="btn btn-danger btn-sm btn-icon icon-left" onclick="del('${'$'}{ctx}/${entityPackage}/${className?uncap_first}/delete.ajax?${pkField}=${'$'}{${className?uncap_first}.${pkField}}')"><i class="entypo-cancel"></i>删除</a>
					</td>
				</tr>
				</c:forEach>
			   </c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<c:if test="${'$'}{pageInfo.total > 0}">
	<div class="row">
		<div class="col-xs-6 col-left">
			<div class="dataTables_info" id="table-2_info" role="status" aria-live="polite">共&nbsp;${'$'}{pageInfo.total}&nbsp;条记录，当前显示&nbsp;<input type="text" style="height:30px;width:40px;" value="${'$'}{pageInfo.pageNum}" onkeypress="var e=window.event||this;var c=e.keyCode||e.which;if(c==13)page(this.value);">&nbsp;/&nbsp;${'$'}{pageInfo.pages}&nbsp;ҳ</div>
		</div>
		<div class="col-xs-6 col-right">
		<div class="dataTables_paginate paging_bootstrap" id="table-2_paginate">
			<ul class="pagination pagination-sm">
			<c:choose>
			   <c:when test="${'$'}{pageInfo.pageNum <= 1}">  
			         <li class="prev disabled">
			         	<a href="javascript:void(0);"><i class="entypo-left-open"></i></a>
			         </li>
			   </c:when>
			   <c:otherwise> 
				     <li class="prev">
				     	<a href="javascript:void(0);" onclick="page(${'$'}{pageInfo.pageNum - 1})"><i class="entypo-left-open"></i></a>
				     </li>
			   </c:otherwise>
			</c:choose>
			<c:forEach items="${'$'}{pageInfo.navigatepageNums}" var="s">
				<c:choose>
				   <c:when test="${'$'}{pageInfo.pageNum == s}">  
				         <li class="active"><a href="javascript:void(0);">${'$'}{s}</a></li>
				   </c:when>
				   <c:otherwise> 
					     <li><a href="javascript:void(0);" onclick="page(${'$'}{s})">${'$'}{s}</a></li>
				   </c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
			   <c:when test="${'$'}{pageInfo.pageNum >= pageInfo.pages}">  
			         <li class="next">
			         	<a href="javascript:void(0);"><i class="entypo-right-open"></i></a>
			         </li>
			   </c:when>
			   <c:otherwise> 
				     <li class="next">
				     	<a href="javascript:void(0);" onclick="page(${'$'}{pageInfo.pageNum + 1})"><i class="entypo-right-open"></i></a>
				     </li>
			   </c:otherwise>
			</c:choose>
			</ul>
		</div>
		</div>
	</div>
	</c:if>
</div>