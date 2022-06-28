import 'package:date_ideas_app/model/preferencias/Preferencias_collection.dart';

abstract class FirestoreEvent {}

class CriarPreferencias extends FirestoreEvent {
  PreferenciasCollection preferencias;

  CriarPreferencias({required this.preferencias});
}

class UpdatePreferencias extends FirestoreEvent {
  PreferenciasCollection preferencias;

  UpdatePreferencias({required this.preferencias});
}
