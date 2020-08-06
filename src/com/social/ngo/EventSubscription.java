package com.social.ngo;


public class EventSubscription
{
	int id;
	int memberId;
	String emailId;
	String mobileNo;

	public void setId(int id)
	{
		this.id = id;
	}
	public int getId()
	{
		return id;
	}

	public void setMemberId(int memberId)
	{
		this.memberId = memberId;
	}
	public int getMemberId()
	{
		return memberId;
	}

	public void setEmailId(String emailId)
	{
		this.emailId = emailId;
	}
	public String getEmailId()
	{
		return emailId;
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