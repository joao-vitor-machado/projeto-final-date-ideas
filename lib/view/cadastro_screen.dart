import 'package:date_ideas_app/bloc/firestore/firestore_bloc.dart';
import 'package:date_ideas_app/bloc/firestore/firestore_event.dart';
import 'package:date_ideas_app/bloc/firestore/firestore_state.dart';
import 'package:date_ideas_app/bloc/monitor_signUp/monitor_signup_bloc.dart';
import 'package:date_ideas_app/view/preferencias_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../bloc/signUp/signup_bloc.dart';
import '../bloc/signUp/signup_event.dart';
import '../bloc/signUp/signup_state.dart';
import '../bloc/signUp/signup_submission.dart';

import '../model/login_collection.dart';
import '../model/preferencias/Preferencias_collection.dart';
import '../widgets/slider_bar_widget.dart';

class CadastroScreen extends StatelessWidget {
  static const route = "/cadastro";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CadastroScreen({Key? key}) : super(key: key);

  // SignupCollection signupCollection = SignupCollection();

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
          child: ListView(
            children: [
              cabecalho(context, "Bora para um"),
              cabecalho(context, "DATE?"),
              loginForm(context),
            ],
          )),
    );
  }

  Widget loginForm(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
        // listener: (context, state) {
        //   final formStatus = state.formStatus;
        //   if (formStatus is SubmissionFailed) {
        //     _showSnackBar(context, formStatus.exception.toString());
        //   }
        // },
        builder: (context, state) => Container(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    titulo(context, "Nome"),
                    nameFormField(context),
                    titulo(context, "Idade"),
                    SliderBar(),
                    titulo(context, "Email"),
                    usernameFormField(context),
                    titulo(context, "Senha"),
                    passwordFormField(context),
                    BlocBuilder<FirestoreBloc, FirestoreState>(
                        builder: (((context, state) => submitButton(context)))),
                  ],
                ),
              ),
            ));
  }

  Widget nameFormField(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return Column(
      children: [
        BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
          return TextFormField(
            keyboardType: TextInputType.name,
            validator: (value) =>
                state.isValidName ? null : 'Insira um nome válido',
            onChanged: (value) =>
                context.read<SignupBloc>().add(SignupNameChanged(name: value)),
            // onSaved: (String? inValue) {
            //   signupData.name = inValue ?? "";
            // },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: tema.primary,
              )),
              hintText: "Example Name",
            ),
          );
        }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget usernameFormField(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      children: [
        BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
          return TextFormField(
            keyboardType: TextInputType.name,
            validator: (value) =>
                state.isValidUsername ? null : 'Insira um username válido',
            onChanged: (value) => context
                .read<SignupBloc>()
                .add(SignupUsernameChanged(username: value)),
            // onSaved: (String? inValue) {
            //   signupData.username = inValue ?? "";
            // },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: tema.primary,
              )),
              hintText: "Email",
            ),
          );
        }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget passwordFormField(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      children: [
        BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
          return TextFormField(
            obscureText: true,
            validator: (value) => state.isValidPassword
                ? null
                : 'Sua senha deve ter no mínimo 6 caracteres',
            onChanged: (value) => context
                .read<SignupBloc>()
                .add(SignupPasswordChanged(password: value)),
            // onSaved: (String? inValue) {
            //   signupData.password = inValue ?? "";
            // },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: tema.primary,
              )),
              hintText: "******",
            ),
          );
        }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget submitButton(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
              child: Container(
                width: 100,
                height: 40,
                child: Row(
                  children: const [
                    Text("Próximo"),
                    SizedBox(
                      width: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<AuthBloc>(context).add(RegisterUser(
                    username: context.read<SignupBloc>().state.username,
                    password: context.read<SignupBloc>().state.password,
                  ));

                  Navigator.pushNamed(context, PreferenciasScreen.route);
                }
              },
            );
    });
  }

  Widget cabecalho(BuildContext context, String cabecalho) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(cabecalho,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: tema.primary)),
      ],
    );
  }

  Widget titulo(BuildContext context, String titulo) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            titulo,
            style: TextStyle(fontSize: 20, color: tema.primary),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
