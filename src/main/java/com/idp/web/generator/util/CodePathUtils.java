package com.idp.web.generator.util;

import java.io.IOException;
import java.util.Locale;

import org.apache.commons.lang.StringUtils;

import com.idp.common.util.ContextHolderUtil;
import com.idp.web.generator.entity.BuildCodeConfig;

import freemarker.template.Configuration;

public class CodePathUtils {

	private static final String SOURCE_ROOT_PACKAGE = "java";
	private static final String RESOURCE_ROOT_PACKAGE = "resources";
	private static final String WEB_ROOT_PACKAGE = "webapp";

	public String getSourceRootPath(String sourceBasePackage){
		
		return (SOURCE_ROOT_PACKAGE + "/" +sourceBasePackage).replace(".", "/");
	}
	
	public String getResourceRootPath(){
		
		return (RESOURCE_ROOT_PACKAGE + "/").replace(".", "/");
	}
	
	public String getWebRootPath(String webBasePackage){
		
		return (WEB_ROOT_PACKAGE + "/" + webBasePackage).replace(".", "/");
	}
	
	protected Configuration getConfiguration(String templateFolder) throws IOException {
	    Configuration cfg = new Configuration();
	    //cfg.setClassForTemplateLoading(this.getClass(), ResourceUtil.getConfigByName("template_path"));
	    //cfg.setDirectoryForTemplateLoading(new File(""));
	    cfg.setServletContextForTemplateLoading(ContextHolderUtil.getRequest().getServletContext(), "template/"+templateFolder);
	    cfg.setLocale(Locale.CHINA);
	    cfg.setDefaultEncoding("UTF-8");
	    return cfg;
	}

	protected String getCodePathServiceStyle(BuildCodeConfig config,String type){
	    StringBuilder str = new StringBuilder();
	    if (StringUtils.isNotBlank(type)) {
	    	
	    	String codeType = ((CodeType)Enum.valueOf(CodeType.class, type)).getValue();
	    	
	    	str.append(config.getProjectPath());
	    	str.append("/");
	      
	    	if (type.contains("jsp") || type.contains("html") || type.contains("js") || type.contains("css")){
	    		
	    		str.append(getWebRootPath(config.getWebBasePackage()));
	    		str.append("/");
	    		str.append(config.getEntityPackage());
	    		str.append("/");
	    		str.append(StringUtils.lowerCase(config.getTableConfig().getClassName()));
	    		str.append("/");
	  
	    	}else if(type.contains("sqlxml")){
	    		str.append(getResourceRootPath());
	    		str.append("/config/mappers/").append(config.getDatabaseType()).append("/");
	    	}
	    	else{
	    		
	    		str.append(getSourceRootPath(config.getSourceBasePackage()));
	  
	    		str.append("/");
	    		/*str.append(StringUtils.lowerCase(config.getEntityPackage()));
	    		str.append("/");*/
  
	    		
	    		if ("serviceImpl".equalsIgnoreCase(type)){
	    			str.append(StringUtils.lowerCase("service/impl"));
	    		}
	    		else if("remote".equalsIgnoreCase(type)){
	    			str.append(StringUtils.lowerCase("remote")); 
	    		}
	    		else if("remoteImpl".equalsIgnoreCase(type)){
	    			str.append(StringUtils.lowerCase("remote/impl"));
	    		}
	    		else if("entity".equalsIgnoreCase(type)){
	    			str.append(StringUtils.lowerCase("entity"));
	    		}
	    		else if("vo".equalsIgnoreCase(type)){
	    			str.append(StringUtils.lowerCase("vo")); 
	    		}
	    		else if("controller".equalsIgnoreCase(type)){
	    			str.append(StringUtils.lowerCase("rest/controller/")).append(StringUtils.lowerCase(config.getEntityPackage()));
	    		}
	    		else{
	    			str.append(StringUtils.lowerCase(codeType));
	    		}
  
	    		str.append("/");
	    	}

	    	if (type.contains("html")) {
	    		str.append(FieldUtils.getInitialSmall(config.getTableConfig().getClassName()));
		    	str.append(codeType);
	    		str.append(".html");
	    	} 
	    	else if (type.contains("jsp")) {
	    		//str.append(FieldUtils.getInitialSmall(config.getTableConfig().getClassName()));
		    	str.append(codeType);
	    		str.append(".jsp");
	    	} 
	    	else if (type.contains("js")) {
	    		str.append(FieldUtils.getInitialSmall(config.getTableConfig().getClassName()));
		    	str.append(codeType);
	    		str.append(".js");
	    	} 
	    	else if (type.contains("xml")) {
	    		str.append(config.getTableConfig().getClassName()); 
	    		str.append("Mapper.xml");
	    	} 
	    	else {
	    		if("service".equalsIgnoreCase(codeType) || "remote".equalsIgnoreCase(codeType)){
	    			str.append("I");
	    		}
	    		str.append(config.getTableConfig().getClassName());
		    	str.append(codeType);
	    		str.append(".java");
	    	}
	    } 
	    else {
	    	
	      throw new IllegalArgumentException("type is null");
	    }
	    
	    return str.toString();
	}

	protected String getCodePathProjectStyle(BuildCodeConfig config,String type){
	    StringBuilder str = new StringBuilder();
	    if (StringUtils.isNotBlank(type)) {
	    	
	    	String codeType = ((CodeType)Enum.valueOf(CodeType.class, type)).getValue();
	    	
	    	str.append(config.getProjectPath());
	    	str.append("/");
		      
	    	if (type.contains("jsp") || type.contains("html") || type.contains("js") || type.contains("css")){
	    		
	    		str.append(getWebRootPath(config.getWebBasePackage()));
  
	    		str.append("/");
	    		str.append(StringUtils.lowerCase(config.getEntityPackage()));
	    		str.append("/");
	  
	    	}
	    	else{
	    		
	    		str.append(getSourceRootPath(config.getSourceBasePackage()));
	  
	    		str.append("/");
  
	    		if ("serviceImpl".equalsIgnoreCase(type)){
	    			str.append(StringUtils.lowerCase("service/impl"));
	    		}
	    		else if("entity".equalsIgnoreCase(type)){
	    			str.append(StringUtils.lowerCase("entity"));
	    		}
	    		else if("vo".equalsIgnoreCase(type)){
	    			str.append(StringUtils.lowerCase("vo"));
	    		}
	    		else if("sqlxml".equals(type)){
	    			str.append(StringUtils.lowerCase("sql"));
	    		}
	    		else{
	    			str.append(StringUtils.lowerCase(codeType)); 
	    		}
  
	    		str.append("/");
	    		str.append(StringUtils.lowerCase(config.getEntityPackage()));
	    		str.append("/");
	    	}

	    	if (type.contains("html")) {
	    		str.append(FieldUtils.getInitialSmall(config.getTableConfig().getClassName()));
		    	str.append(codeType);
	    		str.append(".html");
	    	} 
	    	else if (type.contains("jsp")) {
	    		str.append(FieldUtils.getInitialSmall(config.getTableConfig().getClassName()));
		    	str.append(codeType);
	    		str.append(".jsp");
	    	} 
	    	else if (type.contains("js")) {
	    		str.append(FieldUtils.getInitialSmall(config.getTableConfig().getClassName()));
		    	str.append(codeType);
	    		str.append(".js");
	    	} 
	    	else if (type.contains("xml")) {
	    		str.append(FieldUtils.getInitialSmall(config.getTableConfig().getClassName()));
		    	str.append(codeType);
	    		str.append(".xml");
	    	} 
	    	else {
	    		if("service".equalsIgnoreCase(codeType) || "remote".equalsIgnoreCase(codeType)){
	    			str.append("I");
	    		}
	    		str.append(config.getTableConfig().getClassName());
		    	str.append(codeType);
	    		str.append(".java");
	    	}
	    } 
	    else {
	    	
	      throw new IllegalArgumentException("type is null");
	    }
	    
	    return str.toString();
	}

	public static enum CodeType{
		  
		controller("Controller"),
		remote("Remote"), 
		remoteImpl("RemoteImpl"), 
		service("Service"), 
		serviceImpl("ServiceImpl"), 
		dao("Mapper"),
		entity(""),
		vo("Vo"),
		xml(""),
		sqlxml("-sql"), 
 
		jsp("info"), 
		jsp_add("-add"), 
		jsp_update("-update"), 
		jspList("list"),
		jspSearch("search"),
		jspIndex("index"),
  
		js(""),
		css(""),
  
		html(""),
		htmlList("List");

	    private String type;

	    private CodeType(String type){
	    	this.type = type;
	    }

	    public String getValue() {
	    	return this.type;
	    }
	}
}
