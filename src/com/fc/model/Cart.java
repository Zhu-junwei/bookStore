package com.fc.model;

import java.util.LinkedHashMap;
import java.util.Map;


public class Cart implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	//键是商品id，值为一个购物车条目
	private Map<Integer,CartItem> map = new LinkedHashMap<Integer, CartItem>();

	//所有条目总价
	private double total;

	
	//添加一个购物车条目
	public void addCartItem(CartItem cartItem) {
		//得到商品的pid
		int pid = cartItem.getProduct().getPid();
		//如果购物车中原来有该商品，则增加商品数量，小计会自动更新
		if(map.containsKey(pid)) {
			CartItem oldCartItem = map.get(pid);
			oldCartItem.setCount(oldCartItem.getCount() + cartItem.getCount());
		}else{
			map.put(pid, cartItem);
		}
		
		//更新总价的值
		total += cartItem.getSubTotal();
	}
	
	
	//移出一个购物车条目
	public void removeCartItem(int pid) {
		CartItem cartItem = map.remove(pid);
		total -= cartItem.getSubTotal();
	}
	
	
	//清空购物车
	public void clearCart() {
		//清空所有条目
		map.clear();
		
		//将总价计0
		total = 0;
	}
	
	
	public Map<Integer, CartItem> getMap() {
		return map;
	}

	public void setMap(Map<Integer, CartItem> map) {
		this.map = map;
	}

	public double getTotal() {
		return Double.valueOf(new java.text.DecimalFormat("#.0").format(this.total));
	}

	public void setTotal(double total) {
		this.total = total;
	}


	@Override
	public String toString() {
		return "Cart [map=" + map + ", total=" + total + "]";
	}


	
	
	
}
