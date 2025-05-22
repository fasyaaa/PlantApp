import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState extends Equatable {
  final LatLng? currentLocation;
  final String? currentAddress;
  final Marker? pickedMarker;
  final String? pickedAddress;
  final bool isLoading;

  const MapState({
    this.currentLocation,
    this.currentAddress,
    this.pickedMarker,
    this.pickedAddress,
    this.isLoading = true,
  });

  MapState copyWith({
    LatLng? currentLocation,
    String? currentAddress,
    Marker? pickedMarker,
    String? pickedAddress,
    bool? isLoading,
  }) {
    return MapState(
      currentLocation: currentLocation ?? this.currentLocation,
      currentAddress: currentAddress ?? this.currentAddress,
      pickedMarker: pickedMarker,
      pickedAddress: pickedAddress,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props =>
      [currentLocation, currentAddress, pickedMarker, pickedAddress, isLoading];
}