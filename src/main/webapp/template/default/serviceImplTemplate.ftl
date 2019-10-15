package ${sourceBasePackage}.service.impl;

import org.springframework.stereotype.Service;

import ${voPackage}.vo.${className}Vo;
import ${sourceBasePackage}.service.I${className}Service;

import com.olymtech.extend.common.automation.service.BaseServiceImpl;


/**
 * <p>File: ${className}ServiceImpl.java</p>
 * <p>Title: </p>
 * <p>Description:${description}</p>
 * <p>Copyright: Copyright (c) ${createDate}</p>
 * <p>Company: olymtech.com</p>
 * @author ${author}
 * @version 1.0
 */
@Service("${className?uncap_first}Service")
public class ${className}ServiceImpl extends BaseServiceImpl<${className}Vo> implements I${className}Service {

}