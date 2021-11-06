package com.beans;

public class Cart {
	int id;
	String customerMail;
	String name;
	String category;
	int price;

	public String getCustomerMail() {
		return customerMail;
	}

	public void setCustomerMail(String customerMail) {
		this.customerMail = customerMail;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Cart(String customerMail, String name, String category, int price) {
		super();
		this.customerMail = customerMail;
		this.name = name;
		this.category = category;
		this.price = price;
	}

	public Cart(int id, String customerMail, String name, String category, int price) {
		super();
		this.id = id;
		this.customerMail = customerMail;
		this.name = name;
		this.category = category;
		this.price = price;
	}

	public Cart() {
		super();
	}

}
