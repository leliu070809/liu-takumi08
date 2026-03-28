package vn.com.vti.springexam.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import vn.com.vti.springexam.entity.Category;
import vn.com.vti.springexam.entity.CategoryExample;
import vn.com.vti.springexam.mapper.CategoryMapper;

@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private CategoryMapper categoryMapper;

    @RequestMapping
    public String homeIndex( Model model ) {
        model.addAttribute("title", "Homepage - Trang chủ");

        List<Category> categoryList = categoryMapper.selectByExample( new CategoryExample() );
        model.addAttribute("categoryList", categoryList);
        return "home";
    }



@RequestMapping("/current-time")
@ResponseBody
public String currentTime() {
	Date date = new Date();
	String dateStr = date.toString();
	return dateStr;
}

}
