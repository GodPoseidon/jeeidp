package com.idp.web.generator.dao;

import com.idp.common.base.BaseDao;
import com.idp.web.generator.entity.CgTableConfig;

public interface CgTableConfigDao extends BaseDao<CgTableConfig, Long> {

	public CgTableConfig getByDid(Long did);
	
	public CgTableConfig findName(CgTableConfig tableConfig);
}
