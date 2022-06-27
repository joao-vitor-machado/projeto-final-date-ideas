import '../../widgets/widget_radio_button_bebidas.dart';

class BebidasEvent {}

class OpEscolhidaSim extends BebidasEvent {
  Enum value = Alcohol.sim;

  OpEscolhidaSim();
}

class OpEscolhidaNao extends BebidasEvent {
  Enum value = Alcohol.nao;

  OpEscolhidaNao();
}
