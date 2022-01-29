import 'package:clean_arhitecture_example_app/data/api/api_util.dart';
import 'package:clean_arhitecture_example_app/domain/model/day.dart';
import 'package:clean_arhitecture_example_app/domain/repository/day_repository.dart';

class DayDataRepository implements DayRepository {
  final ApiUtil _apiUtil;

  DayDataRepository(this._apiUtil);

  @override
  Future<Day> getDay({required double latitude, required double longitude}) {
    return _apiUtil.getDay(latitude: latitude, longitude: longitude);
  }
}
