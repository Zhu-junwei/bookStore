package com.fc.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.fc.dao.ProductDao;
import com.fc.model.Product;
import com.fc.util.Page;

@Transactional
public class ProductService {
	
	private ProductDao productDao;

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	
	
	//累出最近出版的20条商品
	public List<Product> listRecentProduct(){
		return productDao.listRecentProduct();
	}
	
	
	
	//通过页码和cid列出所有商品
	public Page<Product> listAllProductByPageAndCid(int p, int cid){
		Page<Product> page = new Page<Product>();
		// 设置每页显示记录数:
		int limit = 8;
		page.setPerPageCount(limit);
		// 设置总记录数
		int totalCount = 0;
		totalCount = productDao.listAllProductByCidCount(cid);
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
		List<Product> list = productDao.listAllProductByPage(begin, limit, cid);
		page.setList(list);
		return page;
	}

	
	//按pid列出某个商品详细信息
	public Product listOneProductByPid(int pid) {
		return productDao.listOneProductByPid(pid);
	}

	
	//按页码和商品名列出所有商品
	public Page<Product> listAllProductByPageAndPname(int p, String pname) {
		Page<Product> page = new Page<Product>();
		// 设置每页显示记录数:
		int limit = 8;
		page.setPerPageCount(limit);
		// 设置总记录数
		int totalCount = 0;
		totalCount = productDao.listAllProductByPnameCount(pname);
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
		List<Product> list = productDao.listAllProductByPageAndPname(begin,limit,pname);
		page.setList(list);
		return page;
	}

	public Page<Product> listAllProductByPage(int p) {
		Page<Product> page = new Page<Product>();
		// 设置每页显示记录数:
		int limit = 8;
		page.setPerPageCount(limit);
		// 设置总记录数
		int totalCount = 0;
		totalCount = productDao.listAllProductCount();
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
		List<Product> list = productDao.listAllProductByPage(begin,limit);
		page.setList(list);
		return page;
	}

	public void saveProduct(Product product) {
		productDao.saveProduct(product);
	}

	public void deleteProduct(int pid) {
		productDao.deleteProduct(pid);
	}

	public void updateProduct(Product product) {
		productDao.updateProduct(product);
	}
	
}
