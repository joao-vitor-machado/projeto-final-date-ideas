import 'package:date_ideas_app/bloc/firestore/firestore_event.dart';
import 'package:date_ideas_app/bloc/firestore/firestore_state.dart';
import 'package:date_ideas_app/provider/firebase_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirestoreBloc extends Bloc<FirestoreEvent, FirestoreState> {
  FirestoreBloc() : super(InsertState()) {
    on<CriarPreferencias>((event, emit) =>
        {FirestoreServer.helper.inserePreferencia(event.preferencias)});

    on<UpdatePreferencias>((event, emit) =>
        {FirestoreServer.helper.inserePreferencia(event.preferencias)});
  }
}
