package vn.com.vti.springexam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.vti.springexam.entity.Product;
import vn.com.vti.springexam.entity.ProductExample;
import vn.com.vti.springexam.mapper.ProductMapper;

@Controller
@RequestMapping("product")
public class ProductController {
    
    @Autowired
    private ProductMapper productMapper; // Đây là biến instance
    
    @RequestMapping("listp") 
    public String list(Model model) {
        ProductExample productExample = new ProductExample();
//        productExample.setOrderByClause("categori_id desc");
        
        List<Product> productList = productMapper.selectByExample(productExample);
        
        model.addAttribute("products", productList);
        
        return "product/listp";
    }
}