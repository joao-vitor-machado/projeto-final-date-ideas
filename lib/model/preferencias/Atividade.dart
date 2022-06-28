import 'Preferencia.dart';

class Atividade extends Preferencia {
  String nome = "";
  bool isPreferencia = false;

  Atividade({
    String nome = "",
    bool isPreferencia = false,
  }) : super.withData(nome: nome, isPreferencia: isPreferencia);
}
