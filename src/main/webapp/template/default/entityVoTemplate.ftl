package ${sourceBasePackage}.vo;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

import ${sourceBasePackage}.entity.${className};

/**
 * <p>File：${className}Vo.java</p>
 * <p>Title: </p>
 * <p>Description:${description}</p>
 * <p>Copyright: Copyright (c) ${createDate}</p>
 * <p>Company: olymtech.com</p>
 * @author ${author}
 * @version 1.0
 */
@TableName(value="${tableName}")
public class ${className}Vo extends ${className} { 
	
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
}
