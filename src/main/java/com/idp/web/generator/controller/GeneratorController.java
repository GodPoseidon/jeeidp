package com.idp.web.generator.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.idp.common.base.BaseController;
import com.idp.web.generator.entity.BuildCodeConfig;
import com.idp.web.generator.entity.CgDataSource;
import com.idp.web.generator.entity.CgTableConfig;
import com.idp.web.generator.service.CgDataSourceService;
import com.idp.web.generator.service.CgTableConfigService;
import com.idp.web.generator.util.CodeGenerateUtils;
import com.idp.web.generator.util.FieldUtils;
import com.idp.web.generator.util.ReadTableUtils;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/generator")
public class GeneratorController extends BaseController {

	private static Logger logger = Logger.getLogger(GeneratorController.class);
	
	@Resource
	private CgDataSourceService cgDataSourceService;
	@Resource
	private CgTableConfigService cgTableConfigService;
	
	@RequestMapping("/buildConfig")
	@ResponseBody
	public String buildConfig(Long dataSourceId,String tableName){
		JSONObject json = new JSONObject();
		
		try {
			CgTableConfig cgTableConfig = cgTableConfigService.findName(dataSourceId, tableName);
			if(null == cgTableConfig){
				cgTableConfigService.add(dataSourceId, tableName, getCurrentUser().getId());
			}
			json.put("result", "build_config_success");
		} catch (Exception e) {
			json.put("result", "error");
			logger.error(e.getMessage(), e);
		}
		
		return json.toString();
	}
	
	@RequestMapping("/goBuild")
	public String goBuild(Long id,Long did,HttpServletRequest request){
		
		try {
			String[] flagAry = {"page", "entity", "dao", "service", "remote", "controller"};
			CgTableConfig tableConfig = null;
			if(null != id){
				tableConfig = cgTableConfigService.getById(id);
			}else{
				tableConfig = cgTableConfigService.getByDid(did);
			}
			String flagStr = "";
			if(null != tableConfig){
				flagStr = tableConfig.getFlags();
			}
			if(StringUtils.isBlank(flagStr)) flagStr = "";
			List<Map<String, Boolean>> flagList = new ArrayList<Map<String, Boolean>>();
			for(String flag:flagAry){
				Map<String, Boolean> map = new HashMap<String, Boolean>();
				if(flagStr.indexOf(flag) != -1){
					map.put(flag, true);
				}else{
					map.put(flag, false);
				}
				flagList.add(map);
			}
			request.setAttribute("tableConfig", tableConfig);
			request.setAttribute("flagList", flagList);
			request.setAttribute("did", did);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
		return "generator/table/buildCode";
	}
	
	
	@RequestMapping("/buildCode")
	@ResponseBody
	public String buildCode(BuildCodeConfig buildCodeConfig){
		JSONObject json = new JSONObject();
		
		try {
			
			CgTableConfig tableConfig = cgTableConfigService.getById(buildCodeConfig.getTableId());
			if(null == tableConfig){
				tableConfig = new CgTableConfig();
			}
			
			tableConfig.setProjectPath(buildCodeConfig.getProjectPath());
			tableConfig.setPackageStyle(buildCodeConfig.getPackageStyle());
			tableConfig.setDescription(buildCodeConfig.getDescription());
			tableConfig.setSourceBasePackage(buildCodeConfig.getSourceBasePackage());
			tableConfig.setEntityPackage(buildCodeConfig.getEntityPackage());
			tableConfig.setWebBasePackage(buildCodeConfig.getWebBasePackage());
			tableConfig.setFlags(StringUtils.join(buildCodeConfig.getFlags(), ","));
			tableConfig.setPageModel(buildCodeConfig.getPageModel());
			tableConfig.setAuthor(buildCodeConfig.getAuthor());
			if(null != buildCodeConfig.getTableId()){
				cgTableConfigService.update(tableConfig);
			}else{
				tableConfig.setDataId(buildCodeConfig.getDid());
				tableConfig.setCreateUser(getCurrentUser().getId());
				tableConfig.setCreateDate(new Date());
			}
			buildCodeConfig.setTableConfig(tableConfig);
			
			// 生成代码
			if(null != buildCodeConfig.getDid()){
				CgDataSource dataSource = cgDataSourceService.getById(buildCodeConfig.getDid());
				buildCodeConfig.setDatabaseType(dataSource.getDatabaseType());
				List<Map<String, String>> tableList = new ReadTableUtils().readAllTableNames(dataSource);
				if(!CollectionUtils.isEmpty(tableList)){
					CodeGenerateUtils generate = new CodeGenerateUtils(buildCodeConfig);
					generate.generateFile(tableList);
					for(Map<String, String> item:tableList){
						String tableName = item.get("tableName");
						tableConfig.setClassName(FieldUtils.formatFieldCapital(tableName));
						tableConfig.setTableName(tableName);
						tableConfig.setTableComment(item.get("tableComment"));
						tableConfig.setDescription(tableConfig.getTableComment());
						cgDataSourceService.batchAdd(tableConfig);
						generate = new CodeGenerateUtils(buildCodeConfig);
						generate.generateFile();
					}
				}
			}else{
				CgDataSource dataSource = cgDataSourceService.getById(tableConfig.getDataId());
				buildCodeConfig.setDatabaseType(dataSource.getDatabaseType());
				CodeGenerateUtils generate = new CodeGenerateUtils(buildCodeConfig);
				generate.generateFile();
			}
			
			json.put("result", "build_code_success");
		} catch (Exception e) {
			json.put("result", "error");
			logger.error(e.getMessage(), e);
		}
		
		return json.toString();
	}
}
