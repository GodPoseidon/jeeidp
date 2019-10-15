package com.idp.web.generator.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.idp.common.persistence.Page;
import com.idp.web.generator.dao.CgDataSourceDao;
import com.idp.web.generator.entity.CgDataSource;
import com.idp.web.generator.entity.CgTableConfig;
import com.idp.web.generator.service.CgDataSourceService;
import com.idp.web.generator.service.CgTableConfigService;

@Service("CgDataSourceService")
public class CgDataSourceServiceImpl implements CgDataSourceService {

	@Resource
	private CgDataSourceDao cgDataSourceDao;
	@Resource
	private CgTableConfigService cgTableConfigService;
	
	@Override
	public Page<CgDataSource> findByPage(CgDataSource dataSource, Page<CgDataSource> page) {
		
		page.setResult(cgDataSourceDao.find(dataSource,page));
		
		return page;
	}
	
	@Override
	public List<CgDataSource> findBySearch(CgDataSource dataSource){
		
		return cgDataSourceDao.find(dataSource);
	}

	@Override
	public CgDataSource getById(Long id) {
		
		return cgDataSourceDao.getById(id);
	}

	@Override
	public void add(CgDataSource dataSource) throws Exception {
		
		cgDataSourceDao.add(dataSource);
	}

	@Override
	public void update(CgDataSource dataSource) throws Exception {
		
		cgDataSourceDao.update(dataSource);
	}

	@Override
	public void delete(Long id) throws Exception {
		List<CgTableConfig> list = cgTableConfigService.find(id, null, null);
		if(!CollectionUtils.isEmpty(list)){
			for(CgTableConfig tableConfig:list){
				cgTableConfigService.delete(tableConfig.getId());
			}
		}
		cgDataSourceDao.delete(id);
	}

	/* (non-Javadoc)
	 * @see com.idp.web.generator.service.CgDataSourceService#batchAdd()
	 */
	@Override
	public void batchAdd(CgTableConfig tableConfig) throws Exception { 
		try{
			CgTableConfig oldTableConfig = cgTableConfigService.findName(tableConfig.getDataId(), tableConfig.getTableName());
			if(null != oldTableConfig){
				cgTableConfigService.delete(oldTableConfig.getId());
			}
			oldTableConfig = cgTableConfigService.add(tableConfig.getDataId(), tableConfig.getTableName(), tableConfig.getCreateUser());
			tableConfig.setId(oldTableConfig.getId());
			tableConfig.setColumns(oldTableConfig.getColumns());
			cgTableConfigService.update(tableConfig);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
