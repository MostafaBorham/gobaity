part of 'location_manager_cubit.dart';

@immutable
abstract class LocationManagerState {}

class LocationInitial extends LocationManagerState {}

class LoadingLocationState extends LocationInitial {}

class LocationLoaded extends LocationInitial {
  final double latitude;
  final double longitude;
  LocationLoaded({
    required this.latitude,
    required this.longitude,
  });
}

class RefreshLocation extends LocationInitial {}

class LoadingLocationFailed extends LocationInitial {
  final String message;

  LoadingLocationFailed({
    required this.message,
  });
}
