class WeatherModel {
  final DateTime? time;
  final int? weatherId;
  final String? weatherTitle;
  final String? icon;
  final double? temp;
  final double? tempMin;
  final double? tempMax;
  final int? visibility;
  final double? windSpeed;

  WeatherModel({
    this.time,
    this.weatherId,
    this.weatherTitle,
    this.icon,
    this.temp,
    this.tempMin,
    this.tempMax,
    this.visibility,
    this.windSpeed,
  });
}
