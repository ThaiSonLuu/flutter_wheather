part of 'current_weather_cubit.dart';

sealed class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();

  @override
  List<Object> get props => [];
}

final class CurrentWeatherInitial extends CurrentWeatherState {}

final class CurrentWeatherLoading extends CurrentWeatherState {}

final class CurrentWeatherLoaded extends CurrentWeatherState {
  const CurrentWeatherLoaded(this.weather);

  final WeatherModel weather;

  @override
  List<Object> get props => [weather];
}

final class CurrentWeatherError extends CurrentWeatherState {
  final String error;

  const CurrentWeatherError(this.error);

  @override
  List<Object> get props => [error];
}
