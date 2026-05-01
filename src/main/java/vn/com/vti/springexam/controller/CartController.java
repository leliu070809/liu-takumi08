package vn.com.vti.springexam.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import vn.com.vti.springexam.dao.CartStatus;
import vn.com.vti.springexam.dto.CartDto;
import vn.com.vti.springexam.entity.Product;
import vn.com.vti.springexam.mapper.ProductMapper;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private CartDto cartDto;
    @PostMapping("/add")
    @ResponseBody
    public CartStatus add(@RequestBody Map<String, Object> payload) {
        Integer productId = Integer.valueOf(payload.get("productId").toString());
        Product product = productMapper.selectByPrimaryKey(productId);
        cartDto.getProductList().add(product);

        CartStatus cartStatus = new CartStatus();
        cartStatus.setCartSize(cartDto.getProductList().size());
        cartStatus.setStatus("カートに追加しました。");
        return cartStatus;
    }
}