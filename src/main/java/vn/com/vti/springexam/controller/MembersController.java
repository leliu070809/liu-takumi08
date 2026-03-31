package vn.com.vti.springexam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.vti.springexam.entity.Members;
import vn.com.vti.springexam.entity.MembersExample;
import vn.com.vti.springexam.mapper.MembersMapper;

@Controller
@RequestMapping("members")
public class MembersController {
    
    @Autowired
    private MembersMapper membersMapper; // Đây là biến instance
    
    @RequestMapping("listm") 
    public String list(Model model) {
        MembersExample membersExample = new MembersExample();
        membersExample.setOrderByClause("id desc");
        
        List<Members> membersList = membersMapper.selectByExample(membersExample);
        
        model.addAttribute("members", membersList);
        
        return "members/listm";
    }
}