import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/config/env/env.dart';
import 'package:flutter_weather/features/weather_forecast/domain/model/weather_model.dart';
import 'package:flutter_weather/features/weather_forecast/domain/repository/weather_repository.dart';

part 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  CurrentWeatherCubit({
    required WeatherRepository weatherRepository,
  })
      : _weatherRepository = weatherRepository,
        super(CurrentWeatherInitial());

  static const city = "Hanoi";
  WeatherModel? _data;
  WeatherModel? get data => _data;

  final WeatherRepository _weatherRepository;

  Future<void> getCurrentWeather() async {
    try {
      emit(CurrentWeatherLoading());
      final result = await _weatherRepository.getCurrentWeather(
        query: city,
        appId: Env.apiKey,
      );
      _data = result;
      emit(CurrentWeatherLoaded(result));
    } catch (e) {
      emit(CurrentWeatherError(e.toString()));
    }
  }

  void showWeather(WeatherModel model) {
      _data = model;
    emit(CurrentWeatherLoaded(model));
  }

}
