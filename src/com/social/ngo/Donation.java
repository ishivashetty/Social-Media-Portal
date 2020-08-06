package com.social.ngo;

import java.sql.*;

public class Donation
{
	int id;
	int memberId;
	int cardId;
	float amount;
	Timestamp time;
	String paymentMode;

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
	
	public void setCardId(int cardId)
	{
		this.cardId = cardId;
	}
	public int getCardId()
	{
		return cardId;
	}

	public void setAmount(float amount)
	{
		this.amount = amount;
	}
	public float getAmount()
	{
		return amount;
	}

	public void setTime(Timestamp time)
	{
		this.time = time;
	}
	public Timestamp getTime()
	{
		return time;
	}

	public void setPaymentMode(String paymentMode)
	{
		this.paymentMode = paymentMode;
	}
	public String getPaymentMode()
	{
		return paymentMode;
	}
}