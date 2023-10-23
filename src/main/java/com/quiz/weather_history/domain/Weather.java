package com.quiz.weather_history.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Weather {
	
	private int id;
	@DateTimeFormat(pattern="yyyy-mm-dd")   // controller에서 parameter받을 때 날짜를 type을 string으로 처리해 준다.-테스트해 볼 것...
	private String date;
	private String weather;
	private double temperatures;
	private double precipitation;
	private String microDust;
	private double windSpeed;
	private Date createdAt;
	private Date updatedAt;
	
	public Weather() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
	}

	public double getTemperatures() {
		return temperatures;
	}

	public void setTemperatures(double temperatures) {
		this.temperatures = temperatures;
	}

	public double getPrecipitation() {
		return precipitation;
	}

	public void setPrecipitation(double precipitation) {
		this.precipitation = precipitation;
	}

	public String getMicroDust() {
		return microDust;
	}

	public void setMicroDust(String microDust) {
		this.microDust = microDust;
	}

	public double getWindSpeed() {
		return windSpeed;
	}

	public void setWindSpeed(double windSpeed) {
		this.windSpeed = windSpeed;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
}
