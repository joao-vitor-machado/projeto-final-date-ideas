import '../../widgets/widget_radio_button_bebidas.dart';

class BebidasState {}

class BebidasStateSim extends BebidasState {
  Enum value = Alcohol.sim;

  BebidasStateSim();
}

class BebidasStateNao extends BebidasState {
  Enum value = Alcohol.nao;

  BebidasStateNao();
}
