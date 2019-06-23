package com.fc.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.fc.model.Category;
import com.fc.model.Product;
import com.fc.model.User;
import com.fc.service.CategoryService;
import com.fc.service.ProductService;
import com.fc.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;
	private UserService userService;
	private CategoryService categoryService;
	private ProductService productService;
	private Map<String, Object> session;

	private List<Product> products;
	private User user;
	private Map<String, String> errorInfo;
	
	
	private String oldPassword;
	private String newPassword;

	// 显示主页内容
	public String showIndex() throws Exception {
		// 将所有分类放入session
		List<Category> categories;
		categories = categoryService.listAllCategories();
		if (!session.containsKey("categories")) {
			session.put("categories", categories);
		}

		// 返回最近出版的商品
		products = productService.listRecentProduct();
		System.out.println(products);
		return "showIndex";
	}

	// 登录
	public String login() throws Exception {
		errorInfo = new HashMap<String, String>();

		// 检查用户名是否存在
		User user1 = userService.checkUsername(user.getUsername());
		if (user1 == null) {
			errorInfo.put("usernameError", "用户名不存在！");
			return "login_input";
		}

		// 检查密码是否正确
		User user2 = userService.checkPassword(user.getUsername(),user.getPassword());
		if (user2 == null) {
			errorInfo.put("passwordError", "密码错误！");
			return "login_input";
		}

		// 把用户信息存入session
		session.put("user", user2);
		System.out.println(user2);
		return "login";
	}

	// 注册
	public String register() throws Exception {
		errorInfo = new HashMap<String, String>();

		// 检查用户名是否存在
		User user1 = userService.checkUsername(user.getUsername());
		if (user1 != null) {
			errorInfo.put("usernameError", "用户名已存在~");
			return "register_input";
		}
		
		//保存新用户信息
		userService.saveUser(user);
		System.out.println("注册成功~");
		return "register";
	}

	//注销
	public String logout() throws Exception {
		session.remove("user");
		return "logout";
	}

	//更新个人信息
	public String updateInfo() throws Exception {
		errorInfo = new HashMap<String, String>();
		User u = (User) session.get("user");
		user.setPassword(u.getPassword());
		System.out.println("session==="+u);
		System.out.println("action==="+user);
		if(!user.getUsername().equals(u.getUsername())) {
			User u2 = userService.checkUsername(user.getUsername());
			System.out.println("u2==="+u2);
			if(u2 != null) {
				errorInfo.put("usernameError", "用户名已存在~");
				return "updateInfoInput";
			}
		}
		userService.updateInfo(user);
		session.put("user",user);
		return "updateInfo";
	}
	

	//修改密码
	public String changePassword() throws Exception {
		System.out.println(oldPassword + "---" + newPassword);
		errorInfo = new HashMap<String, String>();
		User u = (User) session.get("user");
		// 检查旧密码是否正确
		User u2 = userService.checkPassword(u.getUsername(), oldPassword);
		if (u2 == null) {
			errorInfo.put("passwordError", "旧密码输入错误~");
			return "change_password_input";
		}
		
		//修改密码
		userService.changePassword(user.getUid(), newPassword);
		
		return "changePassword";
	}
	
	
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public CategoryService getCategoryService() {
		return categoryService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public void setSession(Map<String, Object> arg0) {

		session = arg0;

	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Map<String, String> getErrorInfo() {
		return errorInfo;
	}

	public void setErrorInfo(Map<String, String> errorInfo) {
		this.errorInfo = errorInfo;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	
	
	
}
