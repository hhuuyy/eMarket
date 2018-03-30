package eMarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import eMarket.component.ShoppingCart;

@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	ShoppingCart cart;
	
	@RequestMapping("view")
	public String view(ModelMap model) {
		model.addAttribute("cart", cart);
		return "user/cart/view";
	}
	
	@RequestMapping("clear")
	public String clear(ModelMap model) {
		model.addAttribute("cart", cart);
		cart.clear();
		return "user/cart/view";
	}
	
	@ResponseBody
	@RequestMapping("update")
	public String update(@RequestParam("id") Integer id, 
			@RequestParam("qty") Integer qty) {
		cart.update(id, qty);
		String json = String.format("{\"count\":%d, \"amount\":%.2f}", 
				cart.getCount(), cart.getAmount());
		return json;
	}
	
	@ResponseBody
	@RequestMapping("add")
	public String add(@RequestParam("id") Integer id) {
		cart.add(id);
		String json = String.format("{\"count\":\"%d\",\"amount\":\"%.2f\"}", 
				cart.getCount(), cart.getAmount());
		return json;
	}
	
	@ResponseBody
	@RequestMapping("remove")
	public String remove(@RequestParam("id") Integer id) {
		cart.remove(id);
		String json = String.format("{\"count\":%d, \"amount\":%.2f}", 
				cart.getCount(), cart.getAmount());
		return json;
	}
}
