package ${sourceBasePackage}.rest.controller.${entityPackage};

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.deram.common.bean.BaseController;

/**
 * <p>File：homeController.java</p>
 * <p>Title: </p>
 * <p>Description:${description}</p>
 * <p>Copyright: Copyright (c) ${createDate}</p>
 * <p>Company: olymtech.com</p>
 * @author ${author}
 * @version 1.0
 */
@Controller
@RequestMapping("/${entityPackage}")
public class HomeController extends BaseController{ 

	@RequestMapping
	public String init(){
		return "${entityPackage}/index";  
	}
}