import 'Preferencia.dart';

class Doce extends Preferencia {
  String nome = "";
  bool isPreferencia = false;

  Doce({
    String nome = "",
    bool isPreferencia = false,
  }) : super.withData(nome: nome, isPreferencia: isPreferencia);
}
