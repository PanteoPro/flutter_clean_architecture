import 'package:clean_arhitecture_example_app/domain/state/home/bloc/home_bloc.dart';
import 'package:clean_arhitecture_example_app/internal/dependencies/repository_module.dart';

class HomeModule {
  static HomeBloc homeBloc() {
    return HomeBloc(dayRepository: RepositoryModule.dayRepository());
  }
}
