package com.neu.edu;

import java.io.IOException;
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
import com.neu.edu.dao.OrderDao;
import com.neu.edu.dao.SupplierDao;
import com.neu.edu.model.Customer;
import com.neu.edu.model.Order;
import com.neu.edu.model.Painting;
import com.neu.edu.model.PaintingCategory;
import com.neu.edu.model.UserAccount;

@Controller
public class CustomerRoleController {
	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
	private SupplierDao supplierDao;
	
	@Autowired
	private OrderDao orderDao;

	@RequestMapping(value = "getProducts.go", method = RequestMethod.POST)
	public String getproducts(Model model, HttpServletRequest request)
			throws Exception {
		UserAccount user = (UserAccount)request.getSession().getAttribute("user");
		if(user==null||!user.getRole().equals("customer")){
			return "403";
		}
		String category = request.getParameter("category");
		String searchProduct = request.getParameter("productName");
		if (searchProduct.equals("")) {
			List<Painting> productList = customerDao.getProductList(category);
			model.addAttribute("paintingList", productList);
			model.addAttribute("companyList", customerDao.getArtistList());
		} else {
			List<Painting> getproductList = customerDao.getProduct(category,searchProduct);
			model.addAttribute("paintingList", getproductList);
			model.addAttribute("companyList", customerDao.getArtistList());
		}
		return "productDisplay";

	}

	@RequestMapping(value = "quickSearch.do", method = RequestMethod.POST)
	public String quickSearch(Model model, HttpServletRequest request)
			throws Exception {
		UserAccount user = (UserAccount)request.getSession().getAttribute("user");
		if(user==null||!user.getRole().equals("customer")){
			return "403";
		}
		String paintingName = request.getParameter("paintingName");
		float priceFrom;
		float priceTo;
		String pricef = request.getParameter("priceFrom");
		if (pricef.equals("")) {
			priceFrom = 0;
		} else {
			priceFrom = Float.parseFloat(pricef);
		}
		String pricet = request.getParameter("priceTo");
		if (pricet.equals("")) {
			priceTo = 0;
		} else {
			priceTo = Float.parseFloat(pricet);
		}
		// String category = request.getParameter("category");
		// System.out.println(category);
		model.addAttribute("companyList", customerDao.getArtistList());

		String companyName = request.getParameter("company");
		List<Painting> searchResult = customerDao.quickSearch(paintingName,
				priceFrom, priceTo, companyName);
		model.addAttribute("paintingList", searchResult);
		return "productDisplay";
	}
	
	@RequestMapping(value="goToHomepage.go", method=RequestMethod.GET)
	public String goToHomePage(HttpSession session, Model model) throws Exception{
		
		UserAccount u = (UserAccount)session.getAttribute("user");
		List<PaintingCategory> paintingList = supplierDao.getListOfCategory();
		model.addAttribute("paintingCategory", paintingList);
		
		List<String> artistList = customerDao.getArtistList();
		model.addAttribute("companyList", artistList);
		
		Customer customer=(Customer)u.getPerson();
		long customerID=customer.getPersonID();
		model.addAttribute("customerId",customerID);
		
		return "customerWorkArea";
		
	}

	@RequestMapping(value="viewmycart.go", method=RequestMethod.GET)
	public String viewMyCart(HttpSession session, Model model, HttpServletResponse response) throws IOException{
		UserAccount user = (UserAccount)session.getAttribute("user");
		if(user==null){
			return "403";
		}
		if(!user.getRole().equals("customer")){
			return "403";
		}
		String personId = String.valueOf(user.getPerson().getPersonID());
		Order cart = orderDao.getCartItem(personId);
		model.addAttribute("cart", cart);
		return "shoppingCart";
	}
	
	@RequestMapping(value = "getOrderHistory.go", method = RequestMethod.POST)
	public String getOrderHistory(Model model, HttpServletRequest request)
			throws Exception {
		UserAccount user = (UserAccount)request.getSession().getAttribute("user");
		if(user==null||!user.getRole().equals("customer")){
			return "403";
		}
		String customerID = request.getParameter("customerId");
		List<Order> orderList = customerDao.getCustomerOrderHistory(customerID);
		model.addAttribute("orderList", orderList);
		if (orderList.size() == 0) {
			return "NoOrderHistory";
		}
		return "orderHistory";

	}
}
