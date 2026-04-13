package vn.com.vti.springexam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.springexam.entity.Category;
import vn.com.vti.springexam.entity.CategoryExample;
import vn.com.vti.springexam.mapper.CategoryMapper;

@Controller
@RequestMapping("/manager")
public class CategoryController {
    
    @Autowired
    private CategoryMapper categoryMapper; // Đây là biến instance
    
    @RequestMapping("/category/list") 
    public String list(Model model) {
        CategoryExample categoryExample = new CategoryExample();
        categoryExample.setOrderByClause("id desc");
        
        List<Category> categoryList = categoryMapper.selectByExample(categoryExample);
        
        model.addAttribute("categories", categoryList);
        
        return "category/list";
    }
    @RequestMapping("/category/create")
    public String create(Model model) {
        model.addAttribute("title", "them moi category");
        return "category/create";
    }
    @PostMapping("category/createConfirm")
    public String createConfirm(
            @RequestParam String categoryName,
            @RequestParam String categoryDesc,
            Model model
        ) {
            model.addAttribute("categoryName", categoryName);
            model.addAttribute("categoryDesc", categoryDesc);

            return "category/createConfirm";
        }
    @PostMapping("/category/insert")
    public String insert(
        @RequestParam String categoryName,
        @RequestParam String categoryDesc
        
    ) {
        Category category = new Category();
        category.setCategoryName(categoryName);
        category.setCategoryDesc(categoryDesc);
       
        categoryMapper.insertSelective(category);

        return "redirect:/manager/category/list"; 

    }
    
    
}