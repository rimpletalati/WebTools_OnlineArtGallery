package com.neu.edu;	

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.neu.edu.dao.OrderDao;
import com.neu.edu.model.Order;
import com.neu.edu.model.Payment;
import com.neu.edu.model.UserAccount;

@Controller
public class OrderController 
{
	@Autowired
	private OrderDao orderDao;
	
	@RequestMapping(value="addToCart.htm", method=RequestMethod.POST)
	public String addProductToCart(Model model,HttpServletRequest request) throws Exception
	{
		UserAccount user = (UserAccount)request.getSession().getAttribute("user");
		if(user==null||!user.getRole().equals("customer")){
			return "403";
		}
		HttpSession session=request.getSession();
		long productID=Long.parseLong(request.getParameter("productID"));
		int productQuantity=1;
		Order customerOrder=orderDao.addProductToCart(productID,productQuantity,session);
		model.addAttribute("cart",customerOrder);
		return "shoppingCart";
	}
	
	@RequestMapping(value="deleteOrderItem.htm", method=RequestMethod.GET)
	public String deleteOrderItemFromCart(Model model,HttpServletRequest request) throws Exception
	{
		UserAccount user = (UserAccount)request.getSession().getAttribute("user");
		if(user==null||!user.getRole().equals("customer")){
			return "403";
		}
		//HttpSession session=request.getSession();
		long orderItemID=Long.parseLong(request.getParameter("orderItemid"));
		long orderID=Long.parseLong(request.getParameter("orderID"));
		Order customerOrder=orderDao.deleteOrderItem(orderItemID,orderID);
		model.addAttribute("cart",customerOrder);
		return "shoppingCart";
	}
	
	@RequestMapping(value="makepayment.htm", method=RequestMethod.POST)
	public String makePayement(HttpServletRequest request, Model model){
		UserAccount user = (UserAccount)request.getSession().getAttribute("user");
		if(user==null||!user.getRole().equals("customer")){
			return "403";
		}
		String orderId = request.getParameter("orderId");
		if(orderDao.checkOrderForPayment(orderId)){
			String name = request.getParameter("name");
			String[] card  = request.getParameterValues("cardNumber");
			String cardNumber = "";
			for(String c : card){
				cardNumber = cardNumber+c;
			}
			String month = request.getParameter("month");
			String year = request.getParameter("year");
			
			String date  = year+"/"+month;
			int cvv = Integer.parseInt(request.getParameter("cvv"));
			
			Payment payment = new Payment();
			payment.setCvv(cvv);
			payment.setDate(date);
			payment.setNumber(cardNumber);
			orderDao.makePayment(payment, orderId);
			String paymentID= String.valueOf(payment.getPaymentId());
			model.addAttribute("paymentId",orderId);
			model.addAttribute("orderId",orderId);
			
			return "PaymentSuccessful";
		}else{
			return "PaymentAlreadyMade";
		}
	}
	
	@RequestMapping(value="proceedPayment.go", method=RequestMethod.POST)
	public String proceedForPayment(HttpServletRequest request, Model model){
		UserAccount user = (UserAccount)request.getSession().getAttribute("user");
		if(user==null||!user.getRole().equals("customer")){
			return "403";
		}
		String orderId = request.getParameter("orderID");
		model.addAttribute("orderId", orderId);
		model.addAttribute("paymentId", orderId);
		if(orderDao.checkOrderForPayment(orderId)){
			return "makePayment";
//			String result = orderDao.checkForQuantity(orderId);
//			if(result.equals("true")){
//				return "makePayment";
//			}else{
//				model.addAttribute("productNotAvailable", result);
//				return "NotSufficientQuantity";
//			}
		}else{
			return "PaymentAlreadyMade";
		}
		
	}
	
	@RequestMapping(value = "viewPdf.do", method = RequestMethod.POST)
	public ModelAndView home(Locale locale, ModelMap model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception 
	{

		String orderId = request.getParameter("orderId");
		String paymentId = request.getParameter("paymentId");

		Order order = (Order)orderDao.getOrderObj(orderId);
		model.addAttribute("order", order);
		
		Payment payment = (Payment)orderDao.getPaymentObj(paymentId);
		model.addAttribute("payment", payment);
		
		float orderTotal = order.getOrderTotal();
		model.addAttribute("total", orderTotal);

		return new ModelAndView(new PDFView(), model);
	}
}
