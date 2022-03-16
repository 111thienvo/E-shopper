package com.demo.controllers.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Product;
import com.demo.services.admin.AccountServiceAdmin;
import com.demo.services.admin.ProductServiceAdmin;
import com.demo.services.user.AccountServiceUser;



@Controller
@RequestMapping(value = { "admin/home" })
public class HomeAdminController {

	@Autowired
	private AccountServiceAdmin accountServiceAdmin; 
	
	@Autowired
	private ProductServiceAdmin productServiceAdmin; 
	
	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("countUser", accountServiceAdmin.getCountUser(2));
		modelMap.put("countProduct", productServiceAdmin.getCountProduct());
		List<Product> newProduct = productServiceAdmin.getNewPrododuct(3);
		
		modelMap.put("newProduct", newProduct);
		
		return "admin/home/index";
	}

	@RequestMapping(value = { "404" }, method = RequestMethod.GET)
	public String notfound() {
		return "404/index";
	}

	/*
	 * @RequestMapping(value = { "load-top5_OrderProduct-data" }, method =
	 * RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE) public
	 * ResponseEntity<List<TrackInfo>> loadTracksData() { try { List<TrackInfo>
	 * trackInfos = new ArrayList<TrackInfo>(); for (Track track :
	 * trackService.getTopAll(10)) { TrackInfo trackInfo = new TrackInfo();
	 * trackInfo.setId(track.getId()); trackInfo.setTitle(track.getTitle());
	 * trackInfo.setListens(track.getListens()); trackInfos.add(trackInfo); }
	 * 
	 * return new ResponseEntity<List<TrackInfo>>(trackInfos, HttpStatus.OK); }
	 * catch (Exception e) { return new
	 * ResponseEntity<List<TrackInfo>>(HttpStatus.BAD_REQUEST); } }
	 */
}
