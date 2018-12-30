package com.play.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.play.dto.UserRegisterDTO;
import com.play.service.AdminService;

/**
 * 
 * @author Insignia
 * 
 */
@Controller
public class AdminController {

  static final Logger logger = Logger.getLogger(AdminController.class);
  
  @Autowired
  private AdminService service;

  @RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView showAdminPage(HttpServletRequest request, HttpServletResponse response) {
		logger.debug("Redirecting to admin page");
		ModelAndView model = new ModelAndView("administration");
		UserRegisterDTO userDTO = new UserRegisterDTO();
		model.addObject("user", userDTO);
		int sum;
		try {
			sum = Integer.parseInt("s");
			LoginController controller = new LoginController();
		} catch (Exception e) {
			sum = 0;
		}
		System.out.println(sum);
		return model;
	}
  
  @RequestMapping(value = "/createUser", method = RequestMethod.POST)
  public ModelAndView createUser(@ModelAttribute("user") UserRegisterDTO newUserDTO) {
    
    service.create(newUserDTO);
    
    ModelAndView model = new ModelAndView("administration");
    UserRegisterDTO userDTO = new UserRegisterDTO();
    model.addObject("user", userDTO);
    return model;
  }

}
