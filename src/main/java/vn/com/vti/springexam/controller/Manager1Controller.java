//package vn.com.vti.springexam.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import vn.com.vti.springexam.entity.Manager;
//import vn.com.vti.springexam.entity.ManagerExample;
//import vn.com.vti.springexam.mapper.ManagerMapper;
//
//@Controller
//@RequestMapping("product")
//public class Manager1Controller {
//    
//    @Autowired
//    private ManagerMapper managerMapper; // Đây là biến instance
//    
//    @RequestMapping("listm") 
//    public String list(Model model) {
//        ManagerExample productExample = new ManagerExample();
////        productExample.setOrderByClause("categori_id desc");
//        
//        List<Manager> managerList = managerMapper.selectByExample(productExample);
//        
//        model.addAttribute("manager1", managerList);
//        
//        return "manager1/listm";
//    }
//}