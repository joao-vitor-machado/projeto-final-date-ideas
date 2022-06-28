import 'package:date_ideas_app/bloc/monitor_signUp/monitor_signup_event.dart';
import 'package:date_ideas_app/bloc/monitor_signUp/monitor_signup_state.dart';
import 'package:date_ideas_app/model/login_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../provider/firebase_firestore.dart';

class MonitorSignupBloc extends Bloc<MonitorSignupEvent, MonitorSignupState> {
  SignupCollection signupCollection = SignupCollection();

  MonitorSignupBloc()
      : super(MonitorSignupState(signupCollection: SignupCollection())) {
    // Leitura da Stream:
    FirestoreServer.helper.stream.listen((event) {
      signupCollection = event;
      add(UpdateSignupList());
    });

    on<AskNewSignupList>((event, emit) async {
      signupCollection = await FirestoreServer.helper.getSignupList();
      emit(MonitorSignupState(signupCollection: signupCollection));
    });

    on<UpdateSignupList>((event, emit) {
      emit(MonitorSignupState(signupCollection: signupCollection));
    });

    add(AskNewSignupList());
  }
}
