import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'maps_bloc.dart';
import 'maps_event.dart';
import 'maps_state.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MapBloc()..add(InitializeMap()),
      child: const MapView(),
    );
  }
}

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _ctrl = Completer();

  void _confirmSelection(String pickedAddress) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Konfirmasi Alamat'),
        content: Text(pickedAddress),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context, pickedAddress);
            },
            child: const Text('pilih'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        if (state.isLoading || state.currentLocation == null) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        return Scaffold(
          appBar: AppBar(title: const Text("Pilih Alamat")),
          body: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: state.currentLocation!,
                  zoom: 10,
                ),
                onMapCreated: (controller) => _ctrl.complete(controller),
                myLocationEnabled: true,
                onTap: (latLng) =>
                    context.read<MapBloc>().add(LocationPicked(latLng)),
                markers: state.pickedMarker != null
                    ? {state.pickedMarker!}
                    : {},
              ),
              Positioned(
                top: 25,
                left: 50,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(state.currentAddress ?? 'Kosong'),
                ),
              ),
              if (state.pickedAddress != null)
                Positioned(
                  bottom: 120,
                  left: 16,
                  right: 16,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        state.pickedAddress!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.pickedAddress != null)
                FloatingActionButton.extended(
                  onPressed: () =>
                      _confirmSelection(state.pickedAddress!),
                  label: const Text('Pilih alamat'),
                ),
              const SizedBox(height: 8),
              if (state.pickedAddress != null)
                FloatingActionButton.extended(
                  onPressed: () => context.read<MapBloc>().add(ClearPickedLocation()),
                  label: const Text('Hapus alamat'),
                ),
            ],
          ),
        );
      },
    );
  }
}