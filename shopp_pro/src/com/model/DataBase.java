package com.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.beans.Cart;
import com.beans.Crypto;
import com.beans.Customer;
import com.beans.Product;

import monfox.toolkit.snmp.agent.modules.SnmpV2Mib.SysOREntry;

public class DataBase {
	private Connection con;
	static ArrayList<Customer> customerList = new ArrayList<Customer>();

	private void dbConnect() {
		try {

			con = DriverManager.getConnection("jdbc:mysql://localhost:3307/test", "root", "Subha@2127");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void dbClose() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void addUser(Customer customer) throws SQLException, UnsupportedEncodingException {
		dbConnect();
		String sql = "Insert into test.customer(customerName,customerPhone,customerMail,customerPassword) values(?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, customer.getCustomerName());
		st.setString(2, customer.getCustomerPhone());
		st.setString(3, customer.getCustomerMail());
		st.setString(4, customer.getCustomerPassword());
		st.setString(4, Crypto.encode(customer.getCustomerPassword()));
		st.executeUpdate();
		dbClose();
	}

	public void updateUser(Customer customer) throws SQLException {
		dbConnect();
		String sql1 = "update test.customer set question1=?,question2=?,question3=?,question4=?,question5=? where customerMail=?";
		PreparedStatement st = con.prepareStatement(sql1);
		st.setString(1, customer.getQuestion1());
		st.setString(2, customer.getQuestion2());
		st.setString(3, customer.getQuestion3());
		st.setString(4, customer.getQuestion4());
		st.setString(5, customer.getQuestion5());
		st.setString(6, customer.getCustomerMail());
		st.executeUpdate();
		dbClose();
	}

	public int checkUser(Customer customer) throws SQLException {
		dbConnect();
		String sql = "Select * From test.customer";
		ResultSet result;
		int count = 0;
		Statement statement = null;
		String mail = customer.getCustomerMail();
		String q1 = customer.getQuestion1();
		String q2 = customer.getQuestion2();
		String q3 = customer.getQuestion3();
		String q4 = customer.getQuestion4();
		String q5 = customer.getQuestion5();

		statement = con.createStatement();
		result = statement.executeQuery(sql);
		while (result.next()) {
			Customer c = new Customer(result.getInt("customerId"), result.getString("customerName"),
					result.getString("customerPhone"), result.getString("customerMail"),
					result.getString("customerPassword"), result.getString("question1"), result.getString("question2"),
					result.getString("question3"), result.getString("question4"), result.getString("question5"),
					result.getString("membership"));
			customerList.add(c);

		}
		for (Customer i : customerList) {
			if (mail.equalsIgnoreCase(i.getCustomerMail()) && q1.equalsIgnoreCase(i.getQuestion1())
					&& q2.equalsIgnoreCase(i.getQuestion2()) && q3.equalsIgnoreCase(i.getQuestion3())
					&& q4.equalsIgnoreCase(i.getQuestion4()) && q5.equalsIgnoreCase(i.getQuestion5())) {
				count += 1;

			}
		}
		dbClose();
		if (1 <= count) {
			return 1;
		}
		return 0;

	}

	public int allCustomer(String id, String Password) throws SQLException {
		dbConnect();
		String sql = "Select * From test.customer";

		String yes = "yes";
		ResultSet result;
		Statement statement = null;

		statement = con.createStatement();
		result = statement.executeQuery(sql);
		while (result.next()) {
			Customer customer = new Customer(result.getInt("customerId"), result.getString("customerName"),
					result.getString("customerPhone"), result.getString("customerMail"),
					result.getString("customerPassword"), result.getString("question1"), result.getString("question2"),
					result.getString("question3"), result.getString("question4"), result.getString("question5"),
					result.getString("membership"));
			customerList.add(customer);

		}
		for (Customer i : customerList) {
			if ((id.equals(i.getCustomerMail()) || id.equals(i.getCustomerPhone()))
					&& Password.equals(i.getCustomerPassword())) {
				if (yes.equalsIgnoreCase(i.getMembership())) {
					return 2;

				}
				return 1;
			}
		}
		return 0;
	}

	public int allCustomer1(String mail, String phone) throws SQLException {
		dbConnect();
		String sql = "Select * From test.customer";
		int count = 0;
		ResultSet result;
		Statement statement = null;

		statement = con.createStatement();
		result = statement.executeQuery(sql);
		while (result.next()) {
			Customer customer = new Customer(result.getInt("customerId"), result.getString("customerName"),
					result.getString("customerPhone"), result.getString("customerMail"),
					result.getString("customerPassword"), result.getString("question1"), result.getString("question2"),
					result.getString("question3"), result.getString("question4"), result.getString("question5"),
					result.getString("membership"));
			customerList.add(customer);

		}
		for (Customer i : customerList) {
			if ((mail.equals(i.getCustomerMail()) || phone.equals(i.getCustomerPhone()))) {
				count += 1;
			}

		}
		dbClose();
		if (count >= 1) {
			return 1;
		}
		return 0;
	}

	public void updateUserAfterMembership(Customer customer) throws SQLException {
		dbConnect();
		String sql2 = "update test.customer set membership=?  where customerMail=? or customerPhone=?";
		PreparedStatement st = con.prepareStatement(sql2);
		st.setString(1, customer.getMembership());
		st.setString(2, customer.getCustomerMail());
		st.setString(3, customer.getCustomerPhone());
		st.executeUpdate();
		dbClose();
	}

	public void updatePassword(String mail, String pass) throws SQLException {
		dbConnect();
		String sql2 = "update test.customer set customerPassword=?  where customerMail=?";
		PreparedStatement st = con.prepareStatement(sql2);
		st.setString(1, mail);
		st.setString(2, pass);
		st.executeUpdate();
		dbClose();
	}

	public void deleteProduct(String id) throws SQLException {

		dbConnect();
		String sql = "Delete from test.product where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		st.executeUpdate();
		dbClose();

	}

	public void removefromCart(Cart c) throws SQLException {
		dbConnect();
		String sql = "delete from test.cart where id=? and customerMail=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, c.getId());
		pstmt.setString(2, c.getCustomerMail());
		pstmt.executeUpdate();
		// ResultSet rst = pstmt.executeQuery();
		dbClose();

	}

	public Product fetchProduct(String id) throws SQLException {
		dbConnect();
		String sql = "select * from test.product where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rst = pstmt.executeQuery();
		Product p = new Product();
		while (rst.next()) {

			p.setId(rst.getInt("id"));
			p.setName(rst.getString("name"));
			p.setPrice(rst.getString("price"));
			p.setCategory(rst.getString("category"));
			p.setSubcategory(rst.getString("subcategory"));
			p.setAvailable(rst.getString("available"));
			p.setImage(rst.getString("image"));
		}
		dbClose();
		return p;
	}

	public void updateProduct(Product p) throws SQLException {
		dbConnect();
		String sql = "update test.product set name=?,price=?,category=?,subcategory=?,available=?,image=? where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, p.getName());
		st.setString(2, p.getPrice());
		st.setString(3, p.getCategory());
		st.setString(4, p.getSubcategory());
		st.setString(5, p.getAvailable());
		st.setString(6, p.getImage());

		st.setInt(7, p.getId());
		st.executeUpdate();
		dbClose();
	}

	public void addProduct(Product p) throws SQLException {
		dbConnect();
		String sql = "Insert into test.product(name,price,category,subcategory,available,image) values(?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, p.getName());
		st.setString(2, p.getPrice());
		st.setString(3, p.getCategory());
		st.setString(4, p.getSubcategory());
		st.setString(5, p.getAvailable());
		st.setString(6, p.getImage());

		st.executeUpdate();
		dbClose();
	}

	public void addtoCart(Cart c) throws SQLException {
		dbConnect();
		String sql = "select * from test.product where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, c.getId());
		ResultSet rst = pstmt.executeQuery();
		Cart cart = new Cart();
		while (rst.next()) {

			cart.setId(rst.getInt("id"));
			cart.setName(rst.getString("name"));
			cart.setPrice(rst.getInt("price"));
			cart.setCategory(rst.getString("category"));
			cart.setCustomerMail(c.getCustomerMail());

		}
		String sql1 = "Insert into test.cart(customerMail,id,name,price,category) values(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql1);
		st.setString(1, cart.getCustomerMail());
		st.setInt(2, cart.getId());
		st.setString(3, cart.getName());
		st.setInt(4, cart.getPrice());
		st.setString(5, cart.getCategory());
		st.executeUpdate();
		dbClose();

	}

	public int checkCart(Cart c) throws SQLException {
		int count = 0;
		dbConnect();
		String sql = "select * from test.cart where id=? and customerMail=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, c.getId());
		pstmt.setString(2, c.getCustomerMail());
		ResultSet rst = pstmt.executeQuery();
		while (rst.next()) {
			count = 1;
		}
		dbClose();
		return count;

	}

	public ArrayList<Product> fetch() throws SQLException {
		dbConnect();
		String sql = "Select * from test.product";
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			int id = rs.getInt("id");
			String name = rs.getString("name");
			String category = rs.getString("category");
			String subcategory = rs.getString("subcategory");
			String price = rs.getString("price");
			String available = rs.getString("available");
			String image = rs.getString("image");

			Product p = new Product();
			p.setCategory(category);
			p.setSubcategory(subcategory);
			p.setAvailable(available);
			p.setId(id);
			p.setImage(image);
			p.setName(name);
			p.setPrice(price);
			list.add(p);
			p = null;

		}

		dbClose();
		return list;
	}

	public static void main(String[] args) throws SQLException {
		DataBase db = new DataBase();
		Cart c = new Cart();
		c.setId(22);
		c.setCustomerMail("vk@gmail.com");
		System.out.println(db.checkCart(c));

	}

}