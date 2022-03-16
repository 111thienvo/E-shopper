package com.demo.controllers.user;

import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.entities.User;
import com.demo.helpers.UploadHelper;
import com.demo.models.UserAjax;
import com.demo.services.user.AccountServiceUser;

@RestController
@RequestMapping(value = {"user/ajax"})
public class AccountAjaxController implements ServletContextAware{

	@Autowired
	private AccountServiceUser accountServiceUser;
	
	private ServletContext servletContext;
	
//	@RequestMapping(value = "edit", method = RequestMethod.PUT, consumes = MimeTypeUtils.APPLICATION_JSON_VALUE, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
//	public ResponseEntity<String> edit() {
//		try {
//			User getvalue = accountServiceUser.findByUsername("admin11");
//			User user = new User();
//			user.setId(getvalue.getId());
//			user.setUsername(getvalue.getUsername());
//			String pass = "123";
//			String hash = new BCryptPasswordEncoder().encode(pass);
//			user.setPassword(hash);
//			user.setFirstName(getvalue.getFirstName());
//			user.setLastName(getvalue.getLastName());
//			user.setEmail(getvalue.getEmail());
//			user.setAddress(getvalue.getAddress());
//			user.setPhone(getvalue.getPhone());
//			user.setEnabled(getvalue.isEnabled());
//			user.setVerificationCode(getvalue.getVerificationCode());
//			user.setResetPasswordToken(getvalue.getResetPasswordToken());			
//			user.setPhoto(getvalue.getPhoto());			
//			user.setCreatedAt(getvalue.getCreatedAt());
//			user.setModifiedAt(getvalue.getModifiedAt());
//			user.setDob(getvalue.getDob());
//			accountServiceUser.update(user);
//			return new ResponseEntity<String>("Success",HttpStatus.OK);
//		} catch (Exception e) {
//			System.err.println(e.getMessage());
//			return new ResponseEntity<String>("Fail",HttpStatus.BAD_REQUEST);
//		}
//
//	}
	@PostMapping("/upload") 
	  public ResponseEntity<?> handleFileUpload(ModelMap modelMap, HttpSession session, @RequestParam(value = "file") MultipartFile file,
				RedirectAttributes redirectAttributes ) {

	  
	    try {
			User user = (User) session.getAttribute("account");
			String fileNameUpload = UploadHelper.upload(servletContext, file);
			if (fileNameUpload != null) {
				redirectAttributes.addFlashAttribute("fileName", fileNameUpload);
				user.setPhoto(fileNameUpload);
			}
			System.out.println(fileNameUpload);
			accountServiceUser.update(user);
	    } catch (Exception e) {
	      return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    } 
	    return ResponseEntity.ok("File uploaded successfully.");
	  }
	
	@RequestMapping(value = {"findaccountbyid"}, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public UserAjax findAccountById(@RequestParam("id") int id) {
		System.out.println(id);
		return accountServiceUser.findByIdAjax(id);
		
	}
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}
