package com.idp.web.generator.entity;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class BuildCodeConfig implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long did;
	private String projectPath;
	private String sourceBasePackage;
	private String webBasePackage;
	private String entityPackage;
	private String packageStyle;
	private String description;
	private String pageModel;
	private String author;
	
	private String[] flags;
	private boolean pageFlag = false;
	private boolean entityFlag = false;
	private boolean daoFlag = false;
	private boolean serviceFlag = false;
	private boolean remoteFlag = false;
	private boolean controllerFlag = false;
	
	private Long tableId;
	private CgTableConfig tableConfig;
	private List<Map<String, String>> tableList;
	
	//数据库类型
	private String databaseType;
	
	

	public Long getDid() {
		return did;
	}
	public void setDid(Long did) {
		this.did = did;
	}
	public String getProjectPath() {
		return projectPath;
	}
	public void setProjectPath(String projectPath) {
		this.projectPath = projectPath;
	}
	public String getSourceBasePackage() {
		return sourceBasePackage;
	}
	public void setSourceBasePackage(String sourceBasePackage) {
		this.sourceBasePackage = sourceBasePackage;
	}
	public String getWebBasePackage() {
		return webBasePackage;
	}
	public void setWebBasePackage(String webBasePackage) {
		this.webBasePackage = webBasePackage;
	}
	public String getEntityPackage() {
		return entityPackage;
	}
	public void setEntityPackage(String entityPackage) {
		this.entityPackage = entityPackage;
	}
	public String getPackageStyle() {
		return packageStyle;
	}
	public void setPackageStyle(String packageStyle) {
		this.packageStyle = packageStyle;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPageModel() {
		return pageModel;
	}
	public void setPageModel(String pageModel) {
		this.pageModel = pageModel;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Long getTableId() {
		return tableId;
	}
	public void setTableId(Long tableId) {
		this.tableId = tableId;
	}
	public CgTableConfig getTableConfig() {
		return tableConfig;
	}
	public void setTableConfig(CgTableConfig tableConfig) {
		this.tableConfig = tableConfig;
	}
	public String[] getFlags() {
		return flags;
	}
	public void setFlags(String[] flags) {
		this.flags = flags;
		List<String> list = Arrays.asList(flags);
		if(list.contains("page")){
			this.pageFlag = true;
		}
		if(list.contains("entity")){
			this.entityFlag = true;
		}
		if(list.contains("dao")){
			this.daoFlag = true;
		}
		if(list.contains("service")){
			this.serviceFlag = true;
		}
		if(list.contains("remote")){
			this.remoteFlag = true;
		}
		if(list.contains("controller")){
			this.controllerFlag = true;
		}
	}
	public boolean isPageFlag() {
		return pageFlag;
	}
	public void setPageFlag(boolean pageFlag) {
		this.pageFlag = pageFlag;
	}
	public boolean isEntityFlag() {
		return entityFlag;
	}
	public void setEntityFlag(boolean entityFlag) {
		this.entityFlag = entityFlag;
	}
	public boolean isDaoFlag() {
		return daoFlag;
	}
	public void setDaoFlag(boolean daoFlag) {
		this.daoFlag = daoFlag;
	}
	public boolean isServiceFlag() {
		return serviceFlag;
	}
	public void setServiceFlag(boolean serviceFlag) {
		this.serviceFlag = serviceFlag;
	}
	public boolean isRemoteFlag() {
		return remoteFlag;
	}
	public void setRemoteFlag(boolean remoteFlag) {
		this.remoteFlag = remoteFlag;
	}
	public boolean isControllerFlag() {
		return controllerFlag;
	}
	public void setControllerFlag(boolean controllerFlag) {
		this.controllerFlag = controllerFlag;
	}
	public List<Map<String, String>> getTableList() {
		return tableList;
	}
	public void setTableList(List<Map<String, String>> tableList) {
		this.tableList = tableList;
	}
	public String getDatabaseType() {
		return databaseType;
	}
	public void setDatabaseType(String databaseType) {
		this.databaseType = databaseType;
	}


}
