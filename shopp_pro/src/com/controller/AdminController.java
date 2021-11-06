package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.beans.Cart;
import com.beans.Crypto;
import com.beans.Customer;
import com.beans.Product;
import com.model.DataBase;

public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<Product> list = new ArrayList<>();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page");
		if (page.equals("admin-login-form")) {
			String usernam = request.getParameter("adminId");
			String password = request.getParameter("adminPassword");
			HttpSession session = request.getSession();
			session.setAttribute("username", usernam);

			if (usernam.equals("admin") && password.equals("admin@123")) {
				request.getRequestDispatcher("adminindex.jsp").forward(request, response);

			} else {
				request.setAttribute("msg", "Invalid Crediantials");
				request.getRequestDispatcher("adminlogin.jsp").forward(request, response);

			}
		}
		if (page.equals("admin-login-out")) {
			HttpSession session = request.getSession();
			session.invalidate();
			request.getRequestDispatcher("adminlogin.jsp").forward(request, response);
		}
		if (page.equals("sign-up-form")) {
			DataBase db = new DataBase();
			String name = request.getParameter("customerName");
			String phone = request.getParameter("customerPhone");
			String mail = request.getParameter("customerMail");
			String password = request.getParameter("customerPassword");

			int status = 0;
			try {
				status = db.allCustomer1(mail, phone);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (0 == status) {
				Customer customer = new Customer();
				customer.setCustomerName(name);
				customer.setCustomerPhone(phone);
				customer.setCustomerMail(mail);
				customer.setCustomerPassword(password);
				try {
					db.addUser(customer);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.getRequestDispatcher("securityquestions.jsp").forward(request, response);

			} else if (1 == status) {
				request.setAttribute("msg", "User already exits.Try with different mobile number");
				request.getRequestDispatcher("customersignup.jsp").forward(request, response);
			}
		}
		if (page.equals("signin-form")) {

			DataBase db = new DataBase();
			String userId = request.getParameter("customerId");
			String password = request.getParameter("customerPassword");
			password = Crypto.encode(password);
			HttpSession session = request.getSession();
			session.setAttribute("username", userId);
			session.setAttribute("pass", password);

			int status = 0;
			try {
				status = db.allCustomer(userId, password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (2 == status) {
				request.setAttribute("member", "MEMBER");
				session.setAttribute("member", "MEMBER");
				request.getRequestDispatcher("home1.jsp").forward(request, response);
			}
			if (1 == status) {
				request.setAttribute("member", "GET MEMBERSHIP");
				session.setAttribute("member", "GET MEMBERSHIP");
				request.getRequestDispatcher("home1.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "Invalid Credentials");
				request.setAttribute("username", userId);
				request.getRequestDispatcher("customersignin.jsp").forward(request, response);

			}

		}

		if (page.equals("securityquestions-form")) {
			DataBase db = new DataBase();
			String mail = request.getParameter("customerMail");
			String q1 = request.getParameter("question1");
			String q2 = request.getParameter("question2");
			String q3 = request.getParameter("question3");
			String q4 = request.getParameter("question4");
			String q5 = request.getParameter("question5");
			Customer customer = new Customer();
			customer.setCustomerMail(mail);
			customer.setQuestion1(q1);
			customer.setQuestion2(q2);
			customer.setQuestion3(q3);
			customer.setQuestion4(q4);
			customer.setQuestion5(q5);
			try {
				db.updateUser(customer);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("customersignin.jsp").forward(request, response);

		}

		if (page.equals("forgotpassword-form")) {
			DataBase db = new DataBase();
			String mail = request.getParameter("customerMail");
			String q1 = request.getParameter("question1");
			String q2 = request.getParameter("question2");
			String q3 = request.getParameter("question3");
			String q4 = request.getParameter("question4");
			String q5 = request.getParameter("question5");
			Customer customer = new Customer();
			customer.setCustomerMail(mail);
			customer.setQuestion1(q1);
			customer.setQuestion2(q2);
			customer.setQuestion3(q3);
			customer.setQuestion4(q4);
			customer.setQuestion5(q5);
			int status = 0;
			try {
				status = db.checkUser(customer);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (1 == status) {
				request.getRequestDispatcher("changingpassword.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "Wrong details.Try again");
				request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
			}
		}
		if (page.equals("changing-password-form")) {
			DataBase db = new DataBase();
			String mail = request.getParameter("customerMail");
			String pass = request.getParameter("customerPassword");
			try {
				db.updatePassword(mail, pass);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("customersignin.jsp").forward(request, response);
		}

		if (page.equals("security-signin-form")) {
			DataBase db = new DataBase();
			String mail = request.getParameter("customerMail");
			String password = request.getParameter("customerPassword");
			int status = 0;
			try {
				status = db.allCustomer1(mail, password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (1 == status) {
				request.getRequestDispatcher("securityquestions.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("home1.jsp").forward(request, response);
			}

		}
		if (page.equals("membershipsign-in-form")) {
			DataBase db = new DataBase();
			String mail = request.getParameter("customerMail");
			String phone = request.getParameter("customerPhone");
			String membership = request.getParameter("membership");
			Customer customer = new Customer();
			customer.setCustomerMail(mail);
			customer.setCustomerPhone(phone);
			customer.setMembership(membership);
			HttpSession session = request.getSession();

			try {
				db.updateUserAfterMembership(customer);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (membership.equalsIgnoreCase("yes")) {
				request.setAttribute("member", "MEMBER");
				session.setAttribute("member", "MEMBER");
				request.getRequestDispatcher("home1.jsp").forward(request, response);
			} else {
				request.setAttribute("member", "GET MEMBERSHIP");
				session.setAttribute("member", "GET MEMBERSHIP");
				request.getRequestDispatcher("home1.jsp").forward(request, response);
			}
		}

		if (page.equals("edit_product")) {
			String id = request.getParameter("id");
			String name = request.getParameter("productName");
			String price = request.getParameter("price");
			String category = request.getParameter("category");
			String subcategory = request.getParameter("subcategory");
			String available = request.getParameter("available");
			String image = request.getParameter("image");
			Product p = new Product();
			p.setId(Integer.parseInt(id));
			p.setName(name);
			p.setPrice(price);
			p.setCategory(category);
			p.setSubcategory(subcategory);
			p.setAvailable(available);
			p.setImage("img/" + image);

			DataBase account = new DataBase();
			try {
				account.updateProduct(p);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Product details updated successfully");
			request.getRequestDispatcher("adminindex.jsp").forward(request, response);
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page");
		String action = request.getParameter("action");
		
		if (page.equals("add_product")) {
			String name = request.getParameter("productName");
			String price = request.getParameter("price");
			String category = request.getParameter("category");
			String subcategory = request.getParameter("subcategory");
			String available = request.getParameter("available");
			String image = request.getParameter("image");
			Product p = new Product();
			p.setName(name);
			p.setPrice(price);
			p.setCategory(category);
			p.setSubcategory(subcategory);
			p.setAvailable(available);
			p.setImage("img/" + image);

			DataBase account = new DataBase();
			try {
				account.addProduct(p);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Product added successfully");
			request.getRequestDispatcher("addproduct.jsp").forward(request, response);
		}
		if (page.equals("delete")) {
			String id = request.getParameter("id");
			DataBase db = new DataBase();
			try {
				db.deleteProduct(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			System.out.println("Product deleted successfully");
			request.getRequestDispatcher("adminindex.jsp").forward(request, response);

		}
		if (page.equals("admin_logout")) {
			// response.sendRedirect("adminlogin.jsp");
			request.getRequestDispatcher("adminlogin.jsp").forward(request, response);

		}

		if (page.equals("customer_sign_out")) {
			HttpSession session = request.getSession();
			session.invalidate();
			request.getRequestDispatcher("customersignin.jsp").forward(request, response);
		}

		if (page.equals("edit")) {
			String id = request.getParameter("id");
			DataBase account = new DataBase();
			Product p = null;
			try {
				p = account.fetchProduct(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			request.setAttribute("p", p);
			request.getRequestDispatcher("editproduct.jsp").forward(request, response);
		}
		if ((page.equals("IPhone") || page.equals("Samsung") || page.equals("BlackBerry") || page.equals("Vivo")
				|| page.equals("Realme") || page.equals("Redmi") || page.equals("Oppo") || page.equals("Oneplus")
				|| page.equals("Asus") || page.equals("Dell") || page.equals("Hp") || page.equals("Lenovo")
				|| page.equals("MacBook") || page.equals("Lamp") || page.equals("SmartLock")
				|| page.equals("SecurityCamera") || page.equals("Alexa") || page.equals("Wifi")
				|| page.equals("Clothing") || page.equals("FootWear") || page.equals("Accessories")
				|| page.equals("BeautyProducts") || page.equals("Watches") || page.equals("WomenClothing")
				|| page.equals("WomenAccessories") || page.equals("WomenFootwear") || page.equals("WomenBeautyProducts")
				|| page.equals("WomenWatches") || page.equals("Boys") || page.equals("Girls")
				|| page.equals("KidsAccessories") || page.equals("KidsToys") || page.equals("KidsFootWear")
				|| page.equals("Horror") || page.equals("Comics") || page.equals("Thriller") || page.equals("Biography")
				|| page.equals("Romantic") || page.equals("BabyToys") || page.equals("BabyClothing")
				|| page.equals("BabyDiaper") || page.equals("BathEssentials") || page.equals("FeedingEssentials")
				|| page.equals("SportAccessories") || page.equals("SportClothing") || page.equals("SportFootWear")
				|| page.equals("TravelTotes") || page.equals("DuffelBags") || page.equals("TravelPacks")
				|| page.equals("RollingLuggage") || page.equals("WheeledBackpacks") || page.equals("Bags")
				|| page.equals("Sports") || page.equals("Babies") || page.equals("Books") || page.equals("KidsFashion")
				|| page.equals("WomensFashion") || page.equals("MensFashion") || page.equals("SmartHome")
				|| page.equals("Laptops") || page.equals("Mobiles") || page.equals("luggages"))) {
			HttpSession session = request.getSession();
			session.setAttribute("action", null);
			DataBase db = new DataBase();
			try {
				list = db.fetch();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			request.setAttribute("list", list);
			request.getRequestDispatcher("product.jsp").forward(request, response);
		}

		if (page.equals("addtocart")&&(action.equals("IPhone") || action.equals("Samsung") || action.equals("BlackBerry") || action.equals("Vivo")
				|| action.equals("Realme") || action.equals("Redmi") || action.equals("Oppo") || action.equals("Oneplus")
				|| action.equals("Asus") || action.equals("Dell") || action.equals("Hp") || action.equals("Lenovo")
				|| action.equals("MacBook") || action.equals("Lamp") || action.equals("SmartLock")
				|| action.equals("SecurityCamera") || action.equals("Alexa") || action.equals("Wifi")
				|| action.equals("Clothing") || action.equals("FootWear") || action.equals("Accessories")
				|| action.equals("BeautyProducts") || action.equals("Watches") || action.equals("WomenClothing")
				|| action.equals("WomenAccessories") || action.equals("WomenFootwear") || action.equals("WomenBeautyProducts")
				|| action.equals("WomenWatches") || action.equals("Boys") || action.equals("Girls")
				|| action.equals("KidsAccessories") || action.equals("KidsToys") || action.equals("KidsFootWear")
				|| action.equals("Horror") || action.equals("Comics") || action.equals("Thriller") || page.equals("Biography")
				|| action.equals("Romantic") || action.equals("BabyToys") || action.equals("BabyClothing")
				|| action.equals("BabyDiaper") || action.equals("BathEssentials") || action.equals("FeedingEssentials")
				|| action.equals("SportAccessories") || action.equals("SportClothing") || action.equals("SportFootWear")
				|| action.equals("TravelTotes") || action.equals("DuffelBags") || action.equals("TravelPacks")
				|| action.equals("RollingLuggage") || action.equals("WheeledBackpacks") || action.equals("Bags")
				|| action.equals("Sports") || action.equals("Babies") || action.equals("Books") || action.equals("KidsFashion")
				|| action.equals("WomensFashion") || action.equals("MensFashion") || action.equals("SmartHome")
				|| action.equals("Laptops") || action.equals("Mobiles") || action.equals("Luggages"))) {
			
			String name = request.getParameter("uname");
			int id = Integer.parseInt(request.getParameter("id"));
			HttpSession session = request.getSession();
			session.setAttribute("action", action);
			Cart c = new Cart();
			c.setCustomerMail(name);
			c.setId(id);
			if (name.length() == 0) {
				request.getRequestDispatcher("cart.jsp").forward(request, response);
			} else {
				DataBase account = new DataBase();
				try {
					int count = account.checkCart(c);
					if (0 == count) {
						try {
							account.addtoCart(c);
							JOptionPane.showMessageDialog(null, "Product is added to Cart", "Info",
									JOptionPane.INFORMATION_MESSAGE);
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					} else {
						JOptionPane.showMessageDialog(null, "Product is already added to Cart", "Info",
								JOptionPane.INFORMATION_MESSAGE);
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				DataBase db = new DataBase();
				try {
					list = db.fetch();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				request.setAttribute("list", list);
				request.getRequestDispatcher("product.jsp").forward(request, response);
			}
		}
		if (page.equals("removeitem")) {
			String name = request.getParameter("user");
			int id = Integer.parseInt(request.getParameter("id"));
			Cart c = new Cart();
			c.setCustomerMail(name);
			c.setId(id);
			DataBase account = new DataBase();
			try {
				account.removefromCart(c);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("cart2.jsp").forward(request, response);
		}
		if (page.equals("continue")) {
			HttpSession session = request.getSession();
			request.setAttribute("member", session.getAttribute("member"));
			request.getRequestDispatcher("home1.jsp").forward(request, response);

		}
		if (page.equals("membership")) {
			HttpSession session = request.getSession();
			String str = (String) session.getAttribute("member");
			if (str.equals("MEMBER")) {
				request.setAttribute("members", "Are you want to continue membership");
				request.getRequestDispatcher("membership.jsp").forward(request, response);
			} else {
				request.setAttribute("members", "Are you want to get membership");
				request.getRequestDispatcher("membership.jsp").forward(request, response);
			}

		}

	}

}