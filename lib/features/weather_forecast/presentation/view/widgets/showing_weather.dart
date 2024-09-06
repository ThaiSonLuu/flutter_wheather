import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/features/weather_forecast/domain/model/weather_model.dart';
import 'package:flutter_weather/features/weather_forecast/presentation/utils/shimmer.dart';
import 'package:flutter_weather/features/weather_forecast/presentation/utils/weather_extension.dart';
import 'package:intl/intl.dart';

class ShowingWeather extends StatelessWidget {
  const ShowingWeather({
    super.key,
    required this.data,
    required this.isLoading,
  });

  final WeatherModel? data;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: data?.getBackgroundColor() ??
            const Color(0xFF369CDA).withOpacity(0.6),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 60.0,
      ),
      child: isLoading ? _buildLoading() : _buildContentWithData(context),
    );
  }

  Column _buildContentWithData(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Hanoi"),
        Text(
          DateFormat("HH:mm EEEE").format(data?.time ?? DateTime.now()),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(data?.weatherTitle ?? "-"),
            if (data?.icon != null)
              CachedNetworkImage(
                width: 30,
                height: 30,
                imageUrl:
                    "https://openweathermap.org/img/wn/${data?.icon}@2x.png",
              )
          ],
        ),
        const SizedBox(height: 20),
        Text(
          "${data?.temp} °C",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 20),
        Text(
          "Min: ${data?.tempMin ?? "-"}°C Max: ${data?.tempMax ?? "-"}°C",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          "Visibility: ${data?.visibility} km",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          "Wind speed: ${data?.windSpeed} m/s",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Column _buildLoading() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShimmerLoading(
          width: 80,
          height: 20,
        ),
        SizedBox(height: 8),
        ShimmerLoading(
          width: 120,
          height: 20,
        ),
        SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShimmerLoading(
              width: 50,
              height: 20,
            ),
            SizedBox(width: 10),
            ShimmerLoading(
              width: 30,
              height: 30,
              borderRadius: 30,
            )
          ],
        ),
        SizedBox(height: 20),
        ShimmerLoading(
          width: 140,
          height: 40,
        ),
        SizedBox(height: 20),
        ShimmerLoading(
          width: 200,
          height: 20,
        ),
        SizedBox(height: 8),
        ShimmerLoading(
          width: 160,
          height: 20,
        ),
        SizedBox(height: 8),
        ShimmerLoading(
          width: 190,
          height: 20,
        ),
      ],
    );
  }
}
