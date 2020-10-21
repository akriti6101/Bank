package com.training.Bean;

public class CustomerBean {

	private String name;
	private String email;
	private String acctno;
	private Integer balance;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAcctno() {
		return acctno;
	}
	public void setAcctno(String acctno) {
		this.acctno = acctno;
	}
	public Integer getBalance() {
		return balance;
	}
	public void setBalance(Integer balance) {
		this.balance = balance;
	}
	@Override
	public String toString() {
		return "CustomerBean [name=" + name + ", email=" + email + ", acctno=" + acctno + ", balance=" + balance + "]";
	}
	

}
