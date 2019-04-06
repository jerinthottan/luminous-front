
package com.luminous.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.luminous.dao.CartDAO;
import com.luminous.dao.InvoiceDAO;
import com.luminous.dao.ProductDAO;
import com.luminous.dao.UserDAO;
import com.luminous.model.Cart;
import com.luminous.model.Invoice;
import com.luminous.model.UserDetail;

@Controller
public class PaymentController 
{
	
	@Autowired
	CartDAO cartDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	InvoiceDAO invoiceDAO;
	
	@RequestMapping("/checkout")
	public String chechout(Model m,HttpSession session)
	{
		String username=(String)session.getAttribute("username");
		List<Cart> cartList=cartDAO.listCart(username);
		m.addAttribute("cartList",cartList);
		m.addAttribute("grandTotal",this.getGrandTotal(cartList));
		String address=userDAO.getUser(username).getCustomerAddr();
		m.addAttribute("address",address);
		return "OrderConfirm";
	}
	
	@RequestMapping(value="/updateAddress",method=RequestMethod.POST)
	public String updateAddress(@RequestParam("address")String address,Model m,HttpSession session)
	{
		String username=(String)session.getAttribute("username");
		List<Cart> cartList=cartDAO.listCart(username);
		m.addAttribute("cartList",cartList);
		m.addAttribute("grandTotal",this.getGrandTotal(cartList));
		UserDetail userdetail=userDAO.getUser(username);
	    userdetail.setCustomerAddr(address);
	    userDAO.updateAddress(userdetail);
		String address1=userDAO.getUser(username).getCustomerAddr();
		m.addAttribute("address",address1);
		return "OrderConfirm";
		
	}
	
	@RequestMapping(value="/payment")
	public String paymentpage(Model m,HttpSession session)
	{
		
		return "Payment";
		
	}
	
	@RequestMapping(value="/invoice",method=RequestMethod.POST)
	public String generateInvoice(@RequestParam("paymentmode")String paymentmode,Model m,HttpSession session)
	{
		String username=(String)session.getAttribute("username");
		Invoice invoice=new Invoice();
		invoice.setOrderDate(new java.util.Date());
		invoice.setShippingAddress(userDAO.getUser(username).getCustomerAddr());
		invoice.setPaymentType(paymentmode);
		invoice.setUsername(username);
		
		List<Cart> cartList=cartDAO.listCart(username);
		m.addAttribute("cartList",cartList);
		m.addAttribute("grandTotal",this.getGrandTotal(cartList));
		
		UserDetail userdetail=userDAO.getUser(username);
		invoice.setTotalAmount(this.getGrandTotal(cartList));
		invoiceDAO.saveOrder(invoice);
		invoiceDAO.updateCart(username);
		m.addAttribute("invoice",invoice);
		
		return "Invoice";
		
	}
	
	public int getGrandTotal(List<Cart>cartList)
	{
		int grandTotal=0,count=0;
		while(count<cartList.size())
		{
			grandTotal=grandTotal+(cartList.get(count).getQuantity()*cartList.get(count).getPrice());
			count++;
		}
		return grandTotal;	
	}
	
}