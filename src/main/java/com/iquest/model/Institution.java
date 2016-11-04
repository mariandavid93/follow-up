package com.iquest.model;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import java.io.Serializable;
import java.util.List;

/**
 * Institution entity
 * 
 * @author marian.david
 *
 */
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE,region="institution")
public class Institution implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String address;
	private String owner;
	private String email;
	private String phone;
	private String accountNo;
	private String service;
	private List<Account> accounts;

	public Institution() {

	}

	public Institution(String name, String adress, String owner, String email, String phone, String accountNo,
			String service) {
		this.name = name;
		this.address = adress;
		this.owner = owner;
		this.email = email;
		this.phone = phone;
	}

	public Institution(int id, String name, String adress, String owner, String email, String phone, String accountNo,
			String service) {
		this(name, adress, owner, email, phone, accountNo, service);
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	@Override
	public String toString() {
		return "Service [id=" + id + ", name=" + name + ", address=" + address + ", owner=" + owner + ", email=" + email
				+ ", phone=" + phone + ", accountNo=" + accountNo + ", service=" + service + "]";
	}

	public List<Account> getAccounts() {
		return accounts;
	}

	public void setAccounts(List<Account> accounts) {
		this.accounts = accounts;
	}
}
