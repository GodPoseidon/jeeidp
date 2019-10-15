package com.idp.web.generator.service;

import java.util.List;

import com.idp.common.persistence.Page;
import com.idp.web.generator.entity.CgTableConfig;

public interface CgTableConfigService {

	public Page<CgTableConfig> findByPage(CgTableConfig tableConfig,Page<CgTableConfig> page);
	
	public CgTableConfig getById(Long id);
	
	public CgTableConfig getByDid(Long did);
	
	public CgTableConfig add(Long dataSourceId,String tableName,Long userId) throws Exception;
	
	public void update(CgTableConfig tableConfig) throws Exception;
	
	public void delete(Long id) throws Exception;
	
	public CgTableConfig findName(Long dataId, String tableName)throws Exception;
	
	public List<CgTableConfig> find(Long dataId, String tableName, String description);
}
