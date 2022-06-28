import 'package:date_ideas_app/bloc/signUp/signup_state.dart';

import '../../model/login_collection.dart';

abstract class StorageEvent {}

class SubmitEvent extends StorageEvent {
  SignupState signupState;
  SubmitEvent({required this.signupState});
}

class UpdateCancel extends StorageEvent {}
