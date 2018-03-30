package eMarket.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.google.gson.annotations.SerializedName;

@Entity
@Table(name="Customers")
public class Customer {
	@Id
	String id;
	String password;
	String fullname;
	String email;
	String photo;
	Boolean activated;
//	String username;
//	@SerializedName(value = "id")
//	String facebookID;
//	String facebookLink;		

	@OneToMany(mappedBy="customer")
	Collection<Order> orders;
	
//	public String getUsername() {
//		return username;
//	}
//
//	public void setUsername(String username) {
//		this.username = username;
//	}
//
//	public String getFacebookID() {
//		return facebookID;
//	}
//
//	public void setFacebookID(String facebookID) {
//		this.facebookID = facebookID;
//	}
//
//	public String getFacebookLink() {
//		return facebookLink;
//	}
//
//	public void setFacebookLink(String facebookLink) {
//		this.facebookLink = facebookLink;
//	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Boolean getActivated() {
		return activated;
	}

	public void setActivated(Boolean activated) {
		this.activated = activated;
	}

	public Collection<Order> getOrders() {
		return orders;
	}

	public void setOrders(Collection<Order> orders) {
		this.orders = orders;
	}
	
}
