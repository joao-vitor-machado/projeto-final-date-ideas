import 'package:cloud_firestore/cloud_firestore.dart';
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
  SignupCollection? usersCollection;

  // Ponto de acesso com o servidor
  final CollectionReference preferencias =
      FirebaseFirestore.instance.collection("preferencias");

  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  Future<PreferenciasCollection> getPreferencia(preferenciasID) async {
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

  Future<SignupData> getUser(signupId) async {
    DocumentSnapshot doc =
        await users.doc(uid).collection("userList").doc(signupId).get();
    SignupData signupData = SignupData.fromMap(doc.data());
    return signupData;
  }

  Future<int> insereUser(SignupCollection signupCollection) async {
    await users.doc(uid).collection("userList").add({
      "idList": signupCollection.idList,
      "signupList": signupCollection.userFromListToMap()
    });
    return 42;
  }

  Future<int> updateUser(signupId, SignupData signupData) async {
    await users.doc(uid).collection("userList").doc(signupId).update({
      "nome": signupData.name,
      "idade": signupData.age,
    });
    return 42;
  }

  SignupCollection _usersListFromSnapshot(QuerySnapshot snapshot) {
    SignupCollection signupCollection;
    for (var doc in snapshot.docs) {
      signupCollection = SignupCollection.fromMap(doc.data());

      return signupCollection;
    }
    return SignupCollection();
  }

  Future<SignupCollection> getSignupList() async {
    QuerySnapshot snapshot = await users.doc(uid).collection("userList").get();

    return _usersListFromSnapshot(snapshot);
  }

  Stream get stream {
    return users
        .doc(uid)
        .collection("userList")
        .snapshots()
        .map(_usersListFromSnapshot);
  }
}
