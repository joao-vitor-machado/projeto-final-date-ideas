import 'package:date_ideas_app/model/preferencias/Atividade.dart';
import 'package:date_ideas_app/model/preferencias/Bebida.dart';
import 'package:date_ideas_app/model/preferencias/Salgado.dart';

import 'Doce.dart';

class Preferencia {
  String _nome = "";
  bool _isPreferencia = false;

  Preferencia() {
    _nome = "";
    _isPreferencia = false;
  }

  Preferencia.withData({nome = "", isPreferencia = false}) {
    this._nome = nome;
    this._isPreferencia = isPreferencia;
  }

  Preferencia.fromMap(map) {
    nome = map['nome'];
    isPreferencia = map['isPreferencia'];

    if (map["categoria"] == "salgado") {
      Salgado(nome: nome, isPreferencia: isPreferencia);
    } else if (map["categoria"] == "doce") {
      Doce(nome: nome, isPreferencia: isPreferencia);
    } else if (map["categoria"] == "bebida") {
      Bebida(nome: nome, isPreferencia: isPreferencia);
    } else if (map["categoria"] == "atividade") {
      Atividade(nome: nome, isPreferencia: isPreferencia);
    }
  }

  Map toMap() {
    Map map = Map<String, dynamic>();
    map["nome"] = _nome;
    map["isPreferencia"] = _isPreferencia;
    if (this is Salgado) {
      map["categoria"] = "salgado";
    } else if (this is Doce) {
      map["categoria"] = "doce";
    } else if (this is Bebida) {
      map["categoria"] = "bebida";
    } else if (this is Atividade) {
      map["categoria"] = "atividade";
    }

    return map;
  }

  String get nome => _nome;
  bool get isPreferencia => _isPreferencia;

  set nome(String nome) {
    _nome = nome;
  }

  set isPreferencia(bool isPref) {
    _isPreferencia = isPref;
  }
}
