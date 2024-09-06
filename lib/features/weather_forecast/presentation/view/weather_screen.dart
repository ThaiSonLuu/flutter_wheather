import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/core/cubit/app_language/app_language_cubit.dart';
import 'package:flutter_weather/di/injection_container.dart';
import 'package:flutter_weather/features/weather_forecast/domain/model/weather_model.dart';
import 'package:flutter_weather/features/weather_forecast/presentation/logic/current_weather/current_weather_cubit.dart';
import 'package:flutter_weather/features/weather_forecast/presentation/logic/weather_forecast/weather_forecast_cubit.dart';
import 'package:flutter_weather/features/weather_forecast/presentation/utils/weather_extension.dart';
import 'package:flutter_weather/features/weather_forecast/presentation/view/widgets/item_day_forecast.dart';
import 'package:flutter_weather/features/weather_forecast/presentation/view/widgets/item_weather_forecast.dart';
import 'package:flutter_weather/features/weather_forecast/presentation/view/widgets/showing_weather.dart';
import 'package:flutter_weather/gen/assets.gen.dart';
import 'package:flutter_weather/generated/l10n.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CurrentWeatherCubit(weatherRepository: sl())..getCurrentWeather(),
        ),
        BlocProvider(
          create: (context) => WeatherForecastCubit(weatherRepository: sl())
            ..getWeatherForecast(),
        ),
      ],
      child: const _WeatherScreen(),
    );
  }
}

class _WeatherScreen extends StatelessWidget {
  const _WeatherScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
        builder: (context, state) {
          WeatherModel? data = context.read<CurrentWeatherCubit>().data;

          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(data.getBackgroundImage()),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(
                    top: 10 + MediaQuery.of(context).padding.top,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: BlocBuilder<AppLanguageCubit, AppLanguageState>(
                    builder: (context, state) {
                      return AnimatedToggleSwitch.dual(
                        height: 40,
                        borderWidth: 0,
                        spacing: 0,
                        current: state.languageCode,
                        first: "en",
                        second: "vi",
                        animationDuration: const Duration(milliseconds: 500),
                        style: ToggleStyle(
                          borderColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          backgroundColor: data.getBackgroundColor(),
                        ),
                        onChanged: (newLanguageCode) {
                          context.read<AppLanguageCubit>().setLanguageCode(
                                newLanguageCode,
                              );
                        },
                        iconBuilder: (value) {
                          return Image.asset(
                            value == "vi"
                                ? Assets.images.vietnamese.path
                                : Assets.images.english.path,
                            width: 30,
                            height: 30,
                          );
                        },
                        textBuilder: (value) {
                          return Text(value.toUpperCase());
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 36.0,
                    ),
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      heightFactor: 1,
                      alignment: Alignment.center,
                      child: ShowingWeather(
                        data: data,
                        isLoading: state is CurrentWeatherLoading,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    context.read<CurrentWeatherCubit>().getCurrentWeather();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: data.getBackgroundColor(),
                    foregroundColor: data.getContentColor(),
                  ),
                  child: Text(S.of(context).now),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 110,
                  child:
                      BlocBuilder<WeatherForecastCubit, WeatherForecastState>(
                    builder: (context, state) {
                      List<WeatherModel?> weathers =
                          List.generate(8, (index) => null);

                      if (state is WeatherForecastLoaded) {
                        weathers = state.weathers;
                      }

                      final scrollController = ItemScrollController();

                      return ScrollablePositionedList.separated(
                        itemScrollController: scrollController,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        itemCount: weathers.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10.0);
                        },
                        itemBuilder: (context, index) {
                          return ItemWeatherForecast(
                            backgroundColor: data.getBackgroundColor(),
                            contentColor: data.getContentColor(),
                            model: weathers[index],
                            isLoading: weathers[index] == null,
                            isSelected: data == weathers[index],
                            onTap: () async {
                              if (weathers[index] != null) {
                                await scrollController.scrollTo(
                                  index: index,
                                  alignment: 0.4,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.ease,
                                );
                                if (context.mounted) {
                                  context
                                      .read<CurrentWeatherCubit>()
                                      .showWeather(weathers[index]!);
                                }
                              }
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 80,
                  child:
                      BlocBuilder<WeatherForecastCubit, WeatherForecastState>(
                    builder: (context, state) {
                      List<DateTime?> days = List.generate(5, (index) => null);
                      DateTime? showing;

                      if (state is WeatherForecastLoaded) {
                        days = state.days;
                        showing = state.showingDay;
                      }

                      final scrollController = ItemScrollController();

                      return ScrollablePositionedList.separated(
                        itemScrollController: scrollController,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        itemCount: days.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10.0);
                        },
                        itemBuilder: (context, index) {
                          return ItemDayForecast(
                            backgroundColor: data.getBackgroundColor(),
                            contentColor: data.getContentColor(),
                            time: days[index],
                            isLoading: days[index] == null,
                            onTap: () async {
                              if (days[index] != null) {
                                await scrollController.scrollTo(
                                  index: index,
                                  alignment: 0.4,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.ease,
                                );
                                if (context.mounted) {
                                  context
                                      .read<WeatherForecastCubit>()
                                      .setDay(days[index]!);

                                  final weatherOfNextDay = context
                                          .read<WeatherForecastCubit>()
                                          .mapDayToWeather[days[index]] ??
                                      [];

                                  final firstWeatherOfNextDay =
                                      weatherOfNextDay.isNotEmpty
                                          ? weatherOfNextDay[0]
                                          : null;

                                  if (firstWeatherOfNextDay != null) {
                                    context
                                        .read<CurrentWeatherCubit>()
                                        .showWeather(firstWeatherOfNextDay);
                                  }
                                }
                              }
                            },
                            isSelected: showing != null
                                ? showing == days[index]
                                : index == 0,
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
