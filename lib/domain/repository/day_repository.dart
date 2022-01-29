import 'package:clean_arhitecture_example_app/domain/model/day.dart';

abstract class DayRepository {
  Future<Day> getDay({
    required double latitude,
    required double longitude,
  });
}
