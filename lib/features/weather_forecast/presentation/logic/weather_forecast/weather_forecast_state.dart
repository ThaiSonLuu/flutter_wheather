part of 'weather_forecast_cubit.dart';

sealed class WeatherForecastState extends Equatable {
  const WeatherForecastState();

  @override
  List<Object> get props => [];
}

final class WeatherForecastInitial extends WeatherForecastState {}

final class WeatherForecastLoading extends WeatherForecastState {}

final class WeatherForecastLoaded extends WeatherForecastState {
  const WeatherForecastLoaded({
    required this.weathers,
    required this.days,
    required this.showingDay,
  });

  final List<WeatherModel> weathers;
  final List<DateTime> days;
  final DateTime showingDay;

  @override
  List<Object> get props => [weathers, days, showingDay];
}

final class WeatherForecastError extends WeatherForecastState {
  const WeatherForecastError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
