package vn.minhquang.laptopshop.controller.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.minhquang.laptopshop.domain.User;
import vn.minhquang.laptopshop.service.UserService;

import java.util.List;
import java.util.Optional;

@Controller
public class UserController {

  private final UserService userService;

  public UserController(
      UserService userService) {
    this.userService = userService;
  }

  @RequestMapping("/")
  public String getHomePage() {
    return "hello";
  }

  @RequestMapping("/admin/user")
  public String getUserPage(
      @RequestParam(name = "page", defaultValue = "0") int page,
      @RequestParam(name = "size", defaultValue = "10") int size,
      Model model) {
    
    Page<User> userPage = this.userService.handleGetAllUsersWithPagination(PageRequest.of(page, size));
    
    model.addAttribute("users", userPage.getContent());
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPages", userPage.getTotalPages());
    model.addAttribute("totalItems", userPage.getTotalElements());
    model.addAttribute("pageSize", size);
    
    return "admin/user/show";
  }

  @RequestMapping("/admin/user/create")
  public String getCreateUserPage(Model model) {
    return "admin/user/create";
  }

  @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
  public String createUserPage(User user) {
    System.out.println(user.toString());
    this.userService.handleSaveUser(user);
    return "redirect:/admin/user";
  }

  @RequestMapping("/admin/user/view/{id}")
  public String viewUser(@PathVariable("id") Long id, Model model) {
    Optional<User> userOptional = this.userService.handleGetUserById(id);
    if (userOptional.isPresent()) {
      model.addAttribute("user", userOptional.get());
      return "admin/user/detail";
    } else {
      return "redirect:/admin/user";
    }
  }

  @RequestMapping("/admin/user/edit/{id}")
  public String getEditUserPage(@PathVariable("id") Long id, Model model) {
    Optional<User> userOptional = this.userService.handleGetUserById(id);
    if (userOptional.isPresent()) {
      model.addAttribute("user", userOptional.get());
      return "admin/user/edit";
    } else {
      return "redirect:/admin/user";
    }
  }

  @RequestMapping(value = "/admin/user/edit/{id}", method = RequestMethod.POST)
  public String updateUser(@PathVariable("id") Long id, User user) {
    user.setId(id);
    this.userService.handleSaveUser(user);
    return "redirect:/admin/user";
  }

  @RequestMapping("/admin/user/delete/{id}")
  public String deleteUser(@PathVariable("id") Long id) {
    this.userService.handleDeleteUser(id);
    return "redirect:/admin/user";
  }
}
