package com.demo.controllers.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.demo.entities.Category;
import com.demo.entities.Discount;
import com.demo.entities.Product;

import com.demo.helpers.UploadHelper;
import com.demo.services.admin.AccountServiceAdmin;
import com.demo.services.admin.DiscountServiceAdmin;
import com.demo.services.admin.ProductServiceAdmin;
import com.demo.services.user.AccountServiceUser;
import com.demo.services.user.CategoryServiceUser;
import com.demo.services.user.ProductServiceUser;



@Controller
@RequestMapping(value = { "admin/manage_product" })
public class ManageProductController implements ServletContextAware{

	@Autowired
	private AccountServiceAdmin accountServiceAdmin; 
	
	@Autowired
	private ProductServiceAdmin productServiceAdmin; 
	

	
	@Autowired
	private DiscountServiceAdmin discountServiceAdmin; 
	
	@Autowired
	private CategoryServiceUser categoryServiceUser; 
	
	private ServletContext servletContext;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("products", productServiceAdmin.getAllProduct());
		
		
		return "admin/manage_product/index";
	}

	@RequestMapping(value = { "delete" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> delete(@RequestParam("id") int idProduct) {
		try {		
			 productServiceAdmin.delete(idProduct);
			 boolean result = true;
			return new ResponseEntity<Boolean>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = {"add" }, method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		Product product = new Product();
		modelMap.put("product", product);
		modelMap.put("categories", categoryServiceUser.findAll());
		modelMap.put("discounts", discountServiceAdmin.findAll());
		return "admin/manage_product/add";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("product") Product product, @RequestParam("photo1") MultipartFile photo1) {
		
		Category category = new Category();
		Discount discount = new Discount();
		product.setName(product.getName());
		product.setSku(product.getSku());
		product.setPrice(product.getPrice());
		product.setQuantity(product.getQuantity());
		product.setDescription(product.getDescription());
		category.setId(product.getCategory().getId());
		product.setCategory(category);
		discount.setId(product.getDiscount().getId());
		product.setDiscount(discount);
		String fileNameUpload = UploadHelper.upload(servletContext, photo1);
		product.setPhoto(fileNameUpload);
		product.setCreatedAt(new Date());
		product.setModifiedAt(new Date());
		productServiceAdmin.add(product);
		return "redirect:/admin/playlist/index";
	
}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}
