package com.quiz.weather_history.mapper;

import java.util.List;

import com.quiz.weather_history.domain.Weather;

public interface WeatherMapper {
	
	public List<Weather> selectWeatherHistory();
	
	public void insertWeather(Weather weather);

}
