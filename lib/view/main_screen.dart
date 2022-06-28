import 'package:carousel_slider/carousel_slider.dart';
import 'package:date_ideas_app/bloc/firestore/firestore_bloc.dart';
import 'package:date_ideas_app/bloc/firestore/firestore_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/mock/dates_mock.dart';
import '../widgets/date_card.dart';
import '../widgets/date_tile.dart';
import '../widgets/drawer_widget.dart';
import 'new_date_dialog.dart';

class MainScreen extends StatelessWidget {
  static const route = "/mainScreen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: tema.primary,
        elevation: 0,
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (e) => const DrawerWidget(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                saudacoes(context),
                datesDeHoje(context),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Próximos Dates:",
                        style: TextStyle(
                            color: tema.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      novoDateButton(context),
                    ],
                  ),
                ),
                dateList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  newDateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const NewDateDialog();
        });
  }

  Widget renderDateCards(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    List<int> indexes = [];
    for (int i = 0; i < DateMock.dates.length; i++) {
      if (DateMock.dates[i].data.month == DateTime.now().month &&
          DateMock.dates[i].data.day == DateTime.now().day) {
        indexes.add(i);
      }
    }
    if (indexes.isNotEmpty) {
      return CarouselSlider(
          options: CarouselOptions(autoPlay: false),
          items: indexes
              .map((index) => DateCard(dateApp: DateMock.dates[index]))
              .toList());
    } else {
      return Container(
        height: screen.height * 0.3,
        child: const Center(
          child: Text("Nenhum date hoje ;-;"),
        ),
      );
    }
  }

  Widget saudacoes(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
        "Olá, Fulano!",
        style: TextStyle(
            color: tema.primary,
            fontFamily: "Roboto",
            fontSize: 40,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget datesDeHoje(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Dates de hoje:",
              style: TextStyle(
                  color: tema.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        renderDateCards(context),
      ],
    );
  }

  Widget novoDateButton(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return TextButton(
      onPressed: () => newDateDialog(context),
      child: Text(
        "Novo Date +",
        style: TextStyle(color: tema.secondary),
      ),
      style: TextButton.styleFrom(
          backgroundColor: tema.primary, minimumSize: Size(60, 40)),
    );
  }

  Widget dateList(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
        children: DateMock.dates
            .map((element) => DateTile(dataApp: element))
            .toList(),
      ),
    );
  }
}
