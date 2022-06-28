import 'package:flutter_bloc/flutter_bloc.dart';

import 'generos_event.dart';
import 'generos_state.dart';

class GenerosBloc extends Bloc<GenerosEvent, GenerosState> {
  GenerosBloc() : super(GenerosState()) {
    on<OpEscolhidaSim>((event, emit) => emit(GenerosStateSim()));

    on<OpEscolhidaNao>((event, emit) => emit(GenerosStateNao()));
  }
}
