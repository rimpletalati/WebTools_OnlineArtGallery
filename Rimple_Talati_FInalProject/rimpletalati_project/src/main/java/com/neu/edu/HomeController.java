package com.neu.edu;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neu.edu.dao.AdminDao;
import com.neu.edu.dao.CustomerDao;
import com.neu.edu.dao.SupplierDao;
import com.neu.edu.dao.UserDao;
import com.neu.edu.model.Customer;
import com.neu.edu.model.PaintingCategory;
import com.neu.edu.model.Supplier;
import com.neu.edu.model.UserAccount;
import com.neu.edu.model.UserRole;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
	@Qualifier("userValidator")
	private Validator validator;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SupplierDao supplierDao;
	
	@Autowired 
	private CustomerDao customerDao;
	/*
	 * This is to initialize webDataBinder,set its
	 * validator as we specify.
	 */
	@InitBinder
	private void initBinder (WebDataBinder binder){
		binder.setValidator(validator);
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String initUserLoginForm(Locale locale, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		adminDao.checkAdminCreated();
		
//		if(session.getAttribute("user")!=null){
//			
//			User user = (User)session.getAttribute("user");
//			String userName = user.getUsername();
//			String password = user.getPassword();
//			
//			User u = userDao.queryUserByNameAndPassword(userName, password);
//			if(u!=null){
//				model.addAttribute("user", u);
//				session.setAttribute("user", u);
//				return "userHomePage";
//			}
//			else{
//			session.removeAttribute("user");
//			return "home";
//			}
//		}
		
		Cookie[] cookies = request.getCookies();     
		String userName = null;
		String password = null;

		boolean foundCookie = false;
		if(cookies!=null)
		{
			for(int i = 0; i < cookies.length; i++)
			{ 
				Cookie c = cookies[i];
				if (c.getName().equals("userid"))
					{
					userName = c.getValue();
					model.addAttribute("userName", userName);
					}
				if (c.getName().equals("pwd"))
					{
					password = c.getValue();
					model.addAttribute("password", password);
					}

//				User user = new User();
//				model.addAttribute("foundCookie",true);
				foundCookie = true;
				UserAccount u = userDao.queryUserByNameAndPassword(userName, password);
				if(u!=null){
					
					if(u.getRole().equals(UserRole.ROLE_ADMIN))
					{
						session.setAttribute("user", u);
						return "adminWorkArea";
					}
					
					if(u.getRole().equals(UserRole.ROLE_SUPPLIER))
					{
						session.setAttribute("user", u);
						List<PaintingCategory> listCategory = supplierDao.getListOfCategory();
						model.addAttribute("paintingCategory", listCategory);
						model.addAttribute("artist", u);
						return "supplierworkarea";
					}
					
					if(u.getRole().equals(UserRole.ROLE_CUSTOMER))
					{
						
						List<PaintingCategory> listCategory = supplierDao.getListOfCategory();
						model.addAttribute("paintingCategory", listCategory);
						List<String> companyList = customerDao.getArtistList();
						model.addAttribute("companyList", companyList);
						Customer customer=(Customer)u.getPerson();
						long customerID=customer.getPersonID();
						model.addAttribute("customerID",customerID);
						session.setAttribute("user", u);
						return "customerWorkArea";	
					}
					
					
//					model.addAttribute("user", u);
//					session.setAttribute("user", u);
//					return "userHomePage";
				}
				}
			UserAccount userAccount = new UserAccount();
			model.addAttribute("userAccount", userAccount);
			return "login";
			
//			return "userHomePage";
		}
		
//		if(!foundCookie){
		else{
			UserAccount userAccount = new UserAccount();
			model.addAttribute("user", userAccount);
			model.addAttribute("foundCookie",false);
			return "login";
		}
			
	}
	
	
	@RequestMapping(value="login.go" ,method=RequestMethod.POST)
	public String submitForm(Model model, @Validated UserAccount user, BindingResult result, HttpSession session,HttpServletRequest request, HttpServletResponse response){
		model.addAttribute("userAccount",user);
		String returnVal = "customerWorkArea";
		if (result.hasErrors()){
			
			return "login";
		}else{
			try {
				UserAccount u = userDao.queryUserByNameAndPassword(user.getUsername(), user.getPassword());
				if (u != null){
					model.addAttribute("user", u);
					boolean remember_me_is_checked;
					if(request.getParameter("rememberme")!=null)
					{
						remember_me_is_checked = true;
					if(remember_me_is_checked)
					{
					    Cookie c1 = new Cookie("userid", user.getUsername());
					    Cookie c2 = new Cookie("pwd", user.getPassword());
					    c1.setMaxAge(7*24*60*60);
					    c2.setMaxAge(7*24*60*60);
					    response.addCookie(c1);
					    response.addCookie(c2);
						}
					}
					
					if(u.getRole().equals(UserRole.ROLE_ADMIN))
					{
						session.setAttribute("user", u);
						return "adminWorkArea";
					}
					
					if(u.getRole().equals(UserRole.ROLE_SUPPLIER))
					{
						session.setAttribute("user", u);
						List<PaintingCategory> listCategory = supplierDao.getListOfCategory();
						model.addAttribute("paintingCategory", listCategory);
						model.addAttribute("artist", u);
						return "supplierworkarea";
					}
					
					if(u.getRole().equals(UserRole.ROLE_CUSTOMER))
					{
						List<PaintingCategory> listCategory = supplierDao.getListOfCategory();
						model.addAttribute("paintingCategory", listCategory);
						List<String> companyList = customerDao.getArtistList();
						model.addAttribute("companyList", companyList);
						Customer customer=(Customer)u.getPerson();
						long customerID=customer.getPersonID();
						model.addAttribute("customerID",customerID);
						session.setAttribute("user", u);
						return returnVal;		
					}
				}
				else return "login";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "login";
	
}
	
	@RequestMapping(value="goToSignUp.go")
	public String gotToSignUpPage()
	{
	return "signup";	
	}
	
	@RequestMapping (value="signup.go", method=RequestMethod.POST)
	public String signUpUser(Model model, HttpServletRequest request, HttpSession session) throws Exception
	{
		Customer customer = new Customer();
		customer.setFirstName(request.getParameter("firstName"));
		customer.setLastName(request.getParameter("lastName"));
		customer.setAddress(request.getParameter("address"));
		customer.setDateOfBirth(request.getParameter("dateOfBirth"));
		customer.setEmail(request.getParameter("email"));
		customer.setGender(request.getParameter("gender"));
		customer.setPhoneNo(Long.parseLong(request.getParameter("phoneNo")));
		
		UserAccount userAccount = new UserAccount();
		userAccount.setUsername(request.getParameter("username"));
		userAccount.setPassword(request.getParameter("password"));
		userAccount.setRole(UserRole.ROLE_CUSTOMER);
		
		userAccount.setPerson(customer);
		
		userDao.addCustomerToDb(userAccount);

		
		List<PaintingCategory> listCategory = supplierDao.getListOfCategory();
		model.addAttribute("paintingCategory", listCategory);
		List<String> companyList = customerDao.getArtistList();
		model.addAttribute("companyList", companyList);
//		Customer customer=(Customer)u.getPerson();
//		long customerID=customer.getPersonID();
//		model.addAttribute("customerID",customerID);
//		session.setAttribute("user", userAccount);

		
		session.setAttribute("user", userAccount);
		model.addAttribute("user",userAccount);

		return "customerWorkArea";	
		
	}
	

	@RequestMapping(value="addPaintingToCategory.go", method=RequestMethod.POST)
	public String addPaintingToCategory(HttpServletRequest request) throws Exception
	{
		UserAccount user = (UserAccount)request.getSession().getAttribute("user");
		if(user==null||!user.getRole().equals("supplier")){
			return "403";
		}
		String selectedCategory = request.getParameter("selectCategory");
		String paintingName = request.getParameter("paintingName");
		String desc = request.getParameter("description");
		Float price = Float.parseFloat(request.getParameter("price"));
		String artistName = request.getParameter("artistName");
		int quantity = 1;
		String path = request.getParameter("image");
		//UPLOAD PICTURE CODE//
				
		supplierDao.addPaintingToDb(selectedCategory, paintingName, price, desc, quantity, path, artistName);
		return "paintingAdded";
	}
	
	@RequestMapping(value="addArtist.go", method=RequestMethod.POST)
	public String AddArtist(Model model, HttpServletRequest request, HttpSession session) throws Exception{
		
		UserAccount user = (UserAccount)request.getSession().getAttribute("user");
		if(user==null||!user.getRole().equals("admin")){
			return "403";
		}
			Supplier supplier = new Supplier();
			String firstname= request.getParameter("firstName");
			String lastname = request.getParameter("lastName");
			
			String username=request.getParameter("username");
			String password = request.getParameter("password");
			
			adminDao.addSupplierToDb(firstname, lastname, username, password);
			
			return "adminWorkArea";
	}
	
	@RequestMapping(value = "checkPassword.do", method = RequestMethod.POST)
	public void verifyPassword(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		
		PrintWriter out = response.getWriter();
		UserAccount userAccount = (UserAccount)session.getAttribute("user");
		
		String userName = userAccount.getUsername();
		
		String oldPassword = request.getHeader("oldPassword");

		if(userDao.queryByPassword(userName, oldPassword)){	
			out.print("true");
		}else{
			out.print("false");
		}
	}
	
	@RequestMapping(value = "PasswordChangeTo.go", method = RequestMethod.POST)
	public String goToChangePassword(){
		return "PasswordChange";		
	}
	
	@RequestMapping(value = "PasswordChange.go", method = RequestMethod.POST)
	public String updatePassword(HttpServletRequest request, HttpSession session){
		UserAccount userAccount = (UserAccount)session.getAttribute("user");
		long id = userAccount.getUserID();
		String newPassword = request.getParameter("passNewT");
		userDao.updatePassword(id, newPassword);
		return "passwordSuccessful";		
	}
	
	@RequestMapping(value="addCatgeory.go", method=RequestMethod.POST)
	public String addCategoryToDb(HttpServletRequest request) throws Exception
	{
		UserAccount user = (UserAccount)request.getSession().getAttribute("user");
		if(user==null||!user.getRole().equals("admin")){
			return "403";
		}
		String paintingCaetgoryName = request.getParameter("paintingCaetgoryName");
		
		PaintingCategory pc = new PaintingCategory();
		pc.setName(paintingCaetgoryName);
		adminDao.addCategoryToDb(pc);
		
		return "adminWorkArea";
	}
	
	@RequestMapping(value="checkforusername.do", method=RequestMethod.POST)
	public void checkUserName(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String username = request.getHeader("username");
		
		PrintWriter out = response.getWriter();
		boolean b = userDao.checkUserName(username);
		if(b)
			out.print("true");
		else
			out.print("false");
	}
	
	@RequestMapping(value="logout.go", method=RequestMethod.GET)
	public void logout(HttpSession session, HttpServletResponse response) throws IOException{
		session.removeAttribute("user");
		Cookie c1 = new Cookie("userid", null);
		Cookie c2 = new Cookie("pwd", null);
		c1.setMaxAge(0);
		c2.setMaxAge(0);
		response.addCookie(c1);
		response.addCookie(c2);
		response.sendRedirect("");
	}
	
	@RequestMapping(value="goToSupplierHome.do", method=RequestMethod.GET)
	public String goToSupplierHomePage(HttpSession session, Model model) throws Exception
	{
		UserAccount u = (UserAccount)session.getAttribute("user");
		Supplier supplier = (Supplier)u.getPerson();
		String supplierName = supplier.getSupplierName();
		model.addAttribute("supplierName", supplierName);
		
		List<PaintingCategory> paintingCategory = supplierDao.getListOfCategory();
		model.addAttribute("paintingCategory", paintingCategory);
		model.addAttribute("artist",u);
		session.setAttribute("user", u);
		return "supplierworkarea";
		
	}
	
	@RequestMapping(value="goToLoginPage.do", method=RequestMethod.GET)
	public String goToLoginHomePage(HttpSession session, Model model) throws Exception
	{
		return "login";
		
	}
	
}



