import '../../model/login_collection.dart';

abstract class StorageEvent {}

class SubmitEvent extends StorageEvent {
  SignupCollection signupCollection;
  SubmitEvent({required this.signupCollection});
}

class UpdateCancel extends StorageEvent {}
