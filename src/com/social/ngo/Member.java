package com.social.ngo;


public class Member
{
	int id;
	String name;
	String emailId;
	String password;
	String mobileNo;
	String profilePhoto;
	String gender;
	String address;
	String dob;

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

	public void setMobileNo(String mobileNo)
	{
		this.mobileNo = mobileNo;
	}
	public String getMobileNo()
	{
		return mobileNo;
	}

	public void setProfilePhoto(String profilePhoto)
	{
		this.profilePhoto = profilePhoto;
	}
	public String getProfilePhoto()
	{
		return profilePhoto;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public String getGender()
	{
		return gender;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}
	public String getAddress()
	{
		return address;
	}

	public void setDob(String dob)
	{
		this.dob = dob;
	}
	public String getDob()
	{
		return dob;
	}
}