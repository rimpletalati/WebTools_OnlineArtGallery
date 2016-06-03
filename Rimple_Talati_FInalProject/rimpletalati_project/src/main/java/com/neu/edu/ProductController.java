package com.neu.edu;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neu.edu.dao.CustomerDao;
import com.neu.edu.dao.ProductDao;
import com.neu.edu.dao.SupplierDao;
import com.neu.edu.model.Customer;
import com.neu.edu.model.Painting;
import com.neu.edu.model.PaintingCategory;
import com.neu.edu.model.UserAccount;

@Controller
public class ProductController 
{
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping(value="showProductDetails.htm", method=RequestMethod.GET)
	public String showProductDetails(Model model,HttpServletRequest request) throws Exception
	{
		UserAccount user = (UserAccount)request.getSession().getAttribute("user");
		if(user==null||!user.getRole().equals("customer")){
			return "403";
		}
		long productID=Long.parseLong(request.getParameter("productID"));
		Painting product=productDao.getSelectedProduct(productID);
		model.addAttribute("product",product);
		return "productDetails";
    }
	
	
	@RequestMapping(value="checkforproduct.do", method=RequestMethod.POST)
	public void getQuickProduct(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		String category = request.getHeader("category");
		String productName = request.getHeader("paintingName");
		
		String suggestion = productDao.getProductNames(category, productName);
		PrintWriter out = response.getWriter();
		out.print(suggestion);
	}
	
	
}
