package com.uwl.service.domain;


public class Weather {

	private String date;	
	private String to;	// 시간
	private String x;
	private String y;
	
	public Weather() {
	}

	public Weather(String date, String to, String x, String y) {
		super();
		this.date = date;
		this.to = to; 
		this.x = x;
		this.y = y;
	}

	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}

	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}

	/**
	 * @return the to
	 */
	public String getTo() {
		return to;
	}

	/**
	 * @param to the to to set
	 */
	public void setTo(String to) {
		this.to = to;
	}

	/**
	 * @return the x
	 */
	public String getX() {
		return x;
	}

	/**
	 * @param x the x to set
	 */
	public void setX(String x) {
		this.x = x;
	}

	/**
	 * @return the y
	 */
	public String getY() {
		return y;
	}

	/**
	 * @param y the y to set
	 */
	public void setY(String y) {
		this.y = y;
	}

	@Override
	public String toString() {
		return "Weather [date=" + date + ", to=" + to + ", x=" + x + ", y=" + y + "]";
	}
	
	
	
}