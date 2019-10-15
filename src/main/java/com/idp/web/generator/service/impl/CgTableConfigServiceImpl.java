package com.idp.web.generator.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.idp.common.persistence.Page;
import com.idp.web.generator.dao.CgColumnConfigDao;
import com.idp.web.generator.dao.CgTableConfigDao;
import com.idp.web.generator.entity.CgColumnConfig;
import com.idp.web.generator.entity.CgDataSource;
import com.idp.web.generator.entity.CgTableConfig;
import com.idp.web.generator.service.CgDataSourceService;
import com.idp.web.generator.service.CgTableConfigService;
import com.idp.web.generator.util.FieldUtils;
import com.idp.web.generator.util.ReadTableUtils;

@Service("CgTableConfigService")
public class CgTableConfigServiceImpl implements CgTableConfigService {

	@Resource
	private CgTableConfigDao cgTableConfigDao;
	@Resource
	private CgColumnConfigDao cgColumnConfigDao;
	
	@Resource
	private CgDataSourceService cgDataSourceService;

	@Override
	public Page<CgTableConfig> findByPage(CgTableConfig tableConfig,Page<CgTableConfig> page){
		
		page.setResult(cgTableConfigDao.find(tableConfig,page));
		
		return page;
	}
	
	@Override
	public CgTableConfig getById(Long id) {
		
		return cgTableConfigDao.getById(id);
	}
	
	/* (non-Javadoc)
	 * @see com.idp.web.generator.service.CgTableConfigService#getByDid(java.lang.Long)
	 */
	@Override
	public CgTableConfig getByDid(Long did) {
		return cgTableConfigDao.getByDid(did);
	}
	
	@Override
	public CgTableConfig add(Long dataSourceId,String tableName,Long userId) throws Exception { 
		
		CgTableConfig table = new CgTableConfig();
		table.setDataId(dataSourceId);
		table.setTableName(tableName);
		table.setClassName(FieldUtils.formatFieldCapital(tableName));
		table.setIsCheckbox("N");
		table.setIsPage("Y");
		table.setIsTree("N");
		table.setCreateUser(userId);
		table.setCreateDate(new Date());
		
		String tableComment = "";
		CgDataSource dataSource = cgDataSourceService.getById(dataSourceId);
		List<Map<String, String>> tableList = new ReadTableUtils().readAllTableNames(dataSource);
		if(!CollectionUtils.isEmpty(tableList)){
			for(Map<String, String> item:tableList){
				if(item.get("tableName").equals(tableName)){
					tableComment = item.get("tableComment");
					break;
				}
			}
		}
		table.setTableComment(tableComment);
		List<CgColumnConfig> columns =  new ReadTableUtils().readTableColumn(dataSource, tableName);
		table.setColumns(columns);
		
		cgTableConfigDao.add(table);
		
		for(CgColumnConfig column : table.getColumns()){
			
			column.setTableId(table.getId());
			column.setCreateUser(table.getCreateUser());
			column.setCreateDate(table.getCreateDate());
		}
		
		cgColumnConfigDao.batchAdd(table.getColumns());
		return table;
	}

	@Override
	public void update(CgTableConfig tableConfig) throws Exception {
		
		/*CgTableConfig oldTableConfig = cgTableConfigDao.getById(tableConfig.getId());
		tableConfig.setUpdateUser(oldTableConfig.getUpdateUser());
		tableConfig.setUpdateDate(oldTableConfig.getUpdateDate());
		tableConfig.setClassName(oldTableConfig.getClassName());
		tableConfig.setIsCheckbox(oldTableConfig.getIsCheckbox());
		tableConfig.setIsPage(oldTableConfig.getIsPage());
		tableConfig.setDescription(oldTableConfig.getDescription());*/
		cgTableConfigDao.updateNotNull(tableConfig);
		
		for(CgColumnConfig column : tableConfig.getColumns()){
			
			column.setUpdateUser(tableConfig.getUpdateUser());
			column.setUpdateDate(tableConfig.getUpdateDate());
			
			cgColumnConfigDao.update(column);
		}
	}

	@Override
	public void delete(Long id) throws Exception {
		
		cgTableConfigDao.delete(id);
		
		cgColumnConfigDao.delete(id);
	}

	/* (non-Javadoc)
	 * @see com.idp.web.generator.service.CgTableConfigService#delete(java.lang.Long, java.lang.String)
	 */
	@Override
	public CgTableConfig findName(Long dataId, String tableName) throws Exception {
		CgTableConfig tableConfig = new CgTableConfig();
		tableConfig.setDataId(dataId);
		tableConfig.setTableName(tableName);
		return cgTableConfigDao.findName(tableConfig);
	}

	/* (non-Javadoc)
	 * @see com.idp.web.generator.service.CgTableConfigService#find(java.lang.Long, java.lang.String, java.lang.String)
	 */
	@Override
	public List<CgTableConfig> find(Long dataId, String tableName, String description) {
		CgTableConfig tableConfig = new CgTableConfig();
		tableConfig.setDataId(dataId);
		tableConfig.setTableName(tableName);
		tableConfig.setDescription(description);
		return cgTableConfigDao.find(tableConfig);
	}

	

}
