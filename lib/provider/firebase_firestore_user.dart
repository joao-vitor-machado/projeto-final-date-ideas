/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_ideas_app/model/login.dart';
import '../model/login_collection.dart';

class FirestoreServer {
  // Atributo que irá afunilar todas as consultas
  static FirestoreServer helper = FirestoreServer._createInstance();
  // Construtor privado
  FirestoreServer._createInstance();

  // uid do usuário logado
  String? uid;

  // Ponto de acesso com o servidor
  final CollectionReference signupCollection =
      FirebaseFirestore.instance.collection("Users");

  Future<SignupData> getUser(signupId) async {
    DocumentSnapshot doc = await signupCollection
        .doc(uid)
        .collection("date_ideas_users")
        .doc(signupId)
        .get();
    SignupData signupData = SignupData.fromMap(doc.data());
    return signupData;
  }

  Future<int> insertUser(SignupData signupData) async {
    await signupCollection.doc(uid).collection("date_ideas_users").add({
      "nome": signupData.name,
      "idade": signupData.age,
    });
    return 42;
  }

  Future<int> updateUser(signupId, SignupData signupData) async {
    await signupCollection
        .doc(uid)
        .collection("date_ideas_users")
        .doc(signupId)
        .update({
      "nome": signupData.name,
      "idade": signupData.age,
    });
    return 42;
  }

  SignupCollection _usersListFromSnapshot(QuerySnapshot snapshot) {
    SignupCollection signupCollection = SignupCollection();
    for (var doc in snapshot.docs) {
      SignupData signupData = SignupData.fromMap(doc.data());
      signupCollection.insertUserOfId(doc.id, signupData);
    }
    return signupCollection;
  }

  Future<SignupCollection> getSignupList() async {
    QuerySnapshot snapshot =
        await signupCollection.doc(uid).collection("date_ideas_users").get();

    return _usersListFromSnapshot(snapshot);
  }

  Stream get stream {
    return signupCollection
        .doc(uid)
        .collection("date_ideas_users")
        .snapshots()
        .map(_usersListFromSnapshot);
  }
}*/
