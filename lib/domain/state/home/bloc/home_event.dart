part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeFetch extends HomeEvent {
  final double latitude;
  final double longitude;
  HomeFetch({
    required this.latitude,
    required this.longitude,
  });
}
