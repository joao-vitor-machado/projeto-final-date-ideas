import 'package:date_ideas_app/widgets/widget_radio_button_generos.dart';

class GenerosEvent {}

class OpEscolhidaSim extends GenerosEvent {
  Enum value = Genero.sim;

  OpEscolhidaSim();
}

class OpEscolhidaNao extends GenerosEvent {
  Enum value = Genero.nao;

  OpEscolhidaNao();
}
