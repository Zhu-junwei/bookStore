package com.fc.dao;

import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.fc.model.Admin;

public class AdminDao extends HibernateDaoSupport {

	/**
	 * 根据用户名和密码查询管理员，实现登录
	 * @param admin
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public boolean login(Admin admin) {
		List<Admin> list = (List<Admin>) this.getHibernateTemplate().find("from Admin where username=? and password=?", admin.getUsername(),admin.getPassword());
		
		return list.size() > 0;
	}

	
}
