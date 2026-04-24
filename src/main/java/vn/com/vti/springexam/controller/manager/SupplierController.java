package vn.com.vti.springexam.controller.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import vn.com.vti.springexam.entity.Supplier;
import vn.com.vti.springexam.entity.SupplierExample;
import vn.com.vti.springexam.mapper.SupplierMapper;

@Controller
@RequestMapping("manager/supplier")
public class SupplierController {

    @Autowired
    private SupplierMapper supplierMapper;

   
    @RequestMapping("list")
    public String list(Model model) {
        SupplierExample supplierExample = new SupplierExample();
        List<Supplier> supplierList = supplierMapper.selectByExample(supplierExample);
        model.addAttribute("supplierList", supplierList);
        return "manager/supplier/list";
    }

    
    @PostMapping("create")
    @ResponseBody
    public int create(@RequestBody Supplier supplier) {
        int cnt = supplierMapper.insertSelective(supplier);
        return cnt;
    }

   
    @PostMapping("delete")      
    @ResponseBody
    @Transactional
    public String delete(@RequestParam("supplierId") Integer id) {
        int cnt = supplierMapper.deleteByPrimaryKey(id);
        if (cnt > 0) {         
            return "XOA THANH CONG";
        } else {
            return "KHONG THANH CONG";
        }
    }

   
    @GetMapping(value = "list/api", produces = "application/json")  
    @ResponseBody
    public List<Supplier> listApi() {
        SupplierExample supplierExample = new SupplierExample();
        return supplierMapper.selectByExample(supplierExample);
    }
}