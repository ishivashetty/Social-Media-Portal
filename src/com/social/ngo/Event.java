package com.social.ngo;


public class Event
{
	int id;
	String caption;
	String date;
	int days;
	int managementId;

	public void setId(int id)
	{
		this.id = id;
	}
	public int getId()
	{
		return id;
	}

	public void setCaption(String caption)
	{
		this.caption = caption;
	}
	public String getCaption()
	{
		return caption;
	}

	public void setDate(String date)
	{
		this.date = date;
	}
	public String getDate()
	{
		return date;
	}

	public void setDays(int days)
	{
		this.days = days;
	}
	public int getDays()
	{
		return days;
	}

	public void setManagementId(int managementId)
	{
		this.managementId = managementId;
	}
	public int getManagementId()
	{
		return managementId;
	}
}