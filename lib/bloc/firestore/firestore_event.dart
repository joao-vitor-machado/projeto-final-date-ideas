import 'package:date_ideas_app/model/preferencias/Preferencias_collection.dart';

import '../signUp/signup_state.dart';

abstract class FirestoreEvent {}

class CriarPreferencias extends FirestoreEvent {
  PreferenciasCollection preferencias;

  CriarPreferencias({required this.preferencias});
}

class UpdatePreferencias extends FirestoreEvent {
  PreferenciasCollection preferencias;

  UpdatePreferencias({required this.preferencias});
}

class GetPreferencias extends FirestoreEvent {}

class CriarUser extends FirestoreEvent {
  SignupState signupState;

  CriarUser({required this.signupState});
}
