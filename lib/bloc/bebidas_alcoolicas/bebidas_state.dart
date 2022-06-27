import 'package:date_ideas_app/widgets/radio_button_widget.dart';

class BebidasState {}

class BebidasStateSim extends BebidasState {
  Enum value = Alcohol.sim;

  BebidasStateSim();
}

class BebidasStateNao extends BebidasState {
  Enum value = Alcohol.nao;

  BebidasStateNao();
}
