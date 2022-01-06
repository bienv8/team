package com.iot.test.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.iot.test.mapper.CategoryMapper;
import com.iot.test.mapper.ColorInfoMapper;

@Controller
public class UrlController {
	private static final Logger log = LoggerFactory.getLogger(UrlController.class);

	@Autowired
	private CategoryMapper ctm;

	@Autowired
	private ColorInfoMapper clm;

	@RequestMapping("/")
	public String index() {

		return "index";
	}			

	@RequestMapping("/home")
	public String home() {

		return "index";
	}

	@RequestMapping("/header")
	public String header() {

		return "common/header";
	}

	@RequestMapping(value = "/login")
	public String login() {

		return "user/login";
	}

	@RequestMapping("/signup")
	public String signup() {

		return "user/signup";
	}

	@RequestMapping("/myprofile")
	public String goMyProfile() {
		
		return "mypage/myprofile";
		
	}

}
