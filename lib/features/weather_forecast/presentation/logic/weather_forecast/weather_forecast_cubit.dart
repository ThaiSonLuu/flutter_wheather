import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/config/env/env.dart';
import 'package:flutter_weather/features/weather_forecast/domain/model/weather_model.dart';
import 'package:flutter_weather/features/weather_forecast/domain/repository/weather_repository.dart';

part 'weather_forecast_state.dart';

class WeatherForecastCubit extends Cubit<WeatherForecastState> {
  WeatherForecastCubit({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super(WeatherForecastInitial());

  Map<DateTime, List<WeatherModel>> _mapDayToWeather = {};
  Map<DateTime, List<WeatherModel>> get mapDayToWeather => _mapDayToWeather;

  final WeatherRepository _weatherRepository;

  Future<void> getWeatherForecast() async {
    try {
      emit(WeatherForecastLoading());
      final result = await _weatherRepository.getWeatherForecastNext5Days(
        query: "Hanoi",
        appId: Env.apiKey,
      );
      final weatherForecast = result.value ?? [];
      Map<DateTime, List<WeatherModel>> map = {};
      for (var e in weatherForecast) {
        final date = e.time?.copyWith(
          hour: 0,
          minute: 0,
          second: 0,
          millisecond: 0,
          microsecond: 0,
        );
        if (date != null) {
          final list = map[date];
          if (list == null) {
            map[date] = [e];
          } else {
            map[date]!.add(e);
          }
        }
      }
      _mapDayToWeather = map;
      emit(WeatherForecastLoaded(
        weathers: map.values.first,
        days: map.keys.toList(),
        showingDay: map.keys.first,
      ));
    } catch (e) {
      emit(WeatherForecastError(e.toString()));
    }
  }

  void setDay(DateTime newShowingDay) {
    if (state is WeatherForecastLoaded &&
        (state as WeatherForecastLoaded).showingDay == newShowingDay) {
      return;
    }
    emit(WeatherForecastLoaded(
      weathers: _mapDayToWeather[newShowingDay] ?? [],
      days: _mapDayToWeather.keys.toList(),
      showingDay: newShowingDay,
    ));
  }
}
