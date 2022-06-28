import 'dart:ffi';

import 'Preferencia.dart';

class Salgado extends Preferencia {
  String nome = "";
  bool isPreferencia = false;

  Salgado({
    String nome = "",
    bool isPreferencia = false,
  }) : super.withData(nome: nome, isPreferencia: isPreferencia);
}
