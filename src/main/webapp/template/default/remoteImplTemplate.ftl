package ${sourceBasePackage}.remote.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import ${sourceBasePackage}.remote.I${className}Remote;
import ${sourceBasePackage}.${databaseType}.service.I${className}Service;
import ${sourceBasePackage}.vo.${className}Vo;
import com.github.pagehelper.PageInfo;
import com.olymtech.extend.common.bean.Pagination;

/**
 * <p>File：${className}RemoteImpl.java</p>
 * <p>Title: </p>
 * <p>Description:${description}</p>
 * <p>Copyright: Copyright (c) ${createDate}</p>
 * <p>Company: olymtech.com</p>
 * @author ${author}
 * @version 1.0
 */
@Component("${className?uncap_first}Remote")
public class ${className}RemoteImpl implements I${className}Remote {

	private Logger logger = Logger.getLogger(${className}RemoteImpl.class);
	
	@Autowired
	private I${className}Service ${className?uncap_first}Service;
	
	@Override
	public PageInfo<${className}Vo> find${className}Page(${className}Vo ${className?uncap_first}Vo, Pagination pagination){
		return ${className?uncap_first}Service.findEntityPage(${className?uncap_first}Vo, pagination);
	}
	
	@Override
	public List<${className}Vo> find${className}Search(${className}Vo ${className?uncap_first}Vo){
		return ${className?uncap_first}Service.findEntitySearch(${className?uncap_first}Vo);
	}
	
	<#if pkField??>
	@Override
	public ${className}Vo find${className}(${pkType} ${pkField}){
		return ${className?uncap_first}Service.findEntity(${pkField});
	}
	</#if>
	
	@Override
	public ${className}Vo find${className}(${className}Vo ${className?uncap_first}Vo){
		return ${className?uncap_first}Service.findEntity(${className?uncap_first}Vo);
	}

	@Override
	public Integer save${className}(${className}Vo ${className?uncap_first}Vo){
		return ${className?uncap_first}Service.insertEntity(${className?uncap_first}Vo);
	}
	
	@Override
	public Integer insert${className}(${className}Vo ${className?uncap_first}Vo){
		return ${className?uncap_first}Service.insertEntity(${className?uncap_first}Vo);
	}
	
	@Override
	public Integer update${className}(${className}Vo ${className?uncap_first}Vo){
		return ${className?uncap_first}Service.updateEntityId(${className?uncap_first}Vo);
	}
	
	@Override
	public void update${className}Batch(List<${className}Vo> ${className?uncap_first}VoList){
		${className?uncap_first}Service.updateEntityBatch(${className?uncap_first}VoList);
	}
	
	@Override
	public void insert${className}Batch(List<${className}Vo> ${className?uncap_first}VoList){
		${className?uncap_first}Service.insertEntityBatch(${className?uncap_first}VoList);
	}

	<#if pkField??>
	@Override
	public Integer delete${className}(${pkType} ${pkField}){
		return ${className?uncap_first}Service.deleteEntity(${pkField});
	}
	</#if>
	
	@Override
	public Integer delete${className}(${className}Vo ${className?uncap_first}Vo){
		return ${className?uncap_first}Service.deleteEntity(${className?uncap_first}Vo);
	}
	
	<#if pkField??>
	@Override
	public Integer delete${className}Batch(List<${pkType}> ${pkField}List){
		return ${className?uncap_first}Service.deleteEntityBatch(${pkField}List);
	}
	</#if>
	
	@Override
	public Integer count${className}(${className}Vo ${className?uncap_first}Vo){
		return ${className?uncap_first}Service.countEntity(${className?uncap_first}Vo);
	}
 	
}