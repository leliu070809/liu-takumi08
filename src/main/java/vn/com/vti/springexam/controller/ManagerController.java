package vn.com.vti.springexam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@RequestMapping("product/list")
	
	public String list(Model model) {
		model.addAttribute("title","Homepage-Thông tin sản phảm");
		return "product/list";
	}

@RequestMapping("product/create")
public String create(Model model) {
	model.addAttribute("title","Homepage-Thông tin sản phảm");

		return "product/create";
	}

@RequestMapping("/product/create-confirm")
public String createConfirm(
    @RequestParam String productName,
    @RequestParam String productDesc,
    @RequestParam Integer price,
    @RequestParam Integer categoryId,
    @RequestParam String featured,
    Model model
) {
    model.addAttribute("productName", productName);
    model.addAttribute("productDesc", productDesc);
    model.addAttribute("price", price);
    model.addAttribute("categoryId", categoryId);
    model.addAttribute("featured", featured);

    return "product/createConfirm";
}

@RequestMapping("/product/create-execute")
public String createExecute(
    @RequestParam String productName,
    @RequestParam String productDesc,
    @RequestParam Integer price,
    @RequestParam Integer categoryId,
    @RequestParam String featured,
    Model model
) {
    // Handle the final submission here
    // You can add logic to save to database
    model.addAttribute("message", "登録が完了しました");
    return "product/createConfirm";
}
}
