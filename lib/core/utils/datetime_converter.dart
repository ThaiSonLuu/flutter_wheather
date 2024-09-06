import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class DatetimeConverter implements JsonConverter<DateTime, String> {
  const DatetimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) =>
      DateFormat("YYYY-MM-dd HH:mm:ss").format(object);

}
