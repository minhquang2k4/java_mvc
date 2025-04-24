package vn.minhquang.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

  @RequestMapping("/admin/product")
  public String getDashboard() {
    return "admin/product/show";
  }
}
