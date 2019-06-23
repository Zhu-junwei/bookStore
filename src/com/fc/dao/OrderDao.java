package com.fc.dao;

import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.fc.model.Order;
import com.fc.model.Product;

public class OrderDao extends HibernateDaoSupport {

	// 提交订单
	public void submitOrder(Order order) {
		this.getHibernateTemplate().save(order);
	}

	// 按uid列出所有订单
	@SuppressWarnings("unchecked")
	public List<Order> listAllOrderByUid(Integer uid) {
		return (List<Order>) this.getHibernateTemplate().find("from Order where uid=?", uid);
	}

	// 按oid列出一个订单
	public Order listOrderByOid(int oid) {
		return this.getHibernateTemplate().get(Order.class, oid);
	}

	// 支付订单
	public void payOrder(int oid) {
		Order order = this.getHibernateTemplate().get(Order.class, oid);
		order.setState(1);
		this.getHibernateTemplate().update(order);
	}

	// 列出已支付订单
	@SuppressWarnings("unchecked")
	public List<Order> listPayedOrder() {
		return (List<Order>) this.getHibernateTemplate().find("from Order where state in (1,2,3)");
	}

	// 列出完成交易的订单
	@SuppressWarnings("unchecked")
	public List<Order> listCompletedOrder() {
		return (List<Order>) this.getHibernateTemplate().find("from Order where state = 4");
	}

	//确认收货
	public void verifyReceiveGoods(int oid) {
		Order order = this.getHibernateTemplate().get(Order.class, oid);
		order.setState(4);
		this.getHibernateTemplate().update(order);
		
		
	}

	//发货
	public void deleverGoods(int oid) {
		Order order = this.getHibernateTemplate().get(Order.class, oid);
		order.setState(2);
		this.getHibernateTemplate().update(order);
		System.out.println("OrderDao===deleverGoods===" + order);
	}

	//通知收货
	public void informReceiveGoods(int oid) {
		Order order = this.getHibernateTemplate().get(Order.class, oid);
		order.setState(3);
		this.getHibernateTemplate().update(order);
		System.out.println("OrderDao===informReceiveGoods===" + order);
	}

	@SuppressWarnings("unchecked")
	public int completedOrderCount() {
		List<Order> list = (List<Order>) this.getHibernateTemplate().find("from Product where state=?",4);
		return list.size();
	}
}
