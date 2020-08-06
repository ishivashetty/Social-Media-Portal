package com.social.ngo;

import java.sql.*;

public class MemberEvent
{
	int id;
	int memberId;
	int eventId;
	Timestamp time;

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

	public void setEventId(int eventId)
	{
		this.eventId = eventId;
	}
	public int getEventId()
	{
		return eventId;
	}

	public void setTime(Timestamp time)
	{
		this.time = time;
	}
	public Timestamp getTime()
	{
		return time;
	}
}