import 'package:date_ideas_app/model/preferencias/Atividade.dart';
import 'package:date_ideas_app/model/preferencias/Bebida.dart';
import 'package:date_ideas_app/model/preferencias/Preferencias_collection.dart';
import 'package:date_ideas_app/model/preferencias/Salgado.dart';

import '../preferencias/Doce.dart';
import '../preferencias/Preferencia.dart';

class PreferenciasMock {
  static final List<Preferencia> preferencias = [
    Salgado(nome: "Salgadinho", isPreferencia: true),
    Salgado(nome: "Comida Congelada", isPreferencia: false),
    Salgado(nome: "Fast Food", isPreferencia: false),
    Salgado(nome: "Comida Árabe", isPreferencia: false),
    Salgado(nome: "Comida Japonesa", isPreferencia: true),
    Salgado(nome: "Comida Italiana", isPreferencia: false),
    Salgado(nome: "Pizza", isPreferencia: true),
    Bebida(nome: "Água", isPreferencia: true),
    Bebida(nome: "Suco", isPreferencia: false),
    Bebida(nome: "Refrigerante", isPreferencia: false),
    Bebida(nome: "Cerveja", isPreferencia: false),
    Bebida(nome: "Vinho", isPreferencia: true),
    Bebida(nome: "Destilados", isPreferencia: false),
    Doce(nome: "Chocolate", isPreferencia: true),
    Doce(nome: "Sorvete", isPreferencia: true),
    Doce(nome: "Brownie", isPreferencia: false),
    Doce(nome: "Cookie", isPreferencia: false),
    Doce(nome: "Açaí", isPreferencia: false),
    Doce(nome: "Bolo", isPreferencia: true),
    Atividade(nome: "Ver Filmes", isPreferencia: true),
    Atividade(nome: "Ver Séries", isPreferencia: false),
    Atividade(nome: "Ver Animes", isPreferencia: true),
    Atividade(nome: "Passear no Parque", isPreferencia: false),
    Atividade(nome: "Fazer Compras", isPreferencia: false),
    Atividade(nome: "Ir ao Cinema", isPreferencia: false),
  ];
}
