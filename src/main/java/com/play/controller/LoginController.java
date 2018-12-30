package com.play.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.play.dto.UserRegisterDTO;
import com.play.entity.UserRegister;
import com.play.repo.UserRegisterRepo;

/**
 * 
 * @author Insignia
 * 
 */
@Controller
@SessionAttributes("userObj")
@SuppressWarnings("unchecked")
public class LoginController {

  static final Logger logger = Logger.getLogger(LoginController.class);

  @Autowired
  private UserRegisterRepo userRepo;

  @RequestMapping(value = "/loginpage", method = RequestMethod.GET)
  public ModelAndView userLoginPage(HttpServletRequest request, HttpServletResponse response) {
    logger.debug("Redirecting to userlogin page");
    ModelAndView model = new ModelAndView("homepage");
    UserRegisterDTO userDTO = new UserRegisterDTO();
    model.addObject("user", userDTO);
    return model;
  }

  @RequestMapping(value = "/userlogin", method = RequestMethod.POST)
  public ModelAndView userlogin(@ModelAttribute("user") UserRegisterDTO userDto) {
    logger.debug("userlogin request recieved");
    ModelAndView model = null;
    List<UserRegister> userRegister = (List<UserRegister>) userRepo
        .findByColumnName(UserRegister.class, "userid", userDto.getUserid());
    if (!userRegister.isEmpty()
        && userRegister.get(0).getPassword().equals(userDto.getPassword())) {
      logger.debug("User Login Successful");

      model = new ModelAndView("homepage");
      model.addObject("userObj", userRegister.get(0).getUserid());
    } else {
      model = new ModelAndView("userlogin");
      model.addObject("user", new UserRegisterDTO());
      model.addObject("errmsg", "Invalid credentials!");
    }
    return model;
  }

  @RequestMapping(value = "/homepage", method = RequestMethod.GET)
  public ModelAndView homepage(HttpServletRequest request, HttpServletResponse response) {
    ModelAndView model = new ModelAndView("homepage");
    return model;
  }

  @RequestMapping(value = "/userdetails", method = RequestMethod.GET)
  public ModelAndView userlogin(HttpServletRequest request, HttpServletResponse response) {
    ModelAndView model = new ModelAndView("userdetails");
    model.addObject("userdetails", getAllUsers());
    return model;
  }

  private List<UserRegisterDTO> getAllUsers() {
    List<UserRegister> result = (List<UserRegister>) userRepo.find(UserRegister.class);
    List<UserRegisterDTO> userDto = new ArrayList<>();
    for (UserRegister user : result) {
      UserRegisterDTO dto = new UserRegisterDTO();
      dto.setUserid(user.getUserid());
      dto.setFirstname(user.getFirstname());
      dto.setLastname(user.getLastname());
      dto.setEmail(user.getEmail());
      dto.setStatus(user.getStatus());
      dto.setTimestamp(user.getTimestamp());
      userDto.add(dto);
    }
    return userDto;
  }

  @RequestMapping(value = "/userLogout", method = RequestMethod.GET)
  public String userLogout(SessionStatus sessionStatus) {
    sessionStatus.setComplete();
    return "redirect:/loginpage";
  }
}
