import 'package:dio/dio.dart';
import 'package:flutter_weather/config/env/env.dart';
import 'package:flutter_weather/features/weather_forecast/data/data_source/weather_service.dart';
import 'package:flutter_weather/features/weather_forecast/data/repository/weather_repository_impl.dart';
import 'package:flutter_weather/features/weather_forecast/domain/repository/weather_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerLazySingleton<Dio>(() {
    final baseOption = BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      responseType: ResponseType.json,
      baseUrl: Env.apiUrl,
    );

    final Dio dio = Dio(baseOption);
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  });

  // Service
  sl.registerLazySingleton<WeatherService>(() => WeatherService(sl()));

  // Repository
  sl.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(sl()));
}
