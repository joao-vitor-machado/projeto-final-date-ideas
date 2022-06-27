import 'package:date_ideas_app/bloc/bebidas_alcoolicas/bebidas_event.dart';
import 'package:date_ideas_app/bloc/bebidas_alcoolicas/bebidas_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BebidasBloc extends Bloc<BebidasEvent, BebidasState> {
  BebidasBloc() : super(BebidasState()) {
    on<OpEscolhidaSim>((event, emit) => emit(BebidasStateSim()));

    on<OpEscolhidaNao>((event, emit) => emit(BebidasStateNao()));
  }
}
