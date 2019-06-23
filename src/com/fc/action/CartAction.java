package com.fc.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.fc.model.Cart;
import com.fc.model.CartItem;
import com.fc.model.User;
import com.fc.service.ProductService;
import com.opensymphony.xwork2.ActionSupport;

public class CartAction extends ActionSupport implements SessionAware {

	
	private static final long serialVersionUID = 1L;
	private ProductService productService;
	private Map<String, Object> session;
	private Map<String,String> errorInfo = new HashMap<String,String>();;
	
	
	//获得商品的pid
	private int pid;
	//获得购买数量
	private int count;
	
	
	//添加一个购物车条目
	public String addCartItem() throws Exception {
		
		//先判断是否登录
		User user = (User) session.get("user");
		if(user == null) {
			errorInfo.put("usernameError", "您还没有登录,请先登录！");
			return "login_input";
		}
		
		
		CartItem cartItem = new CartItem();
		
		//设置商品数量
		cartItem.setCount(count);
		//设置商品
		cartItem.setProduct(productService.listOneProductByPid(pid));
		
		Cart cart = (Cart) session.get("cart");
		if(cart != null) {
			cart.addCartItem(cartItem);
		} else{
			cart = new Cart();
			cart.addCartItem(cartItem);
			session.put("cart", cart);
		}
		System.out.println((Cart) session.get("cart"));
		return "addCartItem";
	}
	
	
	//移除一个购物车条目
	public String removeCartItem() throws Exception {
		//从session获得cart
		Cart cart = (Cart) session.get("cart");
		//根据传来的pid移除一个条目
		cart.removeCartItem(pid);
		
		return "removeCartItem";
	}
	
	
	
	//清空购物车
	public String clearCart() throws Exception{
		//从session获得cart
		Cart cart = (Cart) session.get("cart");
		cart.clearCart();
		return "clearCart";
	}
	
	
	
	
	
	
	
	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}




	public void setSession(Map<String, Object> arg0) {
		session = arg0;
		
	}


	public Map<String, String> getErrorInfo() {
		return errorInfo;
	}


	public void setErrorInfo(Map<String, String> errorInfo) {
		this.errorInfo = errorInfo;
	}
	
	
}
