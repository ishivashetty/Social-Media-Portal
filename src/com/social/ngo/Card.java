package com.social.ngo;


public class Card
{
	int id;
	int memberId;
	String cardType;
	String cardNumber;
	String cardName;
	String expiryDate;
	int cvv;

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

	public void setCardType(String cardType)
	{
		this.cardType = cardType;
	}
	public String getCardType()
	{
		return cardType;
	}

	public void setCardNumber(String cardNumber)
	{
		this.cardNumber = cardNumber;
	}
	public String getCardNumber()
	{
		return cardNumber;
	}

	public void setCardName(String cardName)
	{
		this.cardName = cardName;
	}
	public String getCardName()
	{
		return cardName;
	}

	public void setExpiryDate(String expiryDate)
	{
		this.expiryDate = expiryDate;
	}
	public String getExpiryDate()
	{
		return expiryDate;
	}

	public void setCvv(int cvv)
	{
		this.cvv = cvv;
	}
	public int getCvv()
	{
		return cvv;
	}
}