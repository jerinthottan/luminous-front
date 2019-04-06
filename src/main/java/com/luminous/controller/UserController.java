 
package com.luminous.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.luminous.dao.ProductDAO;
import com.luminous.dao.UserDAO;
import com.luminous.model.Product;
import com.luminous.model.Supplier;
import com.luminous.model.UserDetail;


@Controller
public class UserController {

	 
	 @Autowired
	  ProductDAO productDAO;
	 
	 @Autowired
	 UserDAO userDAO;
		
	 @RequestMapping(value="/userhome")
		public String showUserHome(Model m,HttpSession session)
		{
			m.addAttribute("pageinfo", "Product Catalog");
			List<Product> listProducts=productDAO.listProducts();
			m.addAttribute("productList", listProducts);
			
			return "UserHome";
		}
	     
	 @RequestMapping(value = "/addUser", method = RequestMethod.POST)
		public String addUser(@ModelAttribute("user")UserDetail userDetail, Model m, String customerAddress, String customerName, String username, String password, String role)
	 {
			UserDetail userdetail=new UserDetail();
			userdetail.setCustomerName(customerName);
			userdetail.setUsername(username);
			userdetail.setCustomerAddr(customerAddress);
			userdetail.setPassword(password);
			userdetail.setRole("ROLE_USER");
			userdetail.setEnabled(true);
			userDAO.registerUser(userdetail);			
	    return "Login";
	 }
	
		
		@RequestMapping(value="/login_success", method=RequestMethod.POST)
		public String loginCheck(Model m,HttpSession session)
		{
			String page="";
			boolean loggedIn=false;
			
			SecurityContext securityContext=SecurityContextHolder.getContext();
			Authentication authentication=securityContext.getAuthentication();
			
			String username=authentication.getName();
			
			Collection<GrantedAuthority> roles=(Collection<GrantedAuthority>)authentication.getAuthorities();
		
			for(GrantedAuthority role:roles)
			{
				session.setAttribute("role", role.getAuthority());
				
				if(role.getAuthority().equals("ROLE_ADMIN"))
				{
					m.addAttribute("pageinfo", "Admin_Home");
					List<Product> listProducts=productDAO.listProducts();
					m.addAttribute("productList", listProducts);
					
					loggedIn=true;
					page="AdminHome";
					session.setAttribute("loggedIn", loggedIn);
					session.setAttribute("username", username);
				}
				else
				{
					m.addAttribute("pageinfo", "User_Home");
					List<Product> listProducts=productDAO.listProducts();
					m.addAttribute("productList", listProducts);
					
					loggedIn=true;
					page="ProductDisplay";
					session.setAttribute("loggedIn", loggedIn);
					session.setAttribute("username", username);
				}
			}
			
			
			return page;
		}
			

}