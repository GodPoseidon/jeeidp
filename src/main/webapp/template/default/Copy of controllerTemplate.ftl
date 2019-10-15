package ${sourceBasePackage}.rest.controller.${entityPackage};

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.deram.common.bean.BaseController;
import com.deram.common.bean.JsonMessage;
import com.deram.common.bean.Pagination;
import com.deram.common.consts.ApplicationConst;
import ${sourceBasePackage}.dsapi.entity.${className};
import ${sourceBasePackage}.dsapi.remote.${className}Remote;
import com.deram.common.bean.Pagination;
import com.github.pagehelper.PageInfo;

/**
 * <p>File: ${className}Controller.java</p>
 * <p>Title: </p>
 * <p>Description:${description}</p>
 * <p>Copyright: Copyright (c) ${createDate}</p>
 * <p>Company: jmwenhua.cn</p>
 * @author ${author}
 * @version 1.0
 */
@Controller
@RequestMapping("/${entityPackage}/${className?uncap_first}")
public class ${className}Controller extends BaseController {

	@Resource
	private ${className}Remote ${className?uncap_first}Remote;
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	初始化查询页面
	 * </pre>
	 * 
	 * @return
	 */
	@RequestMapping(value = "/search")
	public String search(){
		return "${entityPackage}/${className?lower_case}/search";
	}
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	分页查询
	 * </pre>
	 * 
	 * @param ${className?uncap_first}
	 * @param page		页码实体
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, ${className} ${className?uncap_first}, Pagination pagination, Model model){
		PageInfo<${className}> pageInfo = ${className?uncap_first}Remote.find${className}Page(${className?uncap_first}, pagination);
		model.addAttribute("pageInfo", pageInfo);
		return "${entityPackage}/${className?lower_case}/list";
	}

	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	新增修改页面初始化
	 * </pre>
	 * 
	 * @param ${pkField}	主健ID
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/info")
	public String ${className?uncap_first}(${pkType} ${pkField},HttpServletRequest request, Model model){
		${className} ${className?uncap_first} = ${className?uncap_first}Remote.find${className}(${pkField});
		model.addAttribute("${className?uncap_first}", ${className?uncap_first});
		return "${entityPackage}/${className?lower_case}/info";
	}
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	保存或修改
	 * </pre>
	 * 
	 * @param ${className?uncap_first}
	 * @return
	 */
	@RequestMapping(value = "/save.ajax")
	@ResponseBody
	public JsonMessage save(${className} ${className?uncap_first}){
		${className?uncap_first}Remote.save${className}(${className?uncap_first}, ${className?uncap_first}.get${pkField?cap_first}());
		return super.getJsonMessage(ApplicationConst.ERROR_CODE_SUCCESS);
	}
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	删除
	 * </pre>
	 * 
	 * @param ${pkField}
	 * @return
	 */
	@RequestMapping(value = "/delete.ajax")
	@ResponseBody
	public JsonMessage delete(${pkType} ${pkField}){
		${className?uncap_first}Remote.delete${className}(${pkField});
		return super.getJsonMessage(ApplicationConst.ERROR_CODE_SUCCESS);
	}
}
