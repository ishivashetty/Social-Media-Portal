package com.social.ngo;

import java.sql.*;

public class MemberPost
{
	int id;
	int postId;
	String uploader;
	String status;
	Timestamp lastSeen;
	String reason;

	public void setId(int id)
	{
		this.id = id;
	}
	public int getId()
	{
		return id;
	}

	public void setPostId(int postId)
	{
		this.postId = postId;
	}
	public int getPostId()
	{
		return postId;
	}

	public void setUploader(String uploader)
	{
		this.uploader = uploader;
	}
	public String getUploader()
	{
		return uploader;
	}

	public void setStatus(String status)
	{
		this.status = status;
	}
	public String getStatus()
	{
		return status;
	}

	public void setLastSeen(Timestamp lastSeen)
	{
		this.lastSeen = lastSeen;
	}
	public Timestamp getLastSeen()
	{
		return lastSeen;
	}

	public void setReason(String reason)
	{
		this.reason = reason;
	}
	public String getReason()
	{
		return reason;
	}
}