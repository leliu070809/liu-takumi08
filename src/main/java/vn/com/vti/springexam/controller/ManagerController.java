package vn.com.vti.springexam.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.springexam.entity.Product;
import vn.com.vti.springexam.entity.ProductExample;
import vn.com.vti.springexam.mapper.ProductMapper;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    private final CategoryController categoryController;

    ManagerController(CategoryController categoryController) {
        this.categoryController = categoryController;
    }

    @Autowired
    private ProductMapper productMapper;

    @RequestMapping("/product/list")
    public String list(Model model) {
    	ProductExample productExample = new ProductExample();
        List<Product> productList = productMapper.selectByExample(productExample);
    	Date date = new Date();
    	model.addAttribute("date", date);
    	 model.addAttribute("products", productList);
        
    	model.addAttribute("title", "Homepage-Thông tin sản phẩm");
        return "product/list";
    }

    @RequestMapping("/product/create")
    public String create(Model model) {
        model.addAttribute("title", "Homepage-Thông tin sản phẩm");
        return "product/create";
    }

  
    @PostMapping("/product/create-confirm")
    public String createConfirm(
        @RequestParam String productName,
        @RequestParam String productDesc,
        @RequestParam Integer price,
        @RequestParam Integer categoryId,
//        @RequestParam(required = false) String featured, // ← nullable nếu form không gửi
        Model model
    ) {
        model.addAttribute("productName", productName);
        model.addAttribute("productDesc", productDesc);
        model.addAttribute("price", price);
        model.addAttribute("categoryId", categoryId);

//        if (featured != null) {
//            model.addAttribute("featured", featured);
//        }

        return "product/createConfirm";
    }

    
    @PostMapping("/product/insert")
    public String insert(
        @RequestParam String productName,
        @RequestParam String productDesc,
        @RequestParam Integer price,
        @RequestParam Integer categoryId
    ) {
        Product product = new Product();
        product.setProductName(productName);
        product.setCategoryId(categoryId);
        product.setPrice(price);

        productMapper.insertSelective(product);

        return "product/createSuccess";
    }
}