import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/generos/generos_bloc.dart';
import '../bloc/generos/generos_event.dart';

class RadioButtonGeneros extends StatefulWidget {
  RadioButtonGeneros({Key? key}) : super(key: key);

  Genero? _genero = Genero.sim;
  get genero => _genero;

  @override
  State<StatefulWidget> createState() {
    return RadioButtonGenerosState();
  }
}

enum Genero { sim, nao }

class RadioButtonGenerosState extends State<RadioButtonGeneros> {
  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Sim',
              style: TextStyle(fontSize: 20, color: Colors.grey)),
          leading: Radio<Genero>(
            activeColor: tema.primary,
            value: Genero.sim,
            groupValue: widget.genero,
            onChanged: (Genero? value) {
              setState(() {
                widget._genero = value;
                BlocProvider.of<GenerosBloc>(context).add(OpEscolhidaSim());
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Não',
              style: TextStyle(fontSize: 20, color: Colors.grey)),
          leading: Radio<Genero>(
            activeColor: tema.primary,
            value: Genero.nao,
            groupValue: widget.genero,
            onChanged: (Genero? value) {
              setState(() {
                widget._genero = value;
                BlocProvider.of<GenerosBloc>(context).add(OpEscolhidaNao());
              });
            },
          ),
        ),
      ],
    );
  }
}
