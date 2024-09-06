import 'package:flutter/material.dart';
import 'package:flutter_weather/features/weather_forecast/domain/model/weather_model.dart';
import 'package:flutter_weather/gen/assets.gen.dart';

extension WeatherExtension on WeatherModel? {

  // Return the path of the background image for weather ID
  String getBackgroundImage() {
    if (this == null) {
      return Assets.images.fewClouds.path;
    }

    if (this!.weatherId == null) {
      return Assets.images.fewClouds.path;
    }

    if (this!.weatherId! >= 200 && this!.weatherId! <= 232) {
      return Assets.images.thunderstorm.path;
    } else if (this!.weatherId! >= 300 && this!.weatherId! <= 321) {
      return Assets.images.drizzle.path;
    } else if (this!.weatherId! == 521) {
      return Assets.images.showerRain.path;
    } else if (this!.weatherId! >= 500 && this!.weatherId! <= 531) {
      return Assets.images.rain.path;
    } else if (this!.weatherId! >= 600 && this!.weatherId! <= 622) {
      return Assets.images.snow.path;
    } else if (this!.weatherId! >= 701 && this!.weatherId! <= 707) {
      return Assets.images.mist.path;
    } else if (this!.weatherId! == 800) {
      return Assets.images.clearSky.path;
    } else if (this!.weatherId! == 801) {
      return Assets.images.fewClouds.path;
    } else if (this!.weatherId! == 802) {
      return Assets.images.scatteredClouds.path;
    } else if (this!.weatherId! == 803) {
      return Assets.images.brokenClouds.path;
    } else if (this!.weatherId! == 804) {
      return Assets.images.orvercastCloud.path;
    } else {
      return Assets.images.fewClouds.path;
    }
  }

  Color getBackgroundColor() {
    if (this == null) {
      return const Color(0xFF2C79C9).withOpacity(0.6);
    }

    if (this!.weatherId == null) {
      return const Color(0xFF2C79C9).withOpacity(0.6);
    }

    if (this!.weatherId! >= 200 && this!.weatherId! <= 232) {
      return const Color(0xFF011234).withOpacity(0.6);
    } else if (this!.weatherId! >= 300 && this!.weatherId! <= 321) {
      return const Color(0xFF1B2228).withOpacity(0.6);
    } else if (this!.weatherId! == 521) {
      return const Color(0xFF030D10).withOpacity(0.6);
    } else if (this!.weatherId! >= 500 && this!.weatherId! <= 531) {
      return const Color(0xFF25486A).withOpacity(0.6);
    } else if (this!.weatherId! >= 600 && this!.weatherId! <= 622) {
      return const Color(0xFFEEF3FD).withOpacity(0.6);
    } else if (this!.weatherId! >= 701 && this!.weatherId! <= 707) {
      return const Color(0xFFC7C8CA).withOpacity(0.6);
    } else if (this!.weatherId! == 800) {
      return const Color(0xFF369CDA).withOpacity(0.6);
    } else if (this!.weatherId! == 801) {
      return const Color(0xFF2C79C9).withOpacity(0.6);
    } else if (this!.weatherId! == 802) {
      return const Color(0xFF1462A9).withOpacity(0.6);
    } else if (this!.weatherId! == 803) {
      return const Color(0xFFB4B7B1).withOpacity(0.6);
    } else if (this!.weatherId! == 804) {
      return const Color(0xFF151C2E).withOpacity(0.6);
    } else {
      return const Color(0xFFFFFFFF).withOpacity(0.6);
    }
  }

  Color getContentColor() {
    if (this == null) {
      return Colors.white;
    }

    if (this!.weatherId == null) {
      return Colors.white;
    }

    if (this!.weatherId! >= 200 && this!.weatherId! <= 232) {
      return Colors.white;
    } else if (this!.weatherId! >= 300 && this!.weatherId! <= 321) {
      return Colors.white;
    } else if (this!.weatherId! == 521) {
      return Colors.white;
    } else if (this!.weatherId! >= 500 && this!.weatherId! <= 531) {
      return Colors.white;
    } else if (this!.weatherId! >= 600 && this!.weatherId! <= 622) {
      return Colors.black;
    } else if (this!.weatherId! >= 701 && this!.weatherId! <= 707) {
      return Colors.black;
    } else if (this!.weatherId! == 800) {
      return Colors.white;
    } else if (this!.weatherId! == 801) {
      return Colors.white;
    } else if (this!.weatherId! == 802) {
      return Colors.white;
    } else if (this!.weatherId! == 803) {
      return Colors.black;
    } else if (this!.weatherId! == 804) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}