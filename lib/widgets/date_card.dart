import 'package:flutter/material.dart';
import '../model/date.dart';
import '../view/date_dialog.dart';

class DateCard extends StatelessWidget {
  final DateApp dateApp;
  const DateCard({Key? key, required this.dateApp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final tema = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => DateDialog(
                  dateApp: dateApp,
                ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              height: screen.height * 0.2,
              width: screen.width * 0.75,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [tema.primary, Colors.deepPurple],
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    nomeDate(context),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          salgadosList(context),
                          docesList(context),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dateElementsListGenerate(BuildContext context, List<String> list) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list
          .map((element) => Text(
                element,
                style: TextStyle(color: tema.secondary),
              ))
          .toList(),
    );
  }

  Widget nomeDate(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return Row(
      children: [
        Text(
          dateApp.nome,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: tema.secondary,
            fontFamily: "Roboto",
          ),
        )
      ],
    );
  }

  Widget salgadosList(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          "Salgados",
          style: TextStyle(color: tema.secondary, fontWeight: FontWeight.bold),
        ),
        dateElementsListGenerate(context, dateApp.salgados),
      ],
    );
  }

  Widget docesList(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          "Doces",
          style: TextStyle(color: tema.secondary, fontWeight: FontWeight.bold),
        ),
        dateElementsListGenerate(context, dateApp.doces)
      ],
    );
  }
}
