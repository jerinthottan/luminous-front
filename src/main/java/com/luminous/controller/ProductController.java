  
package com.luminous.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.luminous.dao.CategoryDAO;
import com.luminous.dao.ProductDAO;
import com.luminous.model.Category;
import com.luminous.model.Product;



@Controller
public class ProductController 
{
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
    ProductDAO productDAO;

	
	@RequestMapping("/product")
	public String showProduct(Model m)
	{
		Product product=new Product();
		m.addAttribute(product);
		List<Product> listProducts=productDAO.listProducts();
		m.addAttribute("productList",listProducts);
		m.addAttribute("categoryList",this.getCategories());
		m.addAttribute("pageinfo","Manage Product");
		return "Product";
	}
	@RequestMapping(value="/InsertProduct",method=RequestMethod.POST)
	public String insertProduct(@ModelAttribute("product")Product product,@RequestParam("productimage") MultipartFile filedet,Model m)
	{
	    productDAO.addProduct(product);
		
		Product product1=new Product();
	    m.addAttribute(product1);
	    m.addAttribute("pageinfo","Manage Product");
	    m.addAttribute("categoryList",this.getCategories());
	    String imagepath="C:\\New folder\\luminous-front\\src\\main\\webapp\\resources\\images\\";
	    imagepath=imagepath+String.valueOf(product.getProductId())+".jpg";
	    File image=new File(imagepath);
	    
	    if(!filedet.isEmpty())
	    {
	    	try
	    	{
	    		byte buff[]=filedet.getBytes();
	    		FileOutputStream fos=new FileOutputStream(image);
	    		BufferedOutputStream bos=new BufferedOutputStream(fos);
	    		bos.write(buff);
	    		bos.close();
	    		
	    	}
	    	catch(Exception e)
	    	{
	    		m.addAttribute("Exception message","Exception in uploading the image:"+e.getMessage());
	    		
	    	}
	    }
	    else
	    {
	    	m.addAttribute("error message", "problem in uploadinf the image:");
	    }
	    
		List<Product> listProducts=productDAO.listProducts();
		m.addAttribute("productList", listProducts);
		
	
		return "Product";
	}
	
	@RequestMapping(value="/deleteProduct/{productId}")
	public String deleteProduct(Model m,@PathVariable("productId")int productId)
	{
		Product product=productDAO.getProduct(productId);
		productDAO.deleteProduct(product);
		
		Product product1=new Product();
		m.addAttribute(product1);
			
		m.addAttribute("pageinfo","Manage product");
		m.addAttribute("categoryList",this.getCategories());
		
		List<Product> listProducts=productDAO.listProducts();
		m.addAttribute("productList", listProducts);

		return "Product";
		}
	@RequestMapping("/productDisplay")
	public String displayProduct(Model m)
	{
		m.addAttribute("pageinfo", "Product Gallery");
		List<Product> listProducts=productDAO.listProducts();
		m.addAttribute("productList", listProducts);
		return "ProductDisplay";
	}
	
	@RequestMapping("/productDetailsDisplay/{productId}")
	public String ProductDetailsDisplay(@PathVariable("productId")int productId,Model m)
	{
		m.addAttribute("pageinfo","Product Info");
		Product product=productDAO.getProduct(productId);
		m.addAttribute("product",product);
		return "ProductDetailsDisplay";
		
	}
	@RequestMapping(value="/UpdateProduct",method=RequestMethod.POST)
    public String updateProduct(@ModelAttribute ("product")Product product,Model m)
	
	{
	    productDAO.updateProduct(product);
	    
		Product product1=new Product();
		m.addAttribute(product1);
			
		m.addAttribute("pageinfo","Manage product");
		m.addAttribute("categoryList",this.getCategories());
		
		List<Product> listProducts=productDAO.listProducts();
		m.addAttribute("productList", listProducts);

		return "Product";
	}
		@RequestMapping(value="/editProduct/{productId}")
		public String editProduct(Model m,@PathVariable("productId")int productId)
		{
			Product product=productDAO.getProduct(productId);
			
			m.addAttribute("product",product);
			m.addAttribute("pageinfo","Manage Product");
			
			m.addAttribute("categoryList",this.getCategories());
		
			return "UpdateProduct";
		}
		
		public LinkedHashMap<Integer,String> getCategories()
	    {
		List<Category> listCategories=categoryDAO.listCategories();
	     LinkedHashMap<Integer,String> categoryList=new LinkedHashMap<Integer,String>();
	     
	     for(Category category:listCategories)
	      {
	        categoryList.put(category.getCategoryID(),category.getCategoryName());	
	          }
	    return categoryList;
	}	
     
}