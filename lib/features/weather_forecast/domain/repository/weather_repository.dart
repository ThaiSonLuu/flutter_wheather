import 'package:flutter_weather/features/weather_forecast/domain/model/weather_forecast_model.dart';
import 'package:flutter_weather/features/weather_forecast/domain/model/weather_model.dart';

abstract interface class WeatherRepository {
  Future<WeatherModel> getCurrentWeather({
    required String query,
    required String appId,
  });

  Future<WeatherForecastModel> getWeatherForecastNext5Days({
    required String query,
    required String appId,
  });
}
