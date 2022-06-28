import 'Preferencia.dart';

class Bebida extends Preferencia {
  String nome = "";
  bool isPreferencia = false;

  Bebida({
    String nome = "",
    bool isPreferencia = false,
  }) : super.withData(nome: nome, isPreferencia: isPreferencia);
}
