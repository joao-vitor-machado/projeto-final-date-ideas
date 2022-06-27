import '../../widgets/radio_button_widget.dart';

class BebidasEvent {}

class OpEscolhidaSim extends BebidasEvent {
  Enum value = Alcohol.sim;

  OpEscolhidaSim();
}

class OpEscolhidaNao extends BebidasEvent {
  Enum value = Alcohol.nao;

  OpEscolhidaNao();
}
