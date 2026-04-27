package vn.com.vti.springexam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.springexam.dto.CartDto;
import vn.com.vti.springexam.entity.Product;
import vn.com.vti.springexam.mapper.ProductMapper;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private CartDto cartDto;

    @RequestMapping("/add")
    public String add(@RequestParam Integer productId,
                      RedirectAttributes redirectAttributes) {
        Product product = productMapper.selectByPrimaryKey(productId);
        if (product != null) {
            cartDto.getProductList().add(product);
        }
        redirectAttributes.addFlashAttribute("msg", "カートに追加しました。");
        return "redirect:/home";
    }

    @RequestMapping("/list")
    public String list() {
        return "cart/list";
    }
}