import 'package:clean_arhitecture_example_app/data/api/model/api_day.dart';
import 'package:clean_arhitecture_example_app/domain/model/day.dart';

class DayMapper {
  static Day fromApi(ApiDay day) => Day(
        sunrise: DateTime.tryParse(day.sunrise) ?? DateTime(0),
        sunset: DateTime.tryParse(day.sunset) ?? DateTime(0),
        solarNoon: DateTime.tryParse(day.solarNoon) ?? DateTime(0),
        dayLength: day.dayLength.toInt(),
      );
}
