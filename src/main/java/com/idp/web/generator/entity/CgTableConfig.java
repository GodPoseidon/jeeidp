package com.idp.web.generator.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.idp.common.base.BaseEntity;

public class CgTableConfig extends BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private String tableName;
	private String tableComment;
	private String className;
	private String description;
	private String isCheckbox;
	private String isPage;
	private String isTree;
	
	private Long dataId;
	private String projectPath;
	private String packageStyle;
	private String sourceBasePackage;
	private String entityPackage;
	private String webBasePackage;
	private String flags;
	private String pageModel;
	private String author;
	
	//private Long dataSourceId;
	
	private List<CgColumnConfig> columns = new ArrayList<CgColumnConfig>();
	
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getTableComment() {
		return tableComment;
	}
	public void setTableComment(String tableComment) {
		this.tableComment = tableComment;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIsCheckbox() {
		return isCheckbox;
	}
	public void setIsCheckbox(String isCheckbox) {
		this.isCheckbox = isCheckbox;
	}
	public String getIsPage() {
		return isPage;
	}
	public void setIsPage(String isPage) {
		this.isPage = isPage;
	}
	public String getIsTree() {
		return isTree;
	}
	public void setIsTree(String isTree) {
		this.isTree = isTree;
	}
	public List<CgColumnConfig> getColumns() {
		return columns;
	}
	public void setColumns(List<CgColumnConfig> columns) {
		this.columns = columns;
	}
	public Long getDataId() {
		return dataId;
	}
	public void setDataId(Long dataId) {
		this.dataId = dataId;
	}
	public String getPackageStyle() {
		return packageStyle;
	}
	public void setPackageStyle(String packageStyle) {
		this.packageStyle = packageStyle;
	}
	public String getSourceBasePackage() {
		return sourceBasePackage;
	}
	public void setSourceBasePackage(String sourceBasePackage) {
		this.sourceBasePackage = sourceBasePackage;
	}
	public String getEntityPackage() {
		return entityPackage;
	}
	public void setEntityPackage(String entityPackage) {
		this.entityPackage = entityPackage;
	}
	public String getWebBasePackage() {
		return webBasePackage;
	}
	public void setWebBasePackage(String webBasePackage) {
		this.webBasePackage = webBasePackage;
	}
	public String getFlags() {
		return flags;
	}
	public void setFlags(String flags) {
		this.flags = flags;
	}
	public String getPageModel() {
		return pageModel;
	}
	public void setPageModel(String pageModel) {
		this.pageModel = pageModel;
	}
	public String getProjectPath() {
		return projectPath;
	}
	public void setProjectPath(String projectPath) {
		this.projectPath = projectPath;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	/*public Long getDataSourceId() {
		return dataSourceId;
	}
	public void setDataSourceId(Long dataSourceId) {
		this.dataSourceId = dataSourceId;
	}*/
	
}
