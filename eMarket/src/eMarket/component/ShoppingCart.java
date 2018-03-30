package eMarket.component;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import eMarket.entity.Product;

@Transactional
@Component("cart")
@Scope(value="session", proxyMode=ScopedProxyMode.TARGET_CLASS)
public class ShoppingCart {
	@Autowired
	SessionFactory factory;
	
	List<Product> items = new ArrayList<Product>();

	public List<Product> getItems() {
		return items;
	}
	public void setItems(List<Product> items) {
		this.items = items;
	}
	
	public int getCount() {
		int count = 0;
		for(Product p:items){
			count += p.getQuantity();
		}
		return count;
	}
	
	public double getAmount() {
		double amount = 0;
		for(Product p:items){
			amount += p.getQuantity() *p.getUnitPrice()*(1-p.getDiscount());
		}
		return amount;
	}

	public void add(int id){
		for(Product p:items){
			if(p.getId() == id){
				p.setQuantity(p.getQuantity() + 1);
				return;
			}
		}
		// Chưa có trong giỏ hàng => lấy từ CSDL bỏ vào giỏ
		Session session = factory.getCurrentSession();
		Product p = (Product) session.get(Product.class, id);
		p.setQuantity(1);
		items.add(p);
	}
	
	public void remove(int id){
		for(Product p:items){
			if(p.getId() == id){
				items.remove(p);
				return;
			}
		}
	}
	
	public void update(int id, int newqty){
		for(Product p:items){
			if(p.getId() == id){
				p.setQuantity(newqty);
				return;
			}
		}
	}
	
	public void clear(){
		items.clear();
	}
}
