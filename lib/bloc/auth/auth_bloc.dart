import 'package:flutter_bloc/flutter_bloc.dart';
import '../../provider/firebase_auth.dart';
import '../../provider/firebase_firestore.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthenticationService _authenticationService =
      FirebaseAuthenticationService();

  AuthBloc() : super(Unauthenticated()) {
    _authenticationService.user.listen((event) {
      add(AuthServerEvent(event));
    });

    on<AuthServerEvent>((event, emit) async {
      if (event.user == null) {
        emit(Unauthenticated());
      } else {
        FirestoreServer.helper.uid = event.user!.uuid;
        emit(Authenticated(user: event.user!));
      }
    });
    on<RegisterUser>((event, emit) async {
      try {
        var uid = await _authenticationService.createUserWithEmailAndPassword(
            event.username, event.password);
        FirestoreServer.helper.uid = uid!.uuid;
      } catch (e) {
        emit(AuthError(message: "Impossível Registrar: ${e.toString()}"));
      }
    });
    on<LoginUser>((event, emit) async {
      try {
        await _authenticationService.signInWithEmailAndPassword(
            event.username, event.password);
      } catch (e) {
        emit(AuthError(
            message:
                "Impossível Logar com ${event.username}: ${e.toString()}"));
      }
    });
    on<Logout>((event, emit) async {
      try {
        await _authenticationService.signOut();
      } catch (e) {
        emit(AuthError(message: "Impossível Efetuar Logout: ${e.toString()}"));
      }
    });
  }
}
