package com.fc.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.fc.dao.UserDao;
import com.fc.model.User;
import com.fc.util.Page;


@Transactional
public class UserService {


	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public User checkUsername(String username) {
		return userDao.checkUsername(username);
	}

	public User checkPassword(String username,String password) {
		return userDao.checkPassword(username,password);
	}

	public void saveUser(User user) {
		userDao.saveUser(user);
		
	}

	public void updateInfo(User user) {
		userDao.updateInfo(user);
	}

	public void changePassword(Integer uid, String newPassword) {
		userDao.changePassword(uid, newPassword);
	}

	public Page<User> listAllUserByPage(int p) {
		Page<User> page = new Page<>();
		// 设置每页显示记录数:
		int limit = 8;
		page.setPerPageCount(limit);
		// 设置总记录数
		int totalCount = 0;
		System.out.println(totalCount);
		totalCount = userDao.listAllUserCount();
		page.setTotalCount(totalCount);
		
		// 设置当前页数
		page.setCurrentPage(p);
		// 设置总页数
		int totalPage = 0;
		if(totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else{
			totalPage = totalCount / limit + 1;
		}
		page.setTotalPage(totalPage);
		
		// 从哪开始
		int begin = (p - 1) * limit;
		List<User> list = userDao.listAllUserByPage(begin,limit);
		page.setList(list);
		return page;
	}

	public void deleteUser(int uid) {
		userDao.deleteUser(uid);
	}


	public User listOneUserByUid(int uid) {
		return userDao.listOneUsrByUid(uid);
	}

	
	
}
