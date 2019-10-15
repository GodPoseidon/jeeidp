package com.idp.web.generator.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;

import com.idp.web.generator.entity.BuildCodeConfig;
import com.idp.web.generator.entity.CgColumnConfig;

import freemarker.template.Template;
import freemarker.template.TemplateException;

public class CodeGenerateUtils extends CodePathUtils {

	private BuildCodeConfig config;
	private Map<String,Object> data;
	
	public CodeGenerateUtils(BuildCodeConfig config) {
		
		this.config = config;
		this.data = initData(config);
	}

	public void generateFile() throws Exception {
		
		if("angularjs".equals(this.config.getPageModel())){
	    	
	    	if(this.config.isPageFlag()){
	    		invoke("angularjs_jspTemplate.ftl", "jsp");
	        	invoke("angularjs_jspListTemplate.ftl", "jspList");
	        }
	    	if(this.config.isEntityFlag()){
	    		invoke("angularjs_entityTemplate.ftl", "entity");
	    	}
	    	if(this.config.isDaoFlag()){
	    		invoke("angularjs_daoTemplate.ftl", "dao");
		        invoke("angularjs_sqlxmlTemplate.ftl", "sqlxml");
	    	}
	        if(this.config.isServiceFlag()){
	        	invoke("angularjs_serviceImplTemplate.ftl", "serviceImpl");
	        	invoke("angularjs_serviceImplTemplate.ftl", "serviceImpl");
	        }
	        if (this.config.isControllerFlag()) {
	        	invoke("angularjs_controllerTemplate.ftl", "controller");
	        }
	    }	
	    else{
	    	
	    	if(this.config.isPageFlag()){
	    		invoke("jspTemplate.ftl", "jsp");
	        	invoke("jspListTemplate.ftl", "jspList");
	        	invoke("jspSearchTemplate.ftl", "jspSearch");
	        }
	    	if(this.config.isEntityFlag()){
	    		invoke("entityTemplate.ftl", "entity");
	    		invoke("entityVoTemplate.ftl", "vo");
	    	}
	    	if(this.config.isDaoFlag()){
	    		invoke("daoTemplate.ftl", "dao");
		        invoke("sqlxmlTemplate.ftl", "sqlxml"); 
	    	}
	        if(this.config.isServiceFlag()){
	        	invoke("serviceTemplate.ftl", "service");
	        	invoke("serviceImplTemplate.ftl", "serviceImpl");
	        }
	        if(this.config.isRemoteFlag()){
	        	invoke("remoteTemplate.ftl", "remote");
	        	invoke("remoteImplTemplate.ftl", "remoteImpl");
	        }
	        if (this.config.isControllerFlag()) {
	        	invoke("controllerTemplate.ftl", "controller");
	        }
	    }
		
	}
	
	public void generateFile(List<Map<String, String>> tableList) throws Exception {
		this.createHomeClFile();
		this.createIndexJspFile(tableList);
	}
	
	
	private void createIndexJspFile(List<Map<String, String>> tableList) throws Exception{
		this.data.put("tableList", tableList);
		CodePathUtils pathUtil = new CodePathUtils();
		StringBuilder str = new StringBuilder();
		String codeType = ((CodeType)Enum.valueOf(CodeType.class, "jspIndex")).getValue();
		str.append(this.config.getProjectPath());
    	str.append("/");
    	str.append(pathUtil.getWebRootPath(this.config.getWebBasePackage()));
		str.append("/");
		str.append(config.getEntityPackage());
		str.append("/");
		str.append(codeType);
		str.append(".jsp");
		
		String filePath = str.toString();
		String fileDir = StringUtils.substringBeforeLast(filePath, "/");
		FileUtils.forceMkdir(new File(fileDir + "/"));
		
		/*Template template = getConfiguration("default").getTemplate("jspIndexTemplate.ftl");
		Writer out = new OutputStreamWriter(new FileOutputStream(filePath), "utf-8");
		template.process(this.data, out);
		out.close();*/
	}
	
	private void createHomeClFile() throws Exception{
		CodePathUtils pathUtil = new CodePathUtils();
		StringBuilder str = new StringBuilder();
		String codeType = ((CodeType)Enum.valueOf(CodeType.class, "controller")).getValue();
		str.append(this.config.getProjectPath());
    	str.append("/");
		str.append(pathUtil.getSourceRootPath(this.config.getSourceBasePackage()));
		str.append("/");
		str.append(StringUtils.lowerCase("rest/controller/"));
		str.append(StringUtils.lowerCase(config.getEntityPackage()));
		str.append("/");
		str.append("Home");
    	str.append(codeType);
		str.append(".java"); 
		
		String filePath = str.toString();
		String fileDir = StringUtils.substringBeforeLast(filePath, "/"); 
		FileUtils.forceMkdir(new File(fileDir + "/"));
		
		Template template = getConfiguration("default").getTemplate("controllerHomeTemplate.ftl");
		Writer out = new OutputStreamWriter(new FileOutputStream(filePath), "utf-8");
		template.process(this.data, out);
		out.close();
	}
	
	public void invoke(String templateFileName,String type) throws TemplateException, IOException {
		String filePath = null;
		if("project".equals(type)){
			filePath = getCodePathProjectStyle(this.config, type);
		}
		else{
			filePath = getCodePathServiceStyle(this.config, type);
		}
		if("remote".equals(type)){
			filePath = filePath.replaceAll("-ds", "-api");
		}
		String fileDir = StringUtils.substringBeforeLast(filePath, "/");
		FileUtils.forceMkdir(new File(fileDir + "/"));
		
		//Template template = getConfiguration(this.config.getPageModel()).getTemplate(templateFileName);
		Template template = getConfiguration("default").getTemplate(templateFileName);
		Writer out = new OutputStreamWriter(new FileOutputStream(filePath), "utf-8");
		template.process(data, out);
		out.close();
	}
	
	private Map<String, Object> initData(BuildCodeConfig buildCodeConfig){
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("sourceBasePackage", buildCodeConfig.getSourceBasePackage());
		String voPackage = buildCodeConfig.getSourceBasePackage().replaceAll(".oracle", "");
		voPackage = voPackage.replaceAll(".mysql", "");
		data.put("voPackage", voPackage);
		data.put("webBasePackage", buildCodeConfig.getWebBasePackage());
		data.put("entityPackage", buildCodeConfig.getEntityPackage());
		data.put("packageStyle", buildCodeConfig.getPackageStyle());
		
		data.put("tableName", buildCodeConfig.getTableConfig().getTableName());
		data.put("tableComment", buildCodeConfig.getTableConfig().getTableComment());
		String className = buildCodeConfig.getTableConfig().getClassName();
		data.put("className", className);
		//data.put("tableName", this.camel2Underline(className));
		data.put("description", buildCodeConfig.getDescription());
		
		data.put("tableConfig", buildCodeConfig.getTableConfig());
		data.put("columns", buildCodeConfig.getTableConfig().getColumns());
		
		data.put("createDate", FormatDate(new Date(), "yyyy-MM-dd HH:mm"));
		data.put("author", buildCodeConfig.getAuthor());
		
		data.put("databaseType", buildCodeConfig.getDatabaseType());
		
		for(CgColumnConfig column : buildCodeConfig.getTableConfig().getColumns()){
			if("Y".equals(column.getIsKey())){
				data.put("pkField", column.getFieldName());
				data.put("pkType", column.getFieldType());
				data.put("pkColumn", column.getColumnName());
				break;
			}
		}
		
		return data;
	}
	
	public String camel2Underline(String line){
        if(line==null||"".equals(line)){
            return "";
        }
        line=String.valueOf(line.charAt(0)).toUpperCase().concat(line.substring(1));
        StringBuffer sb=new StringBuffer();
        Pattern pattern=Pattern.compile("[A-Z]([a-z\\d]+)?");
        Matcher matcher=pattern.matcher(line);
        while(matcher.find()){
            String word=matcher.group();
            sb.append(word.toUpperCase());
            sb.append(matcher.end()==line.length()?"":"_");
        }
        return sb.toString();
    }

	private String FormatDate(Date date, String sf){
	    if (date == null){
	    	return "";
	    }
	    SimpleDateFormat dateformat = new SimpleDateFormat(sf);
	    return dateformat.format(date);
	}
}
