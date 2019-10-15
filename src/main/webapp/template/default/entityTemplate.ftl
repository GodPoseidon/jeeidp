package ${sourceBasePackage}.entity;


import java.math.BigDecimal;

import java.util.Date;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.olymtech.extend.common.automation.entity.BaseEntity;

/**
 * <p>File：${className}.java</p>
 * <p>Title: </p>
 * <p>Description:${description}</p>
 * <p>Copyright: Copyright (c) ${createDate}</p>
 * <p>Company: olymtech.com</p>
 * @author ${author}
 * @version 1.0
 */

public class ${className} extends BaseEntity { 
	
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	
	<#list columns as po>
	<#if po.isKey=="Y"><#if databaseType=="mysql">@TableId(type = IdType.AUTO)<#else>@TableId(type = IdType.INPUT)</#if><#else>/**${po.description}*/</#if>
	private ${po.fieldType} ${po.fieldName};  
	</#list>
	
	<#list columns as po>
	/**
	 *方法: 取得${po.fieldType}
	 *@return: ${po.fieldType}  ${po.description}
	 */
	public ${po.fieldType} get${po.fieldName?cap_first}(){
		return this.${po.fieldName};
	}

	/**
	 *方法: 设置${po.fieldType}
	 *@param: ${po.fieldType}  ${po.description}
	 */
	public void set${po.fieldName?cap_first}(${po.fieldType} ${po.fieldName}){
		this.${po.fieldName} = ${po.fieldName};
	}
	
	</#list> 
}
