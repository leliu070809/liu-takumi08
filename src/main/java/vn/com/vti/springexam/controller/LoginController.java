package vn.com.vti.springexam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.vti.springexam.form.LoginForm;

@Controller
@RequestMapping("/login")
public class LoginController {

    @ModelAttribute("loginForm")
    public LoginForm createForm() {
        return new LoginForm();
    }

    @GetMapping
    public String login() {
        return "auth/login";
    }
}