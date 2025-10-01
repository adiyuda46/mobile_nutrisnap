import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tes1_event.dart';
part 'tes1_state.dart';

class Tes1Bloc extends Bloc<Tes1Event, Tes1State> {
  Tes1Bloc() : super(Tes1Initial()) {
    on<Tes1Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
