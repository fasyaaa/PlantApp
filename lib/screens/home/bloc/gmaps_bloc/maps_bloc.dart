import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plant_app/screens/home/bloc/gmaps_bloc/maps_event.dart';

part 'maps_event.dart';
part 'maps_state.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  MapsBloc() : super(MapsInitial()) {
    on<MapsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
