package com.fc.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.fc.model.User;

public class UserDao extends HibernateDaoSupport {

	@SuppressWarnings("unchecked")
	public User checkUsername(String username) {
		List<User> list = (List<User>) this.getHibernateTemplate().find("from User where username=?",username);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public User checkPassword(String username,String password) {
		List<User> list = (List<User>) this.getHibernateTemplate().find("from User where username=? and password=?",username,password);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public void saveUser(User user) {
		this.getHibernateTemplate().save(user);
	}

	public void updateInfo(User user) {
		this.getHibernateTemplate().update(user);
	}

	public void changePassword(Integer uid, String newPassword) {
		User user = this.getHibernateTemplate().get(User.class, uid);
		user.setPassword(newPassword);
		this.getHibernateTemplate().update(user);
	}

	@SuppressWarnings("unchecked")
	//查询用户数量
	public int listAllUserCount() {
		List<User> list = (List<User>) this.getHibernateTemplate().find("from User");
		return list.size();
	}
	//查询分页的用户数据
	public List<User> listAllUserByPage(int begin, int limit) {
		List<User> list = (List<User>) this.getHibernateTemplate().execute(new HibernateCallback<List<User>>() {
			@SuppressWarnings("unchecked")
			public List<User> doInHibernate(Session session) throws HibernateException {
				Query query = session.createQuery("from User");
				query.setFirstResult(begin);
				query.setMaxResults(limit);
				return (List<User>) query.list();
			}
			
		});
		return list;
	}

	@SuppressWarnings("unchecked")
	public User listOneUserByUid(int uid) {
		List<User> list = (List<User>) this.getHibernateTemplate().find("from User where uid=?", uid);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public void deleteUser(int uid) {
		User user = this.getHibernateTemplate().get(User.class, uid);
		this.getHibernateTemplate().delete(user);
	}

	@SuppressWarnings("unchecked")
	public User listOneUsrByUid(int uid) {
		List<User> list = (List<User>) this.getHibernateTemplate().find("from User where uid=?", uid);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	
}
