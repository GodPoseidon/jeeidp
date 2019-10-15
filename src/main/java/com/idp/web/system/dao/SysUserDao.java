package com.idp.web.system.dao;

import com.idp.common.base.BaseDao;
import com.idp.web.system.entity.SysUser;
import org.apache.ibatis.annotations.Param;

public interface SysUserDao extends BaseDao<SysUser, Long> {

	public SysUser findByUsername(@Param("username") String username);
}
