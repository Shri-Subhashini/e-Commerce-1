package com.beans;

public class Customer {
	int CustomerId;
	String Membership;
	String CustomerName;
	String CustomerPhone;
	String CustomerMail;
	String CustomerPassword;
	String question1;
	String question2;
	String question3;
	String question4;
	String question5;
	

	
	
	public int getCustomerId() {
		return CustomerId;
	}
	public void setCustomerId(int customerId) {
		CustomerId = customerId;
	}
	public String getCustomerName() {
		return CustomerName;
	}
	public void setCustomerName(String customerName) {
		CustomerName = customerName;
	}
	public String getCustomerPhone() {
		return CustomerPhone;
	}
	public void setCustomerPhone(String customerPhone) {
		CustomerPhone = customerPhone;
	}
	public String getCustomerMail() {
		return CustomerMail;
	}
	public void setCustomerMail(String customerMail) {
		CustomerMail = customerMail;
	}
	public String getCustomerPassword() {
		return CustomerPassword;
	}
	public void setCustomerPassword(String customerPassword) {
		CustomerPassword = customerPassword;
	}
	public String getQuestion1() {
		return question1;
	}
	public void setQuestion1(String question1) {
		this.question1 = question1;
	}
	public String getQuestion2() {
		return question2;
	}
	public void setQuestion2(String question2) {
		this.question2 = question2;
	}
	public String getQuestion3() {
		return question3;
	}
	public void setQuestion3(String question3) {
		this.question3 = question3;
	}
	public String getQuestion4() {
		return question4;
	}
	public void setQuestion4(String question4) {
		this.question4 = question4;
	}
	public String getQuestion5() {
		return question5;
	}
	public void setQuestion5(String question5) {
		this.question5 = question5;
	}
	public String getMembership() {
		return Membership;
	}
	public void setMembership(String membership) {
		this.Membership = membership;
	}
	public Customer() {
	}
	public Customer(int customerId, String customerName, String customerPhone, String customerMail,
			String customerPassword, String question1, String question2, String question3, String question4,
			String question5,String membership) {
		super();
		CustomerId = customerId;
		CustomerName = customerName;
		CustomerPhone = customerPhone;
		CustomerMail = customerMail;
		CustomerPassword = customerPassword;
		Membership=membership;
		this.question1 = question1;
		this.question2 = question2;
		this.question3 = question3;
		this.question4 = question4;
		this.question5 = question5;
	
	}
	public Customer(int customerId, String customerName, String customerPhone, String customerMail,
			String customerPassword) {
		super();
		CustomerId = customerId;
		CustomerName = customerName;
		CustomerPhone = customerPhone;
		CustomerMail = customerMail;
		CustomerPassword = customerPassword;
	}
	
	
}
