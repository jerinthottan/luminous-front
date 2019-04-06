    
package com.luminous.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.luminous.dao.CartDAO;
import com.luminous.dao.ProductDAO;
import com.luminous.model.Cart;
import com.luminous.model.Product;


@Controller
public class CartController {
	@Autowired
	CartDAO cartDAO; 
	
	@Autowired
	ProductDAO productDAO;
	
	@RequestMapping("/cart")
	public String showCart(Model m,HttpSession session)
	{
		String username=(String)session.getAttribute("username");
		List<Cart> cartList=cartDAO.listCart(username);
		m.addAttribute("cartList",cartList);
		m.addAttribute("grandTotal",this.getGrandTotal(cartList));
		
		return "Cart";
	}

	@RequestMapping("/addCart/{productId}")
	public String addtoCart(@PathVariable("productId")int productId,@RequestParam("quantity")int quantity,HttpSession session,Model m)
	{
		Product product=productDAO.getProduct(productId);
		String username=(String)session.getAttribute("username");
		
		Cart cart=new Cart();
		cart.setProductId(product.getProductId());
		cart.setProductName(product.getProductName());
		cart.setQuantity(quantity);	
		cart.setPrice(product.getPrice());
		cart.setPaymentStatuse("Not Paid");
		cart.setUsername(username);
		cartDAO.addCart(cart);
		List<Cart> cartList=cartDAO.listCart(username);
		m.addAttribute("cartList", cartList);
		m.addAttribute("grandTotal", this.getGrandTotal(cartList));
		
      return "Cart";
	}
	
	 @RequestMapping("/updateCart/{cartId}")
	    public String updateCart(@PathVariable("cartId")int cartId,@RequestParam("quantity")int quantity,Model m, HttpSession session)
	     {
		  Cart cart=cartDAO.getCart(cartId);
		  cart.setQuantity(quantity);
		  
		  cartDAO.updateCart(cart);
		  
		  String username=(String)session.getAttribute("username");
		  List<Cart> cartList=cartDAO.listCart(username);
			
		  m.addAttribute("cartList", cartList);
		  m.addAttribute("grandTotal", this.getGrandTotal(cartList));
			
		  return "Cart";
	     }
		
	  @RequestMapping("/deleteCart/{cartId}")
	  public String deleteCart(@PathVariable("cartId")int cartId,Model m, HttpSession session)
	   {
		  Cart cart=cartDAO.getCart(cartId);
		 
		  
		  cartDAO.deleteCart(cart);
		  
		  String username=(String)session.getAttribute("username");
		  List<Cart> cartList=cartDAO.listCart(username);
			
		  m.addAttribute("cartList", cartList);
		  m.addAttribute("grandTotal", this.getGrandTotal(cartList));
			
		  return "Cart";
	   }
		
	  
		public int getGrandTotal(List<Cart> cartList)
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