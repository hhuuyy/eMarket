package eMarket.pagination;

import java.util.List;

import eMarket.entity.Product;

public interface Product1 {
	
	public List<Product> getList(Integer id);
	
	public List<Product> getListByPage(List<Product> arr, int start, int end);
	
}
