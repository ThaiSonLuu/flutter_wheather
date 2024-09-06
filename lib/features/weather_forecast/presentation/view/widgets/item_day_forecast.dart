import 'package:flutter/material.dart';
import 'package:flutter_weather/features/weather_forecast/presentation/utils/shimmer.dart';
import 'package:intl/intl.dart';

class ItemDayForecast extends StatelessWidget {
  const ItemDayForecast({
    super.key,
    required this.backgroundColor,
    required this.contentColor,
    required this.time,
    required this.isLoading,
    required this.isSelected,
    required this.onTap,
  });

  final Color backgroundColor;
  final Color contentColor;
  final DateTime? time;
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
          border: Border.all(color: Colors.white, width: isSelected ? 1 : 0),
          color: backgroundColor,
        ),
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShimmerLoading(
                    width: 100,
                    height: 16,
                  ),
                  SizedBox(height: 4.0),
                  ShimmerLoading(
                      width: 70,
                      height: 16,
                  ),
                ],
              )
            : Text(DateFormat("EEEE,\nMMM dd").format(time ?? DateTime.now())),
      ),
    );
  }
}
