import 'package:date_ideas_app/model/preferencias/Atividade.dart';
import 'package:date_ideas_app/model/preferencias/Bebida.dart';
import 'package:date_ideas_app/model/preferencias/Salgado.dart';

import 'preferencias/Doce.dart';

class DateApp {
  final String nome;
  final DateTime data;
  final List<String> salgados;
  final List<String> doces;
  final List<String> bebidas;
  final List<String> atividades;

  DateApp({
    required this.nome,
    required this.data,
    required this.salgados,
    required this.doces,
    required this.bebidas,
    required this.atividades,
  });
}
