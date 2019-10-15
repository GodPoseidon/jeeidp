<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<#if packageStyle == "service">
<mapper namespace="${sourceBasePackage}.mapper.${className}Mapper">
<#else>
<mapper namespace="${sourceBasePackage}.dao.${className}Dao">
</#if>
  
  <sql id="Base_Column_List">
		<trim suffixOverrides=",">
		<#list columns as po>${po.columnName},</#list>
	 	</trim>
   </sql>
   
</mapper>