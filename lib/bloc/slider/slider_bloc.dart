import 'package:bloc/bloc.dart';
import 'package:date_ideas_app/bloc/slider/slider_event.dart';
import 'package:date_ideas_app/bloc/slider/slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc(SliderState initialState) : super(initialState) {
    on<ChangeNumber>(
        (event, emit) => emit(SliderState(sliderValue: event.value)));
  }
}
