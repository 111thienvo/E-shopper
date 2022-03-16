package com.demo.controllers.user;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.entities.User;
import com.demo.helpers.UploadHelper;

import com.demo.services.user.AccountService;

@Controller
@RequestMapping(value = { "user/profile" })
public class ProfileController implements ServletContextAware {

	@Autowired
	private AccountService accountService;

	private ServletContext servletContext;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpSession session /* @RequestParam("accountId") int id */) {

		int id = (int) session.getAttribute("accountId");
		// Page Profile
		User accountProfile = accountService.findById(id);
		modelMap.put("accountProfile", accountProfile);
		return "user/profile/index";
	}

	@RequestMapping(value = "changeImage", method = RequestMethod.POST)
	public String changeImage(ModelMap modelMap, HttpSession session, @RequestParam(value = "file") MultipartFile file,
			RedirectAttributes redirectAttributes) {
		User user = (User) session.getAttribute("account");
		String fileNameUpload = UploadHelper.upload(servletContext, file);
		if (fileNameUpload != null) {
			redirectAttributes.addFlashAttribute("fileName", fileNameUpload);
			user.setPhoto(fileNameUpload);
		}
//		System.out.println(fileNameUpload);
		accountService.update(user);
		return "redirect:/user/profile/index";
	}

	@RequestMapping(value = "editProfile", method = RequestMethod.POST)
	public String editProfile(ModelMap modelMap, HttpSession session, @ModelAttribute("accountProfile") User user) {
		try {
			User users = (User) session.getAttribute("account");
			User accountNew = accountService.findById(users.getId());
			System.err.println(accountNew.getDob());
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String dob = simpleDateFormat.format(user.getDob());
			Date dob2 = simpleDateFormat.parse(dob);
			accountNew.setFirstName(user.getFirstName());
			accountNew.setLastName(user.getLastName());
			accountNew.setEmail(user.getEmail());
			accountNew.setAddress(user.getAddress());
			accountNew.setPhone(user.getPhone());
			accountNew.setDob(dob2);
			accountNew.setModifiedAt(new Date());
			accountService.update(accountNew);
			return "redirect:/user/profile/index";
		} catch (Exception e) {
			return "redirect:/user/home/404";
		}

	}

	@RequestMapping(value = "changepass", method = RequestMethod.POST)
	public String editPassword(ModelMap modelMap, HttpSession httpSession,
			@RequestParam("oldPassword") String oldPassword, @RequestParam("newPassword") String newPassword,
			@RequestParam("confirmPassword") String confirmPassword) {

		User account = (User) httpSession.getAttribute("account");
		if (oldPassword != null) {

			boolean valuate = BCrypt.checkpw(oldPassword, account.getPassword());
			if (valuate) {
				boolean valuate2 = BCrypt.checkpw(newPassword, account.getPassword());
				System.err.println(valuate2);
				if (!valuate2) {
					if (newPassword.equalsIgnoreCase(confirmPassword)) {
						String hash = BCrypt.hashpw(newPassword, BCrypt.gensalt(4));
						account.setPassword(hash);
						accountService.update(account);
						modelMap.put("msg1", "<script>alert('Change password successfully')</script>");
						System.out.println("Cap nhat thanh cong " + hash);
						// return "redirect:/user/profile/index?accountId=" + account.getAccountId();
					} else {
						modelMap.put("msg1", "<script>alert('Confirm Password is wrong!!!')</script>");
						System.out.println("Nhap lai mat khau khong chinh xac");
						// return "redirect:/user/profile/index?accountId=" + account.getAccountId();
					}
				}else {
					modelMap.put("msg1", "<script>alert('Must not be the same as the old password!!!')</script>");
					System.out.println("Mat khau hien tai khong duoc giong voi mat khau cu");
				}
			} else {
				modelMap.put("msg1", "<script>alert('Current Password is wrong!!!')</script>");
				System.out.println("Mat khau hien tai khong dung");
				// return "redirect:/user/profile/index?accountId=" + account.getAccountId();
			}
			User accountt = new User();
			modelMap.put("account", accountt);

			// Page Profile
			User accountProfile = accountService.findById(account.getId());
			modelMap.put("accountProfile", accountProfile);
			return "user/profile/index";
		} else {
			modelMap.put("msg1", "Please enter!!");
			return "user/profile/index";
		}
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}
