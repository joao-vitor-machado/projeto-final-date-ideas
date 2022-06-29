import 'package:date_ideas_app/bloc/firestore/firestore_bloc.dart';
import 'package:date_ideas_app/bloc/firestore/firestore_event.dart';
import 'package:date_ideas_app/model/mock/preferencias_mock.dart';
import 'package:date_ideas_app/model/preferencias/Preferencia.dart';
import 'package:date_ideas_app/model/preferencias/Preferencias_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/login.dart';
import '../widgets/slider_bar_widget.dart';

class EditarPerfilScreen extends StatelessWidget {
  static const route = "/editar_perfil";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SignupData signupData = SignupData();

  final SliderBar sliderBar = SliderBar();

  EditarPerfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
          child: ListView(
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
                  titulo(context, "Editar Perfil"),
                ],
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      formField(context, "Nome"),
                      nameFormField(context),
                      formField(context, "Idade"),
                      sliderBar,
                      formField(context, "Username"),
                      usernameFormField(context),
                      formField(context, "Senha"),
                      passwordFormField(context),
                      submitButton(context),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget titulo(BuildContext context, String texto) {
    final tema = Theme.of(context).colorScheme;
    return Container(
        child: Text(
      texto,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 40, color: tema.primary),
    ));
  }

  Widget formField(BuildContext context, String texto) {
    final tema = Theme.of(context).colorScheme;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            texto,
            style: TextStyle(fontSize: 20, color: tema.primary),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget nameFormField(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.name,
          onSaved: (String? inValue) {
            signupData.name = inValue ?? "";
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: tema.primary,
            )),
            hintText: "Name",
          ),
        ),
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
        TextFormField(
          keyboardType: TextInputType.name,
          validator: (String? inValue) {
            if (inValue != null) {
              if (inValue.isEmpty) {
                return "Insira um nome de usuário";
              }
            }
            return null;
          },
          onSaved: (String? inValue) {
            signupData.username = inValue ?? "";
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: tema.primary,
            )),
            hintText: "Username",
          ),
        ),
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
        TextFormField(
          obscureText: true,
          validator: (String? inValue) {
            if (inValue != null) {
              if (inValue.length < 6) {
                return "Mínimo de 6 letras";
              }
            }
            return null;
          },
          onSaved: (String? inValue) {
            signupData.password = inValue ?? "";
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: tema.primary,
            )),
            hintText: "******",
          ),
        ),
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
        width: MediaQuery.of(context).size.width * 0.7,
        height: 40,
        child: Row(
          children: const [
            Text("Atualizar"),
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
          formKey.currentState!.save();
        }
      },
    );
  }
}
