import 'package:flutter_weather/features/weather_forecast/data/data_source/weather_service.dart';
import 'package:flutter_weather/features/weather_forecast/domain/model/weather_forecast_model.dart';
import 'package:flutter_weather/features/weather_forecast/domain/model/weather_model.dart';
import 'package:flutter_weather/features/weather_forecast/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl(this._weatherService);

  final WeatherService _weatherService;

  @override
  Future<WeatherModel> getCurrentWeather({
    required String query,
    required String appId,
  }) async {
    final result = await _weatherService.getCurrentWeather(query, appId, "metric");
    return result.toWeatherModel();
  }

  @override
  Future<WeatherForecastModel> getWeatherForecastNext5Days({
    required String query,
    required String appId,
  }) async {
    final result =
        await _weatherService.getWeatherForecastNext5Days(query, appId, "metric");
    return result.toWeatherForecastModel();
  }
}
