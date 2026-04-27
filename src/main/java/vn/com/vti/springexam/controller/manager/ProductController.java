package vn.com.vti.springexam.controller.manager;

import java.util.Date;
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

import vn.com.vti.springexam.entity.Product;
import vn.com.vti.springexam.entity.ProductExample;
import vn.com.vti.springexam.mapper.ProductMapper;

@Controller
@RequestMapping("/manager/product")
public class ProductController {

    @Autowired
    private ProductMapper productMapper;

    // GET list
    @RequestMapping("/list")
    public String list(Model model) {
        ProductExample productExample = new ProductExample();
        List<Product> productList = productMapper.selectByExample(productExample);
        Date date = new Date();
        model.addAttribute("date", date);
        model.addAttribute("productList", productList);
        model.addAttribute("title", "商品一覧");
        return "manager/product/list";
    }

    // GET create form
    @RequestMapping("/create")
    public String create(Model model) {
        model.addAttribute("title", "商品新規登録");
        return "manager/product/create";
    }

    // POST create confirm
    @PostMapping("/create-confirm")
    public String createConfirm(
        @RequestParam String productName,
        @RequestParam String productDesc,
        @RequestParam Integer price,
        @RequestParam Integer categoryId,
        @RequestParam(required = false) String imageUrl,
        Model model
    ) {
        model.addAttribute("productName", productName);
        model.addAttribute("productDesc", productDesc);
        model.addAttribute("price",       price);
        model.addAttribute("categoryId",  categoryId);
        model.addAttribute("imageUrl",    imageUrl);
        return "manager/product/createConfirm";
    }

    // POST insert
    @PostMapping("/insert")
    public String insert(
        @RequestParam String productName,
        @RequestParam String productDesc,
        @RequestParam Integer price,
        @RequestParam Integer categoryId,
        @RequestParam(required = false) String imageUrl
    ) {
        Product product = new Product();
        product.setProductName(productName);
        product.setProductDesc(productDesc);
        product.setCategoryId(categoryId);
        product.setPrice(price);
        product.setImageUrl(imageUrl);
        productMapper.insertSelective(product);
        return "manager/product/createSuccess";
    }

    // POST delete
    @PostMapping("/delete")
    @ResponseBody
    @Transactional
    public String delete(@RequestParam("productId") Integer id) {
        int cnt = productMapper.deleteByPrimaryKey(id);
        if (cnt > 0) {
            return "XOA THANH CONG";
        } else {
            return "KHONG THANH CONG";
        }
    }

    // GET list API
    @GetMapping(value = "/list/api", produces = "application/json")
    @ResponseBody
    public List<Product> listApi() {
        ProductExample productExample = new ProductExample();
        return productMapper.selectByExample(productExample);
    }

    // POST create API
    @PostMapping("/create/api")
    @ResponseBody
    public int createApi(@RequestBody Product product) {
        return productMapper.insertSelective(product);
    }
}