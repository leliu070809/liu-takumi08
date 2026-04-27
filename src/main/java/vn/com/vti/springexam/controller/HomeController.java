package vn.com.vti.springexam.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import vn.com.vti.springexam.dto.CartDto;
import vn.com.vti.springexam.entity.Category;
import vn.com.vti.springexam.entity.CategoryExample;
import vn.com.vti.springexam.entity.Product;
import vn.com.vti.springexam.entity.ProductExample;
import vn.com.vti.springexam.mapper.CategoryMapper;
import vn.com.vti.springexam.mapper.ProductMapper;

@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private CartDto cartDto;

    @RequestMapping
    public String homeIndex(Model model) {
        model.addAttribute("title", "Homepage - Trang chủ");

        List<Category> categoryList = categoryMapper.selectByExample(new CategoryExample());
        model.addAttribute("categoryList", categoryList);
        

        // Lấy 4 sản phẩm mới nhất
        ProductExample productExample = new ProductExample();
        productExample.setOrderByClause("id DESC");
        List<Product> allProducts = productMapper.selectByExample(productExample);
        List<Product> products = allProducts.subList(0, Math.min(4, allProducts.size()));
        model.addAttribute("products", products);

        return "home";
    }

    @RequestMapping("/current-time")
    @ResponseBody
    public String currentTime() {
        Date date = new Date();
        return date.toString();
    }
}