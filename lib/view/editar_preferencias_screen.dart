import 'package:date_ideas_app/provider/firebase_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/firestore/firestore_bloc.dart';
import '../bloc/firestore/firestore_event.dart';
import '../model/mock/preferencias_mock.dart';
import '../model/preferencias/Preferencia.dart';
import '../model/preferencias/Preferencias_collection.dart';
import '../widgets/checkbox_widget.dart';
import '../widgets/drop_down_widget.dart';
import '../widgets/radio_button_widget.dart';

class EditarPreferenciasScreen extends StatelessWidget {
  static const route = "/editar_preferencias";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EditarPreferenciasScreen({Key? key}) : super(key: key);

  final CheckBox checkBox = const CheckBox();
  final RadioButton radioButton1 = RadioButton();
  final RadioButton radioButton2 = RadioButton();
  final DropDown dropDown = const DropDown();

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: ListView(children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                        child: Icon(
                      Icons.edit,
                      color: tema.primary,
                      size: 40,
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        child: Text(
                      "Editar",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: tema.primary),
                    )),
                  ],
                ),
                Container(
                    child: Text(
                  "Preferências",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: tema.primary),
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            topicos(context, "Salgados"),
            Container(
              child: Column(
                children: [
                  subtopicos(context, "Salgadinho"),
                  subtopicos(context, "Hamburguer"),
                  subtopicos(context, "Pizza"),
                  subtopicos(context, "Comida Japonesa"),
                  subtopicos(context, "Comida Italiana"),
                  subtopicos(context, "Comida Árabe"),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            topicos(context, "Bebidas Alcoolicas?"),
            Container(
              child: radioButton1,
            ),
            const SizedBox(
              height: 20,
            ),
            topicos(context, "Bebidas"),
            Container(
              child: Column(
                children: [
                  subtopicos(context, "Água"),
                  subtopicos(context, "Suco"),
                  subtopicos(context, "Refrigerante"),
                  enableCheckBox(context)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            topicos(context, "Doces"),
            Container(
              child: Column(
                children: [
                  subtopicos(context, "Chocolate"),
                  subtopicos(context, "Brownie"),
                  subtopicos(context, "Cookies"),
                  subtopicos(context, "Sorvete"),
                  subtopicos(context, "Açaí"),
                  subtopicos(context, "Bolo"),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            topicos(context, "Atividades"),
            Container(
              child: Column(
                children: [
                  subtopicos(context, "Assistir Filme"),
                  subtopicos(context, "Assistir Série"),
                  subtopicos(context, "Assistir Anime"),
                  subtopicos(context, "Ir ao Parque"),
                  subtopicos(context, "Ir ao Cinema"),
                  subtopicos(context, "Ir a um Restaurante"),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            topicos(context, "Escolher Gênero?"),
            Container(
              child: radioButton2,
            ),
            const SizedBox(
              height: 20,
            ),
            topicos(context, "Gêneros Favoritos"),
            Container(
              child: dropDown,
            ),
            const SizedBox(
              height: 20,
            ),
            submitButton(context),
            const SizedBox(
              height: 20,
            ),
          ])),
    );
  }

  Widget titulo(BuildContext context, String texto) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
            child: Text(
          texto,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 40, color: tema.primary),
        )),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget topicos(BuildContext context, String texto) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
            child: Align(
          alignment: Alignment.centerLeft,
          child: Text(texto,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: tema.primary)),
        )),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget subtopicos(BuildContext context, String texto) {
    final tema = Theme.of(context).colorScheme;

    return Row(
      children: [
        checkBox,
        Container(
            child: Text(texto,
                style: TextStyle(fontSize: 20, color: tema.tertiary))),
      ],
    );
  }

  Widget enableCheckBox(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      children: [
        subtopicos(context, "Cerveja"),
        subtopicos(context, "Vinho"),
        subtopicos(context, "Gin&Tônica"),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget submitButton(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return ElevatedButton(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 20,
        child: Row(
          children: [
            Text(
              "Atualizar",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 20,
            ),
            Align(
              child: Icon(
                Icons.arrow_forward,
                color: tema.secondary,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        List<Preferencia> preferenciasList = PreferenciasMock.preferencias;
        PreferenciasCollection preferencias = PreferenciasCollection();

        for (int i = 0; i < preferenciasList.length; i++) {
          preferencias.insertPreferenciaOfId(i.toString(), preferenciasList[i]);
          print(preferenciasList[i].nome);
        }

        // if (formKey.currentState!.validate()) {
        //   // formKey.currentState!.save();

        // }
        BlocProvider.of<FirestoreBloc>(context)
            .add(CriarPreferencias(preferencias: preferencias));
        print(FirestoreServer.helper.uid);
      },
    );
  }
}
