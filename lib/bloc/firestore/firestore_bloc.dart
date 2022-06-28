import 'package:date_ideas_app/bloc/firestore/firestore_event.dart';
import 'package:date_ideas_app/bloc/firestore/firestore_state.dart';
import 'package:date_ideas_app/provider/firebase_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirestoreBloc extends Bloc<FirestoreEvent, FirestoreState> {
  FirestoreBloc() : super(InsertState()) {
    on<CriarPreferencias>((event, emit) async {
      FirestoreServer.helper.inserePreferencia(event.preferencias);
      FirestoreServer.helper.preferenciasUser =
          await FirestoreServer.helper.getPreferencia();
    });

    on<UpdatePreferencias>((event, emit) async {
      FirestoreServer.helper.inserePreferencia(event.preferencias);
      FirestoreServer.helper.preferenciasUser =
          await FirestoreServer.helper.getPreferencia();
    });

    on<GetPreferencias>((event, emit) async {
      FirestoreServer.helper.preferenciasUser =
          await FirestoreServer.helper.getPreferencia();

      print(FirestoreServer.helper.preferenciasUser);
    });
  }
}
