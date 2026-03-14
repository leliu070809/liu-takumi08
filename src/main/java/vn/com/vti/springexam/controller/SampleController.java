package vn.com.vti.springexam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sample")
public class SampleController {
	@RequestMapping("/index")
	public String idx() {
		return "sample";
	}
}
