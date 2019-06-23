package com.fc.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */

public class Order implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	// Fields

	private Integer oid;
	
	private User user;
	private Double total;
	private Date time;
	private Integer state;//0：未支付；1：已支付；2：已发货；3：确认收货；4：已收货
	
	private String realname;
	private String phone;
	private String address;
	private String zipcode;
	
	private Set orderItems = new HashSet(0);

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public Set getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(Set orderItems) {
		this.orderItems = orderItems;
	}

	@Override
	public String toString() {
		return "Order [oid=" + oid + ", user=" + user + ", total=" + total
				+ ", time=" + time + ", state=" + state + ", realname="
				+ realname + ", phone=" + phone + ", address=" + address
				+ ", zipcode=" + zipcode + ", orderItems=" + orderItems + "]";
	}


	
}