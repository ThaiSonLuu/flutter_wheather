import 'package:flutter_weather/core/utils/datetime_converter.dart';
import 'package:flutter_weather/features/weather_forecast/domain/model/weather_forecast_model.dart';
import 'package:flutter_weather/features/weather_forecast/domain/model/weather_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_forecast_model_dto.g.dart';

@JsonSerializable()
class WeatherForecastModelDto {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<WeatherForecastData>? list;
  final City? city;

  const WeatherForecastModelDto({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  factory WeatherForecastModelDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastModelDtoToJson(this);

  WeatherForecastModel toWeatherForecastModel() {
    final List<WeatherModel>? convertedList = list?.map((e) {
      return WeatherModel(
        time: e.dtTxt,
        weatherId: e.weather?.isNotEmpty ?? false ? e.weather?.first.id : null,
        weatherTitle: e.weather?.isNotEmpty ?? false
            ? e.weather?.first.main
            : null,
        icon: e.weather?.isNotEmpty ?? false ? e.weather?.first.icon : null,
        temp: e.main?.temp,
        tempMin: e.main?.tempMin,
        tempMax: e.main?.tempMax,
        visibility: e.visibility,
        windSpeed: e.wind?.speed,
      );
    }).toList();
    return WeatherForecastModel(convertedList);
  }
}

@JsonSerializable()
class WeatherForecastData {
  final int? dt;
  final Main? main;
  final List<Weather>? weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  final double? pop;
  final Rain? rain;
  final Sys? sys;
  @DatetimeConverter()
  @JsonKey(name: 'dt_txt')
  final DateTime? dtTxt;

  const WeatherForecastData({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    this.dtTxt,
  });

  factory WeatherForecastData.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastDataToJson(this);
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
  @JsonKey(name: 'sea_level')
  final int? seaLevel;
  @JsonKey(name: 'grnd_level')
  final int? grndLevel;
  final int? humidity;
  @JsonKey(name: 'temp_kf')
  final int? tempKf;

  const Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) =>
      _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
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
  @JsonKey(name: "3h")
  final double? threeHour;

  const Rain({
    this.threeHour,
  });

  factory Rain.fromJson(Map<String, dynamic> json) =>
      _$RainFromJson(json);

  Map<String, dynamic> toJson() => _$RainToJson(this);
}

@JsonSerializable()
class Sys {
  final String? pod;

  const Sys({
    this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) =>
      _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);
}

@JsonSerializable()
class City {
  final int? id;
  final String? name;
  final Coord? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  const City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) =>
      _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class Coord {
  final double? lat;
  final double? lon;

  const Coord({
    this.lat,
    this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) =>
      _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);
}
