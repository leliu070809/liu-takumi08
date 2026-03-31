package vn.com.vti.springexam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.vti.springexam.entity.Category;
import vn.com.vti.springexam.entity.CategoryExample;
import vn.com.vti.springexam.mapper.CategoryMapper;

@Controller
@RequestMapping("category")
public class CategoryController {
    
    @Autowired
    private CategoryMapper categoryMapper; // Đây là biến instance
    
    @RequestMapping("list") 
    public String list(Model model) {
        CategoryExample categoryExample = new CategoryExample();
        categoryExample.setOrderByClause("id desc");
        
        List<Category> categoryList = categoryMapper.selectByExample(categoryExample);
        
        model.addAttribute("categories", categoryList);
        
        return "category/list";
    }
}