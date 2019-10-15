package com.idp.web.system.dao;

import java.util.List;

import com.idp.common.base.BaseDao;
import com.idp.web.system.entity.SysMenu;

public interface SysMenuDao extends BaseDao<SysMenu, Long> {
	
	public List<SysMenu> getByParentId(Long parentId);
	
	public void deleteByParentId(Long parentId);
	
	public List<SysMenu> findForTreeTable(Long parentId);
	
}
