import 'package:date_ideas_app/model/preferencias/Atividade.dart';
import 'package:date_ideas_app/model/preferencias/Bebida.dart';
import 'package:date_ideas_app/model/preferencias/Preferencias_collection.dart';
import 'package:date_ideas_app/model/preferencias/Salgado.dart';

import '../preferencias/Doce.dart';
import '../preferencias/Preferencia.dart';

class PreferenciasMock {
  static final List<Preferencia> preferencias = [
    Salgado(nome: "Salgadinho", isPreferencia: true),
    Salgado(nome: "Hamburguer", isPreferencia: false),
    Salgado(nome: "Pizza", isPreferencia: false),
    Salgado(nome: "Comida Japonesa", isPreferencia: false),
    Salgado(nome: "Comida Italiana", isPreferencia: true),
    Salgado(nome: "Comida Árabe", isPreferencia: false),
    Bebida(nome: "Água", isPreferencia: true),
    Bebida(nome: "Suco", isPreferencia: false),
    Bebida(nome: "Refrigerante", isPreferencia: false),
    Bebida(nome: "Cerveja", isPreferencia: false),
    Bebida(nome: "Vinho", isPreferencia: true),
    Bebida(nome: "Gin&Tônica", isPreferencia: false),
    Doce(nome: "Chocolate", isPreferencia: true),
    Doce(nome: "Brownie", isPreferencia: true),
    Doce(nome: "Cookies", isPreferencia: false),
    Doce(nome: "Sorvete", isPreferencia: false),
    Doce(nome: "Açaí", isPreferencia: false),
    Doce(nome: "Bolo", isPreferencia: true),
    Atividade(nome: "Assistir Filme", isPreferencia: true),
    Atividade(nome: "Assistir Série", isPreferencia: false),
    Atividade(nome: "Assistir Anime", isPreferencia: true),
    Atividade(nome: "Ir ao Parque", isPreferencia: false),
    Atividade(nome: "Ir ao Cinema", isPreferencia: false),
    Atividade(nome: "Ir a um Restaurante", isPreferencia: false),
  ];
}
