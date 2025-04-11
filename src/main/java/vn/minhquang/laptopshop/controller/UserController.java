package vn.minhquang.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import vn.minhquang.laptopshop.service.UserService;


@Controller
public class UserController {

  final private UserService userService;
  
  
  public UserController(UserService userService) {
    this.userService = userService;
  }


  @GetMapping("/")
  public String getHomePage() {
    return this.userService.handleHello();
  }
}
