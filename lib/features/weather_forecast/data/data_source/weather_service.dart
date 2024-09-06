import 'package:dio/dio.dart';
import 'package:flutter_weather/features/weather_forecast/data/model/weather_forecast_model_dto.dart';
import 'package:flutter_weather/features/weather_forecast/data/model/weather_model_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_service.g.dart';

@RestApi()
abstract class WeatherService {
  factory WeatherService(Dio dio, {String baseUrl}) = _WeatherService;

  @GET("/data/2.5/weather")
  Future<WeatherModelDto> getCurrentWeather(
    @Query("q") String query,
    @Query("appid") String appId,
    @Query("units") String units,
  );

  @GET("/data/2.5/forecast")
  Future<WeatherForecastModelDto> getWeatherForecastNext5Days(
    @Query("q") String query,
    @Query("appid") String appId,
    @Query("units") String units,
  );

}
