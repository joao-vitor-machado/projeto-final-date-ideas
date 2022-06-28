import 'package:date_ideas_app/model/date.dart';
import 'package:date_ideas_app/model/preferencias/Atividade.dart';
import 'package:date_ideas_app/model/preferencias/Bebida.dart';
import 'package:date_ideas_app/model/preferencias/Preferencias_collection.dart';
import 'package:date_ideas_app/model/preferencias/Salgado.dart';
import 'package:date_ideas_app/provider/firebase_firestore.dart';

import 'preferencias/Doce.dart';

class DateBuilder {
  String _nome = "";
  DateTime _data = DateTime.now();
  int _numSalgados = 0;
  int _numDoces = 0;
  int _numBebidas = 0;
  int _numAtividades = 0;

  DateBuilder.withData(
      {nome = "",
      data = null,
      numSalgados = 0,
      numDoces = 0,
      numBebidas = 0,
      numAtividades = 0}) {
    _nome = nome;
    _data = data == null ? DateTime.now() : data;
    _numSalgados = numSalgados;
    _numDoces = numDoces;
    _numBebidas = numBebidas;
    _numAtividades = numAtividades;
  }

  // Date build(String uid) {
  DateBuilder copyWith({
    String? nome,
    DateTime? data,
    int? numSalgados,
    int? numDoces,
    int? numBebidas,
    int? numAtividades,
  }) {
    return DateBuilder.withData(
      nome: nome ?? this.nome,
      data: data ?? this.data,
      numSalgados: numSalgados ?? this.numSalgados,
      numDoces: numDoces ?? this.numDoces,
      numBebidas: numBebidas ?? this.numBebidas,
      numAtividades: numAtividades ?? this.numAtividades,
    );
  }

  DateApp build(PreferenciasCollection preferenciasCollection) {
    List<String> salgados = [];
    List<String> doces = [];
    List<String> bebidas = [];
    List<String> atividades = [];

    for (int i = 0; i < numSalgados; i++) {
      salgados.add(preferenciasCollection.getSalgados()[i].nome);
    }
    for (int i = 0; i < numDoces; i++) {
      doces.add(preferenciasCollection.getDoces()[i].nome);
    }
    for (int i = 0; i < numBebidas; i++) {
      bebidas.add(preferenciasCollection.getBebidas()[i].nome);
    }
    for (int i = 0; i < numAtividades; i++) {
      atividades.add(preferenciasCollection.getAtividades()[i].nome);
    }

    return DateApp(
        nome: nome,
        data: data,
        salgados: salgados,
        doces: doces,
        bebidas: bebidas,
        atividades: atividades);
  }

  String get nome => _nome;
  DateTime get data => _data;
  int get numSalgados => _numSalgados;
  int get numDoces => _numDoces;
  int get numBebidas => _numBebidas;
  int get numAtividades => _numAtividades;

  set nome(String nome) {
    _nome = nome;
  }

  set data(DateTime time) {
    _data = time;
  }

  set numSalgados(int numSalgados) {
    _numSalgados = numSalgados;
  }

  set numDoces(int numDoces) {
    _numDoces = numDoces;
  }

  set numBebidas(int numBebidas) {
    _numBebidas = numBebidas;
  }

  set numAtividades(int numAtividades) {
    _numAtividades = numAtividades;
  }
}
