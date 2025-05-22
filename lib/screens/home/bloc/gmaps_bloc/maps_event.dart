import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitializeMap extends MapsEvent {}

class LocationPicked extends MapsEvent {
  final LatLng latLng;

  LocationPicked(this.latLng);

  @override
  List<Object?> get props => [latLng];
}

class ClearPickedLocation extends MapsEvent {}