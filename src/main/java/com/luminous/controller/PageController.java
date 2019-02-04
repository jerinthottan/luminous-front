package com.luminous.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class PageController {
	@RequestMapping("/login")
	public String showLogin(Model m)
	{
		m.addAttribute("pageinfo","Login");
		return "Login";
	}
	@RequestMapping("/signup")
	public String showSignUp(Model m)
	{
		m.addAttribute("pageinfo","SignUp");
		return "SignUp";
	}
	@RequestMapping("/aboutus")
	public String showAboutUs(Model m)
	{
		m.addAttribute("pageinfo","AboutUs");
		return "AboutUs";
	}
	@RequestMapping("/contactus")
	public String hai(Model m)
	{
		m.addAttribute("pageinfo","ContactUs");
		return "Contactus";
	}
	
	
	@RequestMapping("/")
	public String showHeader(Model m)
	{
		m.addAttribute("pageinfo","Header");
		return "Header";
	}
}
