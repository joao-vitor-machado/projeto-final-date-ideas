import 'package:flutter/material.dart';
import 'cadastro_screen.dart';
import 'main_screen.dart';

class LoginScreen extends StatelessWidget {
  static const route = "/";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                logoImage(context),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: screen.size.width * 0.8,
                  child: Form(
                      child: Column(
                    children: [
                      username(context),
                      SizedBox(
                        height: screen.size.height * 0.02,
                      ),
                      password(context),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: naoPossuiCadastroAinda(context)),
                    ],
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 20),
                  child: botaoLogin(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logoImage(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            child: Image.asset('assets/logo_v1.png')),
        Text(
          "Snacks n' Date",
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 40,
            color: tema.primary,
          ),
        ),
      ],
    );
  }

  Widget username(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: tema.primary),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          prefixIcon: const Icon(Icons.account_circle),
          labelText: "username",
          border: const OutlineInputBorder()),
    );
  }

  Widget password(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: tema.primary, width: 0.0),
          ),
          prefixIcon: const Icon(Icons.lock),
          labelText: "password",
          border: const OutlineInputBorder()),
    );
  }

  Widget naoPossuiCadastroAinda(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, CadastroScreen.route),
        child: Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            "Não possui cadastro ainda?",
            style: TextStyle(color: Colors.lightBlue),
          ),
        ));
  }

  Widget botaoLogin(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            style: TextButton.styleFrom(
                backgroundColor: tema.primary,
                minimumSize: const Size(200, 50)),
            child: Text(
              "Login",
              style: TextStyle(color: tema.secondary),
            ),
            onPressed: () => Navigator.pushNamed(context, MainScreen.route)),
      ],
    );
  }
}
