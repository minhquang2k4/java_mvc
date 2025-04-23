package vn.minhquang.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashboardController {

  @RequestMapping("/admin")
  public String getDashboard() {
    return "admin/dashboard/show";
  }
}
