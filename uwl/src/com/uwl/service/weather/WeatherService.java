package com.uwl.service.weather;

import java.util.Map;

import com.uwl.service.domain.Weather;

public interface WeatherService {

	public Map getWeather(Weather weather) throws Exception;

	
}
