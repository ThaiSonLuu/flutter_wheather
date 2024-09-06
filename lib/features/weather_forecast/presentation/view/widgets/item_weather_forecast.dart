import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/features/weather_forecast/domain/model/weather_model.dart';
import 'package:flutter_weather/features/weather_forecast/presentation/utils/shimmer.dart';
import 'package:intl/intl.dart';

class ItemWeatherForecast extends StatelessWidget {
  const ItemWeatherForecast({
    super.key,
    required this.backgroundColor,
    required this.contentColor,
    required this.model,
    required this.isLoading,
    required this.isSelected,
    required this.onTap,
  });

  final Color backgroundColor;
  final Color contentColor;
  final WeatherModel? model;
  final bool isLoading;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.white, width: isSelected ? 1.0 : 0.0),
          color: backgroundColor,
        ),
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShimmerLoading(
                    width: 50,
                    height: 16,
                  ),
                  SizedBox(height: 8.0),
                  ShimmerLoading(
                    width: 30,
                    height: 30,
                    borderRadius: 30,
                  ),
                  SizedBox(height: 8.0),
                  ShimmerLoading(
                    width: 70,
                    height: 16,
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(DateFormat("HH:mm").format(model?.time ?? DateTime.now())),
                  const SizedBox(height: 4.0),
                  if (model?.icon != null)
                    CachedNetworkImage(
                      width: 28,
                        height: 28,
                        imageUrl:
                            "https://openweathermap.org/img/wn/${model?.icon}@2x.png"),
                  if (model?.icon == null)
                    const SizedBox(
                      width: 30,
                      height: 30,
                    ),
                  const SizedBox(height: 4.0),
                  Text("${model?.temp ?? "-"} °C"),
                ],
              ),
      ),
    );
  }
}
