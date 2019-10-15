package ${sourceBasePackage}.remote;

import java.util.List;

import ${sourceBasePackage}.vo.${className}Vo;
import com.olymtech.extend.common.bean.Pagination;
import com.github.pagehelper.PageInfo;

/**
 * <p>File：${className}Remote.java</p>
 * <p>Title: </p>
 * <p>Description:${description}</p>
 * <p>Copyright: Copyright (c) ${createDate}</p>
 * <p>Company: olymtech.com</p>
 * @author ${author}
 * @version 1.0
 */
public interface I${className}Remote{
	
 	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	分页查询
	 * </pre>
	 * 
	 * @param ${className?uncap_first}Vo	实体
	 * @param page			分页实体
	 * @return
	 */
	public PageInfo<${className}Vo> find${className}Page(${className}Vo ${className?uncap_first}Vo, Pagination pagination);
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	查询
	 * </pre>
	 * 
	 * @param ${className?uncap_first}Vo	实体
	 * @return
	 */
	public List<${className}Vo> find${className}Search(${className}Vo ${className?uncap_first}Vo);
	
	
	<#if pkField??>
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	通过ID查询
	 * </pre>
	 * 
	 * @param ${pkField}	主键ID
	 * @return
	 */
	public ${className}Vo find${className}(${pkType} ${pkField});
	</#if>
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	通过实体查询
	 * </pre>
	 * 
	 * @param ${className?uncap_first}Vo	实体
	 * @return
	 */
	public ${className}Vo find${className}(${className}Vo ${className?uncap_first}Vo);
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	新增或修改
	 * </pre>
	 * 
	 * @param ${className?uncap_first}Vo	实体
	 */
	public Integer save${className}(${className}Vo ${className?uncap_first}Vo);
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	新增
	 * </pre>
	 * 
	 * @param ${className?uncap_first}Vo	实体
	 */
	public Integer insert${className}(${className}Vo ${className?uncap_first}Vo);
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	修改
	 * </pre>
	 * 
	 * @param ${className?uncap_first}Vo	实体
	 */
	public Integer update${className}(${className}Vo ${className?uncap_first}Vo);
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	修改（批量）
	 * </pre>
	 * 
	 * @param ${className?uncap_first}VoList	实体集合
	 */
	public void update${className}Batch(List<${className}Vo> ${className?uncap_first}VoList);
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	插入（批量）
	 * </pre>
	 * 
	 * @param ${className?uncap_first}VoList	实体集合
	 */
	public void insert${className}Batch(List<${className}Vo> ${className?uncap_first}VoList);
	
	<#if pkField??>
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	删除
	 * </pre>
	 * 
	 * @param ${pkField}	主键ID
	 */
	public Integer delete${className}(${pkType} ${pkField});
	</#if>
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	根据 entity 条件，删除
	 * </pre>
	 * 
	 * @param ${className?uncap_first}Vo	实体
	 */
	public Integer delete${className}(${className}Vo ${className?uncap_first}Vo);
	
	<#if pkField??>
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	删除（根据ID 批量删除）
	 * </pre>
	 * 
	 * @param ${pkField}List	主键ID集合
	 */
	public Integer delete${className}Batch(List<${pkType}> ${pkField}List);
	</#if>
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	根据 entity 条件，查询总记录数
	 * </pre>
	 * 
	 * @param ${className?uncap_first}Vo	实体
	 */
	public Integer count${className}(${className}Vo ${className?uncap_first}Vo);
}
