package com.demo.controllers.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;

import com.demo.entities.CartItems;
import com.demo.entities.Product;
import com.demo.entities.User;

import com.demo.services.user.AccountService;
import com.demo.services.user.ProductServiceUser;

@Controller
@RequestMapping(value = {"user/cart"})
public class CartController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private ProductServiceUser productServiceUser;
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		return "user/cart/index";
	}
	
	@RequestMapping(value = {"add_cart" }, method = RequestMethod.GET)
	public String add_cart(HttpServletRequest request,ModelMap modelMap,HttpSession session, @RequestParam("id") int id) {		
		
		
		String idd = request.getParameter("id");
		int id1 = Integer.valueOf(idd);
		User users = (User) session.getAttribute("account");
		if(users != null) {
			User account = accountService.findById(users.getId());
			Product product = productServiceUser.findById(id1);
			 session = request.getSession();
			if(session.getAttribute("cart") == null) {
				List<CartItems> cart = new ArrayList<CartItems>();
				cart.add(new CartItems(product,account,1));
				session.setAttribute("cart", cart);
			}else {
				List<CartItems> cart = (List<CartItems>) session.getAttribute("cart");
				int index = exits(id1,cart);
				if(index == -1) {
					cart.add(new CartItems(product,account,1));
				}
				else {
					int newQuantity = cart.get(index).getQuantity() + 1;
					cart.get(index).setQuantity(newQuantity);
				}
				session.setAttribute("cart", cart);
			}
			
			return "redirect:/user/cart/index";
		}else {
			return "redirect:/user/account/login";
		}
		
	}
	
	private int exits(int id , List<CartItems> cart) {
		for(int i = 0; i< cart.size();i++) {
			if(cart.get(i).getProduct().getId().equals(id)) {
				return i;
			}
		}
		return -1;
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(ModelMap modelMap,HttpSession session,HttpServletRequest request) {
		session = request.getSession();
		List<CartItems> cart = (List<CartItems>) session.getAttribute("cart");
		String[] quantity = request.getParameterValues("quantity");
		for(int i =0; i< cart.size(); i++) {
			cart.get(i).setQuantity(Integer.parseInt(quantity[i]));
		}
		session.setAttribute("cart", cart);
		return "redirect:/user/cart/index";
	}
	
	@RequestMapping(value = "remove", method = RequestMethod.GET)
	public String remove(ModelMap modelMap,HttpSession session,HttpServletRequest request) {
		session = request.getSession();
		List<CartItems> cart = (List<CartItems>) session.getAttribute("cart");
		int index = Integer.parseInt(request.getParameter("index"));
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "redirect:/user/cart/index";
	}
	
	
}
