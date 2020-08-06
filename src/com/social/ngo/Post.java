package com.social.ngo;

import java.sql.Timestamp;

public class Post
{
	int id;
	String userId;
	String userType;
	String photo;
	String description;
	Timestamp time;
	int likes;
	int comments;
	int shares;

	public void setId(int id)
	{
		this.id = id;
	}
	public int getId()
	{
		return id;
	}

	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	public String getUserId()
	{
		return userId;
	}

	public void setUserType(String userType)
	{
		this.userType = userType;
	}
	public String getUserType()
	{
		return userType;
	}

	public void setPhoto(String photo)
	{
		this.photo = photo;
	}
	public String getPhoto()
	{
		return photo;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}
	public String getDescription()
	{
		return description;
	}

	public void setTime(Timestamp time)
	{
		this.time = time;
	}
	public Timestamp getTime()
	{
		return time;
	}
	
	public void setLikes(int likes)
	{
		this.likes = likes;
	}
	public int getLikes()
	{
		return likes;
	}

	
	public void setComments(int comments)
	{
		this.comments = comments;
	}
	public int getComments()
	{
		return comments;
	}

	
	public void setShares(int shares)
	{
		this.shares = shares;
	}
	public int getShares()
	{
		return shares;
	}

}