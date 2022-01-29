import 'package:clean_arhitecture_example_app/data/api/api_util.dart';
import 'package:clean_arhitecture_example_app/data/api/service/sunrise_service.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    _apiUtil ??= ApiUtil(SunriseService());
    return _apiUtil!;
  }
}
