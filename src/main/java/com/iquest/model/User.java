package com.iquest.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import java.io.Serializable;
import java.util.List;

/**
 * User entity
 * 
 * @author marian.david
 *
 */
@JsonIgnoreProperties({"accounts"})
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE, region = "user")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String username;
	private String password;
	private String firstName;
	private String surName;
	private String address;
	private int age;
	private String email;
	@OneToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	private List<Account> accounts;

	public User() {

	}

	public User(String username, String password, String firstName, String surName, String address, int age,
			String email) {
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.surName = surName;
		this.address = address;
		this.age = age;
		this.email = email;
	}

	public User(int id, String username, String password, String firstName, String surName, String address, int age,
			String email) {
		this(username, password, firstName, surName, address, age, email);
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getSurName() {
		return surName;
	}

	public void setSurName(String surName) {
		this.surName = surName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Account> getAccounts() {
		return accounts;
	}

	public void setAccounts(List<Account> accounts) {
		this.accounts = accounts;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress() {
		return address;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", firstName=" + firstName
				+ ", surName=" + surName + ", address=" + address + ", age=" + age + ", email=" + email + "]";
	}
}
