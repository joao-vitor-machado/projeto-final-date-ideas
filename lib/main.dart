<<<<<<< HEAD
import 'package:date_ideas_app/bloc/firestore/firestore_bloc.dart';
=======
import 'package:date_ideas_app/bloc/bebidas_alcoolicas/bebidas_bloc.dart';
>>>>>>> e4ad8582610be9a313e261b781713e41e74df5b1
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth/auth_bloc.dart';
import 'bloc/auth/auth_state.dart';
import 'bloc/generos/generos_bloc.dart';
import 'bloc/slider/slider_bloc.dart';
import 'bloc/slider/slider_state.dart';
import 'view/cadastro_screen.dart';
import 'view/editar_perfil_screen.dart';
import 'view/editar_preferencias_screen.dart';
import 'view/login_screen.dart';
import 'view/main_screen.dart';
import 'view/preferencias_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(providers: [
<<<<<<< HEAD
    BlocProvider<SliderBloc>(create: (_) => SliderBloc(SliderState())),
    BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
    BlocProvider<FirestoreBloc>(create: (_) => FirestoreBloc()),
=======
    BlocProvider<SliderBloc>(
      create: (_) => SliderBloc(SliderState()),
    ),
    BlocProvider(create: (_) => AuthBloc()),
    BlocProvider(create: (_) => BebidasBloc()),
    BlocProvider(create: (_) => GenerosBloc()),
>>>>>>> e4ad8582610be9a313e261b781713e41e74df5b1
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final tema = ThemeData(brightness: Brightness.light);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return MaterialApp(
        initialRoute: LoginScreen.route,
        routes: {
          //LoginScreen.route: (context) => LoginScreen(),
          MainScreen.route: (context) => MainScreen(),
          CadastroScreen.route: (context) => CadastroScreen(),
          PreferenciasScreen.route: (context) => PreferenciasScreen(),
          EditarPerfilScreen.route: (context) => EditarPerfilScreen(),
          EditarPreferenciasScreen.route: (context) =>
              EditarPreferenciasScreen(),
        },
        title: 'Flutter Demo',
        theme: tema.copyWith(
            colorScheme: tema.colorScheme.copyWith(
          primary: Color.fromRGBO(177, 0, 255, 1),
          secondary: Colors.white,
          tertiary: Colors.grey,
        )),
        home: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthError) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Erro do Firebase"),
                    content: Text(state.message),
                  );
                });
          }
        }, builder: ((context, state) {
          if (state is Authenticated) {
            return MainScreen();
          } else {
            return LoginScreen();
          }
        })));
  }
}
