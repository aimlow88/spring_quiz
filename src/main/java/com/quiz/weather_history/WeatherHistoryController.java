package com.quiz.weather_history;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.quiz.weather_history.bo.WeatherBO;
import com.quiz.weather_history.domain.Weather;

@Controller
public class WeatherHistoryController {
	
	@Autowired
	private WeatherBO weatherBO;
//	private Weather weather;
	
	@GetMapping("/weather-history/weatherhistory")
	public String weatherHistory(Model model) {
		
		List<Weather> wHistoryList = weatherBO.getWeatherHistory();
		
		model.addAttribute("wHistoryList", wHistoryList);
		
		return "weather_history/weatherHistory";
	}
	
	@GetMapping("/weather-history/add-weather-view")
	public String addWeatherView() {
		return "weather_history/addWeather";
	}
	
	@PostMapping("/weather-history/add-weather")
	public String addWeather(@ModelAttribute Weather addWeatherInfo
			) {
		
		weatherBO.addWeather(addWeatherInfo);
		
		return "redirect:/weather-history/weatherhistory";
	}

}
