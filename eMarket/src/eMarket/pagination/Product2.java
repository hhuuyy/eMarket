package eMarket.pagination;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import eMarket.controller.DBConnect;
import eMarket.entity.Category;
import eMarket.entity.Product;
import eMarket.entity.Supplier;

public class Product2 implements Product1{

	@Override
	public List<Product> getList(Integer id){
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * FROM Product where categoryId =" + id;
		ArrayList<Product> arr = new ArrayList();
		try{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Product p = new Product();
				p.setId(rs.getInt("Id"));
				p.setName(rs.getString("Name"));
				p.setUnitBrief(rs.getString("UnitBrief"));
				p.setUnitPrice(rs.getDouble("UnitPrice"));
				p.setImage(rs.getString("Image"));
				p.setProductDate(rs.getDate("ProductDate"));
				p.setAvailable(rs.getBoolean("Available"));
				p.setDescription(rs.getString("Description"));
//				Category c = new Category(rs.getInt("CategoryId"), "", "");
//				p.setCategory(c);
//				Supplier s = new Supplier(rs.getString("SupplierId"),"","","","");
//				p.setSupplier(s);
				p.setQuantity(rs.getInt("Quantity"));
				p.setDiscount(rs.getDouble("Discount"));
				p.setSpecial(rs.getBoolean("Special"));
				p.setLatest(rs.getBoolean("Latest"));
				p.setViews(rs.getInt("Views"));
				arr.add(p);
			}
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return arr;
	}

	@Override
	public List<Product> getListByPage(List<Product> arr, int start, int end) {
		List<Product> list = new ArrayList<>();
		for(int i = start; i< end; i++){
			list.add(arr.get(i));
		}
		return list;
	}
}
























