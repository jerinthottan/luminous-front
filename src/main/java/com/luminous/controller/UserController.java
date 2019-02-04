package com.luminous.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.luminous.dao.UserDAO;
import com.luminous.model.Product;
import com.luminous.model.Supplier;
import com.luminous.model.UserDetail;



@Controller
public class UserController {
	 @Autowired
	    UserDAO userDAO;
		
	 @RequestMapping("/user")
		public String showSupplier(Model m)
		{
			List<UserDetail>listUserDetails=userDAO.listUserDetails();
			m.addAttribute("listUserDetails",listUserDetails);
			m.addAttribute("pageinfo","Manage User");
			return "User";
		}
		
		@RequestMapping(value="/AddUser",method=RequestMethod.POST)
		public String addUser(Model m,@RequestParam("UserName")String userName,@RequestParam("userPwd")String password,@RequestParam("uAddr")String customerAddr)
		{
			UserDetail user=new UserDetail();
			user.setUsername(userName);
			user.setPassword(password);
			user.setCustomerAddr(customerAddr);
			user.setEnabled(true);
			user.setRole("ROLE_USER");
			
			userDAO.registerUser(user);
			
			m.addAttribute("pageinfo","Manage User");
			return "User";
		}
		
		
			

}
