import '../../model/date.dart';

abstract class FirestoreState {}

class InsertState extends FirestoreState {}

class GetState extends FirestoreState {}

class Dates extends FirestoreState {
  List<DateApp> dates;

  Dates({required this.dates});
}
