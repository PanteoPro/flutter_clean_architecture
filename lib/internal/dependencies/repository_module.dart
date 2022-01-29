import 'package:clean_arhitecture_example_app/data/repository/day_data_repository.dart';
import 'package:clean_arhitecture_example_app/domain/repository/day_repository.dart';
import 'package:clean_arhitecture_example_app/internal/dependencies/api_module.dart';

class RepositoryModule {
  static DayRepository? _dayRepository;

  static DayRepository dayRepository() {
    _dayRepository ??= DayDataRepository(ApiModule.apiUtil());
    return _dayRepository!;
  }
}
