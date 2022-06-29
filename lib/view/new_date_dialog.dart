import 'package:date_ideas_app/bloc/firestore/firestore_bloc.dart';
import 'package:date_ideas_app/bloc/firestore/firestore_event.dart';
import 'package:date_ideas_app/model/mock/dates_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/date_picker.dart';
import '../widgets/number_picker.dart';

class NewDateDialog extends StatelessWidget {
  const NewDateDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: Dialog(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.close,
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                ),
                titulo(context),
                const SizedBox(
                  height: 20,
                ),
                nomeField(context),
                const SizedBox(
                  height: 20,
                ),
                pegarData(context),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Opções",
                    style: TextStyle(fontSize: 15, color: tema.primary),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          numberPicker(context, "Salgados"),
                          numberPicker(context, "Doces"),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        numberPicker(context, "Bebidas"),
                        numberPicker(context, "Atividades"),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                buttonCriar(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget titulo(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Crie seu Date",
        style: TextStyle(
          color: tema.primary,
          fontWeight: FontWeight.bold,
          fontFamily: "Roboto",
          fontSize: 24,
        ),
      ),
    );
  }

  Widget nomeField(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Nome",
            style: TextStyle(fontSize: 12, color: tema.primary),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: tema.primary, width: 0.0),
            ),
            hintText: "Meu Date",
            // border: OutlineInputBorder()
          ),
        ),
      ],
    );
  }

  Widget pegarData(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Data",
            style: TextStyle(fontSize: 12, color: tema.primary),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        DatePickerWidget(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget numberPicker(BuildContext context, String categoria) {
    return Column(
      children: [
        Text(categoria),
        const SizedBox(
          height: 5,
        ),
        const NumberPickerWidget()
      ],
    );
  }

  Widget buttonCriar(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: tema.primary, minimumSize: const Size(200, 50)),
        child: Text(
          "Criar",
          style: TextStyle(color: tema.secondary),
        ),
        onPressed: () {
          BlocProvider.of<FirestoreBloc>(context)
              .add(CriarDate(date: DateMock.getDate()));
        });
  }
}
