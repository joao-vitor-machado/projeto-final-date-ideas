import 'package:date_ideas_app/bloc/bebidas_alcoolicas/bebidas_bloc.dart';
import 'package:date_ideas_app/bloc/bebidas_alcoolicas/bebidas_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioButtonBebidas extends StatefulWidget {
  RadioButtonBebidas({Key? key}) : super(key: key);

  Alcohol? _alcohol = Alcohol.sim;
  get alcohol => _alcohol;

  @override
  State<StatefulWidget> createState() {
    return RadioButtonBebidasState();
  }
}

enum Alcohol { sim, nao }

class RadioButtonBebidasState extends State<RadioButtonBebidas> {
  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Sim',
              style: TextStyle(fontSize: 20, color: Colors.grey)),
          leading: Radio<Alcohol>(
            activeColor: tema.primary,
            value: Alcohol.sim,
            groupValue: widget.alcohol,
            onChanged: (Alcohol? value) {
              setState(() {
                widget._alcohol = value;
                BlocProvider.of<BebidasBloc>(context).add(OpEscolhidaSim());
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Não',
              style: TextStyle(fontSize: 20, color: Colors.grey)),
          leading: Radio<Alcohol>(
            activeColor: tema.primary,
            value: Alcohol.nao,
            groupValue: widget.alcohol,
            onChanged: (Alcohol? value) {
              setState(() {
                widget._alcohol = value;
                BlocProvider.of<BebidasBloc>(context).add(OpEscolhidaNao());
              });
            },
          ),
        ),
      ],
    );
  }
}
