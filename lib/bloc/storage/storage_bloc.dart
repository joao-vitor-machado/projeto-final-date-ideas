import 'package:date_ideas_app/bloc/storage/storage_event.dart';
import 'package:date_ideas_app/bloc/storage/storage_state.dart';
import 'package:date_ideas_app/provider/firebase_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StorageBloc extends Bloc<StorageEvent, StorageState> {
  StorageBloc() : super(InsertState()) {
    on<SubmitEvent>((event, emit) {
      if (state is InsertState) {
        FirestoreServer.helper.insereUser(event.signupCollection);
      }
    });
  }
}
