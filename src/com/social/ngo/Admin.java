package com.social.ngo;


public class Admin
{
	int id;
	String emailId;
	String username;
	String password;

	public void setId(int id)
	{
		this.id = id;
	}
	public int getId()
	{
		return id;
	}

	public void setEmailId(String emailId)
	{
		this.emailId = emailId;
	}
	public String getEmailId()
	{
		return emailId;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}
	public String getUsername()
	{
		return username;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}
	public String getPassword()
	{
		return password;
	}
}