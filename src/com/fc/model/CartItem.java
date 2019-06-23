package com.fc.model;

public class CartItem implements java.io.Serializable {

	
	private static final long serialVersionUID = 1L;
	private Product product;		//商品信息
	private int count;				//商品个数
	private double subTotal;		//条目小计
	
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	//小计根据商品数量计算
	public double getSubTotal() {
		return Double.valueOf(new java.text.DecimalFormat("#.0").format(product.getPrice() * count));
	}
	
	public void setSubTotal(int subTotal) {
		this.subTotal = subTotal;
	}
	@Override
	public String toString() {
		return "CartItem [product=" + product + ", count=" + count
				+ ", subTotal=" + subTotal + "]";
	}
	
	
}
