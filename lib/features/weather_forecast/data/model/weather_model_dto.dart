import 'package:flutter_weather/features/weather_forecast/domain/model/weather_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_model_dto.g.dart';

@JsonSerializable()
class WeatherModelDto {
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Rain? rain;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  const WeatherModelDto({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.rain,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory WeatherModelDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelDtoToJson(this);

  WeatherModel toWeatherModel() {
    return WeatherModel(
        time: DateTime.now(),
        weatherId: weather?.isNotEmpty ?? false ? weather?.first.id : null,
        weatherTitle: weather?.isNotEmpty ?? false ? weather?.first.main : null,
        icon: weather?.isNotEmpty ?? false ? weather?.first.icon : null,
        temp: main?.temp,
        tempMin: main?.tempMin,
        tempMax: main?.tempMax,
        visibility: visibility,
        windSpeed: wind?.speed,
    );
  }
}

@JsonSerializable()
class Coord {
  final double? lon;
  final double? lat;

  const Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) =>
      _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);
}

@JsonSerializable()
class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Main {
  final double? temp;
  @JsonKey(name: 'feels_like')
  final double? feelsLike;
  @JsonKey(name: 'temp_min')
  final double? tempMin;
  @JsonKey(name: 'temp_max')
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  @JsonKey(name: 'sea_level')
  final int? seaLevel;
  @JsonKey(name: 'grnd_level')
  final int? grndLevel;

  const Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) =>
      _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}

@JsonSerializable()
class Wind {
  final double? speed;
  final int? deg;
  final double? gust;

  const Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) =>
      _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}

@JsonSerializable()
class Rain {
  @JsonKey(name: "1h")
  final double? oneHour;
  @JsonKey(name: "3h")
  final double? threeHour;

  const Rain({
    this.oneHour,
    this.threeHour,
  });

  factory Rain.fromJson(Map<String, dynamic> json) =>
      _$RainFromJson(json);

  Map<String, dynamic> toJson() => _$RainToJson(this);
}

@JsonSerializable()
class Clouds {
  final int? all;

  const Clouds({
    this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) =>
      _$CloudsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@JsonSerializable()
class Sys {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  const Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) =>
      _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);
}
