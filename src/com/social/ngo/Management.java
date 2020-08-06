package com.social.ngo;


public class Management
{
	int id;
	String name;
	String emailId;
	String password;
	String profilePhoto;
	String mobileNo;

	public void setId(int id)
	{
		this.id = id;
	}
	public int getId()
	{
		return id;
	}

	public void setName(String name)
	{
		this.name = name;
	}
	public String getName()
	{
		return name;
	}

	public void setEmailId(String emailId)
	{
		this.emailId = emailId;
	}
	public String getEmailId()
	{
		return emailId;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}
	public String getPassword()
	{
		return password;
	}

	public void setProfilePhoto(String profilePhoto)
	{
		this.profilePhoto = profilePhoto;
	}
	public String getProfilePhoto()
	{
		return profilePhoto;
	}

	public void setMobileNo(String mobileNo)
	{
		this.mobileNo = mobileNo;
	}
	public String getMobileNo()
	{
		return mobileNo;
	}
}