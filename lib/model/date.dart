import 'package:date_ideas_app/model/preferencias/Atividade.dart';
import 'package:date_ideas_app/model/preferencias/Bebida.dart';
import 'package:date_ideas_app/model/preferencias/Salgado.dart';

import 'preferencias/Doce.dart';

class DateApp {
  String uid = "";
  String nome = "";
  DateTime data = DateTime.now();
  List<String> salgados = [];
  List<String> doces = [];
  List<String> bebidas = [];
  List<String> atividades = [];

  DateApp({
    required this.nome,
    required this.data,
    required this.salgados,
    required this.doces,
    required this.bebidas,
    required this.atividades,
  });

  DateApp.fromMap(map) {
    nome = map["nome"];
    data = map["data"].toDate();
    salgados = map["salgados"].cast<String>();
    doces = map["doces"].cast<String>();
    bebidas = map["bebidas"].cast<String>();
    atividades = map["atividades"].cast<String>();
  }

  Map toMap() {
    Map<String, Object?> map = Map<String, Object?>();

    map["nome"] = nome;
    map["data"] = data;
    map["salgados"] = salgados;
    map["doces"] = doces;
    map["bebidas"] = bebidas;
    map["atividades"] = atividades;

    return map;
  }
}
