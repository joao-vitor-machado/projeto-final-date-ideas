import '../date.dart';

class DateMock {
  static int count = 0;
  static final List<DateApp> dates = [
    DateApp(
      nome: "Date Ulisses",
      data: DateTime.now(),
      salgados: ["Salgadinho", "Comida Italiana"],
      doces: ["Chocolate"],
      bebidas: ["Água"],
      atividades: ["Assistir Filme"],
    ),
    DateApp(
      nome: "Date Danielle",
      data: DateTime.utc(2022, 7, 23),
      salgados: ["Salgadinho", "Comida Italiana"],
      doces: ["Brownie"],
      bebidas: ["Vinho"],
      atividades: ["Assistir Anime"],
    ),
    DateApp(
      nome: "CineDate",
      data: DateTime.utc(2022, 6, 29),
      salgados: ["Salgadinho"],
      doces: ["Chocolate", "Bolo"],
      bebidas: ["Água"],
      atividades: ["Assistir Filme"],
    ),
    DateApp(
      nome: "Date Bauds",
      data: DateTime.now(),
      salgados: ["Salgadinho", "Comida Italiana"],
      doces: ["chocolate milka"],
      bebidas: ["Refrigerante"],
      atividades: ["Triplo mortal carpado"],
    ),
    DateApp(
      nome: "Date Sid",
      data: DateTime.utc(2022, 5, 7),
      salgados: ["Salgadinho", "Comida Italiana"],
      doces: ["chocolate milka"],
      bebidas: ["Refrigerante"],
      atividades: ["Triplo mortal carpado"],
    ),
    DateApp(
      nome: "Date com a cremosa",
      data: DateTime.utc(2022, 5, 23),
      salgados: ["Salgadinho", "Comida Italiana"],
      doces: ["chocolate milka"],
      bebidas: ["Refrigerante"],
      atividades: ["Triplo mortal carpado"],
    ),
    DateApp(
      nome: "Date Bauds",
      data: DateTime.now(),
      salgados: ["Coxinha", "Pão de queijo"],
      doces: ["chocolate milka"],
      bebidas: ["Refrigerante"],
      atividades: ["Triplo mortal carpado"],
    ),
    DateApp(
      nome: "Date Sid",
      data: DateTime.utc(2022, 5, 7),
      salgados: ["Coxinha", "Pão de queijo"],
      doces: ["chocolate milka"],
      bebidas: ["Refrigerante"],
      atividades: ["Triplo mortal carpado"],
    ),
    DateApp(
      nome: "Date com a cremosa",
      data: DateTime.utc(2022, 5, 23),
      salgados: ["Coxinha", "Pão de queijo"],
      doces: ["chocolate milka"],
      bebidas: ["Refrigerante"],
      atividades: ["Triplo mortal carpado"],
    ),
    DateApp(
      nome: "Date Bauds",
      data: DateTime.now(),
      salgados: ["Coxinha", "Pão de queijo"],
      doces: ["chocolate milka"],
      bebidas: ["Refrigerante"],
      atividades: ["Triplo mortal carpado"],
    ),
    DateApp(
      nome: "Date Sid",
      data: DateTime.utc(2022, 5, 7),
      salgados: ["Coxinha", "Pão de queijo"],
      doces: ["chocolate milka"],
      bebidas: ["Refrigerante"],
      atividades: ["Triplo mortal carpado"],
    ),
    DateApp(
      nome: "Date com a cremosa",
      data: DateTime.utc(2022, 5, 23),
      salgados: ["Coxinha", "Pão de queijo"],
      doces: ["chocolate milka"],
      bebidas: ["Refrigerante"],
      atividades: ["Triplo mortal carpado"],
    ),
    DateApp(
      nome: "Date Bauds",
      data: DateTime.now(),
      salgados: ["Coxinha", "Pão de queijo"],
      doces: ["chocolate milka"],
      bebidas: ["Refrigerante"],
      atividades: ["Triplo mortal carpado"],
    ),
    DateApp(
      nome: "Date Sid",
      data: DateTime.utc(2022, 5, 7),
      salgados: ["Coxinha", "Pão de queijo"],
      doces: ["chocolate milka"],
      bebidas: ["Refrigerante"],
      atividades: ["Triplo mortal carpado"],
    ),
    DateApp(
      nome: "Date com a cremosa",
      data: DateTime.utc(2022, 5, 23),
      salgados: ["Coxinha", "Pão de queijo"],
      doces: ["chocolate milka"],
      bebidas: ["Refrigerante"],
      atividades: ["Triplo mortal carpado"],
    ),
  ];

  static DateApp getDate() {
    var date = dates[count];
    count++;
    return date;
  }
}
