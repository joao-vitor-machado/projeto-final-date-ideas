import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_ideas_app/bloc/signUp/signup_state.dart';
import 'package:date_ideas_app/model/login_collection.dart';

import '../model/login.dart';
import '../model/preferencias/Preferencia.dart';
import '../model/preferencias/Preferencias_collection.dart';

class FirestoreServer {
  // Atributo que irá afunilar todas as consultas
  static FirestoreServer helper = FirestoreServer._createInstance();
  // Construtor privado
  FirestoreServer._createInstance();

  // uid do usuário logado
  String? uid;
  PreferenciasCollection? preferenciasUser;
  SignupData? user;

  // Ponto de acesso com o servidor
  final CollectionReference preferencias =
      FirebaseFirestore.instance.collection("preferencias");

  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  Future<PreferenciasCollection> getPreferencia() async {
    DocumentSnapshot document = await preferencias.doc(uid).get();
    PreferenciasCollection preferenciasRet =
        PreferenciasCollection.fromMap(document.data());
    return preferenciasRet;
  }

  Future<int> inserePreferencia(PreferenciasCollection pref) async {
    await preferencias
        .doc(uid)
        .set({"prefList": pref.preferenciasFromListToMap()});
    return 42;
  }

  Future<int> updatePreferencia(PreferenciasCollection pref) async {
    await preferencias
        .doc(uid)
        .update({"prefList": pref.preferenciasFromListToMap()});
    return 42;
  }

  Future<int> deletePreferencia(prefID) async {
    await preferencias.doc(uid).delete();
    return 42;
  }

  PreferenciasCollection _preferenciasListFromSnapshot(QuerySnapshot snapshot) {
    PreferenciasCollection prefCollection;
    for (var doc in snapshot.docs) {
      // print(doc.data());
      prefCollection = PreferenciasCollection.fromMap(doc.data());
      return prefCollection;
    }

    return PreferenciasCollection();
  }

  // Future<PreferenciasCollection> getPreferenciasList() async {
  //   QuerySnapshot snapshot =
  //       await preferencias.doc(uid).collection("minhas_preferencias").get();

  //   return _preferenciasListFromSnapshot(snapshot);
  // }

  // Stream get stream {
  //   return preferencias
  //       .doc(uid)
  //       .collection("minhas_preferencias")
  //       .snapshots()
  //       .map(_preferenciasListFromSnapshot);
  // }

  Future<SignupData> getUser() async {
    DocumentSnapshot doc = await users.doc(uid).get();
    SignupData signupData = SignupData.fromMap(doc.data());
    return signupData;
  }

  Future<int> insereUser(SignupState signupState) async {
    await users.doc(uid).set({"signupList": signupState.toMap()});
    return 42;
  }

  Future<int> updateUser(signupId, SignupData signupData) async {
    await users.doc(uid).update({
      "nome": signupData.name,
      "idade": signupData.age,
    });
    return 42;
  }

  SignupCollection _usersListFromSnapshot(DocumentSnapshot snapshot) {
    SignupCollection signupCollection;

    signupCollection = SignupCollection.fromMap(snapshot.data());
    return signupCollection;
  }

  Future<SignupCollection> getSignupList() async {
    DocumentSnapshot snapshot = await users.doc(uid).get();

    return _usersListFromSnapshot(snapshot);
  }

  Stream get stream {
    return users.doc(uid).snapshots().map(_usersListFromSnapshot);
  }
}
