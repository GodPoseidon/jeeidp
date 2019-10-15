package com.idp.web.system.dao;

import java.util.List;

import com.idp.common.base.BaseDao;
import com.idp.web.system.entity.SysOrg;

public interface SysOrgDao extends BaseDao<SysOrg, Long> {

	public List<SysOrg> findForTreeTable(Long parentId);
	
	public void deleteByParentId(Long parentId);
	
	public String getMaxCode(Long parentId);
}
