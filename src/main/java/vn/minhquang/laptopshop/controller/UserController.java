package vn.minhquang.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.minhquang.laptopshop.domain.User;
import vn.minhquang.laptopshop.service.UserService;


@Controller
public class UserController {

  final private UserService userService;
  
  
  public UserController(UserService userService) {
    this.userService = userService;
  }


  @RequestMapping("/")
  public String getHomePage() {
    return this.userService.handleHello();
  }

  @RequestMapping("/admin/user")
  public String getUserPage(Model model) {
    return "admin/user/create"; 
  }

  @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
  public String createUserPage(@ModelAttribute User user) {
    System.out.println(user.toString());
    return "hello"; 
  }
}
