import 'package:date_ideas_app/bloc/signUp/signup_bloc.dart';
import 'package:date_ideas_app/bloc/signUp/signup_event.dart';
import 'package:date_ideas_app/bloc/signUp/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderBar extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return BlocBuilder<SignupBloc, SignupState>(
      builder: ((context, state) => Slider(
            activeColor: tema.primary,
            min: 10,
            max: 80,
            value: state.age,
            divisions: 70,
            label: state.age.toString(),
            onChanged: (double inValue) {
              BlocProvider.of<SignupBloc>(context)
                  .add(SignupAgeChanged(age: inValue));
            },
          )),
    );
  }
}
