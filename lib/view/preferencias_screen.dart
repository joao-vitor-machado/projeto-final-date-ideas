import 'package:date_ideas_app/bloc/bebidas_alcoolicas/bebidas_bloc.dart';
import 'package:date_ideas_app/bloc/bebidas_alcoolicas/bebidas_event.dart';
import 'package:date_ideas_app/bloc/bebidas_alcoolicas/bebidas_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/generos/generos_bloc.dart';
import '../bloc/generos/generos_state.dart';
import '../widgets/checkbox_widget.dart';
import '../widgets/drop_down_widget.dart';
import '../widgets/widget_radio_button_bebidas.dart';
import '../widgets/widget_radio_button_generos.dart';
import 'main_screen.dart';

class PreferenciasScreen extends StatelessWidget {
  static const route = "/preferencias";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PreferenciasScreen({Key? key}) : super(key: key);

  final CheckBox checkBox = const CheckBox();
  final RadioButtonBebidas radioButton1 = RadioButtonBebidas();
  final RadioButtonGeneros radioButton2 = RadioButtonGeneros();
  final DropDown dropDown = const DropDown();

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: tema.primary,
        elevation: 0,
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: ListView(children: [
            titulo(context, "Suas Preferências"),
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
                  BlocBuilder<BebidasBloc, BebidasState>(
                      builder: (context, state) {
                    if (state is BebidasStateSim) {
                      return enableCheckBox(context, radioButton1.alcohol);
                    }
                    return Container(
                      height: 0,
                    );
                  }),
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
            BlocBuilder<GenerosBloc, GenerosState>(builder: (context, state) {
              if (state is GenerosStateSim) {
                return Column(
                  children: [
                    topicos(context, "Gêneros Favoritos"),
                    Container(
                      child: dropDown,
                    ),
                  ],
                );
              }
              return Container(
                height: 0,
              );
            }),
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

  Widget enableCheckBox(BuildContext context, Enum radioButton) {
    final tema = Theme.of(context).colorScheme;
    return Column(
      children: [
        subtopicos(context, "Cerveja"),
        subtopicos(context, "Vinho"),
        subtopicos(context, "Gin&Tônica"),
      ],
    );
  }

  Widget submitButton(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return ElevatedButton(
      child: Container(
        child: Row(
          children: [
            Text(
              "Cadastrar",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 20,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.arrow_forward,
                color: tema.secondary,
                size: 20,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        // print("object");
        Navigator.pushNamed(context, MainScreen.route);
        // if (formKey.currentState!.validate()) {
        //   formKey.currentState!.save();
        // }
      },
    );
  }
}
