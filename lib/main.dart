import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_weather/config/theme/app_theme.dart';
import 'package:flutter_weather/core/cubit/app_language/app_language_cubit.dart';
import 'package:flutter_weather/di/injection_container.dart';
import 'package:flutter_weather/features/weather_forecast/presentation/logic/current_weather/current_weather_cubit.dart';
import 'package:flutter_weather/features/weather_forecast/presentation/view/weather_screen.dart';
import 'package:flutter_weather/gen/assets.gen.dart';
import 'package:flutter_weather/generated/l10n.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppLanguageCubit()..loadLanguageCode(),
      child: BlocBuilder<AppLanguageCubit, AppLanguageState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.dark,
            locale: Locale(state.languageCode),
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            home: const WeatherScreen(),
          );
        },
      ),
    );
  }
}
