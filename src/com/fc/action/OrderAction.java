package com.fc.action;



import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.fc.model.Cart;
import com.fc.model.CartItem;
import com.fc.model.Order;
import com.fc.model.OrderItem;
import com.fc.model.User;
import com.fc.service.OrderService;
import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport implements SessionAware{

	
	private static final long serialVersionUID = 1L;
	private OrderService orderService;
	private Map<String, Object> session;
	
	
	private Order order;
	private List<Order> orders = new ArrayList<Order>();
	private int oid;
	
	
	//提交订单
	@SuppressWarnings("unchecked")
	public String submitOrder() throws Exception {
		
		Order o = new Order();
		Cart cart = (Cart) session.get("cart");
		User u =(User) session.get("user");
		System.out.println("OrderAction==="+cart);
		if(cart.getMap().size() > 0) {
			o.setTotal(cart.getTotal());
			o.setTime(new Date());
			o.setState(0);//未付款
			o.setUser(u);
			o.setRealname(u.getRealname());
			o.setPhone(u.getPhone());
			o.setAddress(u.getAddress());
			o.setZipcode(u.getZipcode());

			//遍历购物车，将其信息存入订单
			for(CartItem cartItem : cart.getMap().values()){
				OrderItem orderItem = new OrderItem();
				orderItem.setSubTotal(cartItem.getSubTotal());
				orderItem.setCount(cartItem.getCount());
				orderItem.setProduct(cartItem.getProduct());
				
				//绑定订单项和订单
				orderItem.setOrder(o);
				o.getOrderItems().add(orderItem);
			}
		}
		
		//清空购物车
		cart.clearCart();
		order = o;
		orderService.submitOrder(order);
		return "submitOrder";
	}

	
	//按uid查看所有订单
	public String listAllOrderByUid() throws Exception {
		
		User user = (User) session.get("user");
		System.out.println("OrderAction==" + user);
		orders = orderService.listAllOrderByUid(user.getUid());
		System.out.println(orders);
		return "listAllOrderByUid";
	}
	
	
	//去支付订单的页面
	public String toPayOrder() throws Exception {
		order = orderService.listOrderByOid(oid);
		return "toPayOrder";
	}
	
	
	//支付订单
	public String payOrder() throws Exception {
		orderService.payOrder(oid);
		return "payOrder";
	}
	
	
	
	//确认收货
	public String verifyReceiveGoods() throws Exception {
		orderService.verifyReceiveGoods(oid);
		return "verifyReceiveGoods";
	}
	
	
	
	
	
	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}


	public Order getOrder() {
		return order;
	}


	public void setOrder(Order order) {
		this.order = order;
	}


	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}


	public List<Order> getOrders() {
		return orders;
	}


	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}


	public int getOid() {
		return oid;
	}


	public void setOid(int oid) {
		this.oid = oid;
	}
	

	
	
}