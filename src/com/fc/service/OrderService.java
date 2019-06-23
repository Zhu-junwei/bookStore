package com.fc.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.fc.dao.OrderDao;
import com.fc.model.Order;

@Transactional
public class OrderService {

	private OrderDao orderDao;

	
	//提交订单
	public void submitOrder(Order order) {
		orderDao.submitOrder(order);
		
	}
	
	//按uid列出所有订单
	public List<Order> listAllOrderByUid(Integer uid) {
		return orderDao.listAllOrderByUid(uid);
	}
	
	//按oid列出一个订单
	public Order listOrderByOid(int oid) {
		return orderDao.listOrderByOid(oid);
	}


	//支付订单
	public void payOrder(int oid) {
		orderDao.payOrder(oid);
	}


	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	// 列出已支付的订单
	public List<Order> listPayedOrder() {
		return orderDao.listPayedOrder();
	}
	
	// 列出完成交易的订单
	public List<Order> listCompletedOrder() {
		return orderDao.listCompletedOrder();
	}

	public void verifyReceiveGoods(int oid) {
		orderDao.verifyReceiveGoods(oid);
	}

	//发货
	public void deleverGoods(int oid) {
		orderDao.deleverGoods(oid);
	}

	public void informReceiveGoods(int oid) {
		orderDao.informReceiveGoods(oid);
	}

}
