import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_ideas_app/bloc/signUp/signup_state.dart';
import 'package:date_ideas_app/model/date.dart';
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

  final CollectionReference dates =
      FirebaseFirestore.instance.collection("dates");

  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  Future<PreferenciasCollection> getPreferencia() async {
    DocumentSnapshot document = await preferencias.doc(uid! + "Pref").get();
    PreferenciasCollection preferenciasRet =
        PreferenciasCollection.fromMap(document.data());
    return preferenciasRet;
  }

  Future<int> inserePreferencia(PreferenciasCollection pref) async {
    print(uid);
    await preferencias
        .doc(uid! + "Pref")
        .set({"prefList": pref.preferenciasFromListToMap()});
    return 42;
  }

  Future<int> updatePreferencia(PreferenciasCollection pref) async {
    await preferencias
        .doc(uid! + "Pref")
        .update({"prefList": pref.preferenciasFromListToMap()});
    return 42;
  }

  Future<int> deletePreferencia() async {
    await preferencias.doc(uid! + "Pref").delete();
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
    DocumentSnapshot doc = await users.doc(uid! + "User").get();
    SignupData signupData = SignupData.fromMap(doc.data());
    return signupData;
  }

  Future<int> insereUser(SignupState signupState) async {
    print("AQUI" + uid!);
    await users.doc(uid! + "User").set({
      "nome": signupState.name,
      "idade": signupState.age,
    });
    return 42;
  }

  Future<int> updateUser(SignupData signupData) async {
    await users.doc(uid! + "User").update({
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
    DocumentSnapshot snapshot = await users.doc(uid! + "User").get();

    return _usersListFromSnapshot(snapshot);
  }

  Stream get stream {
    return users.doc(uid).snapshots().map(_usersListFromSnapshot);
  }

  Future<DateApp> getDate(dateID) async {
    DocumentSnapshot doc = await dates
        .doc(uid! + "Dates")
        .collection("meus_dates")
        .doc(dateID)
        .get();
    DateApp date = DateApp.fromMap(doc.data());
    return date;
  }

  Future<List<DateApp>> getAllDates() async {
    List<DateApp> listaDates = [];

    QuerySnapshot doc =
        await dates.doc(uid! + "Dates").collection("meus_dates").get();

    for (var documento in doc.docs) {
      listaDates.add(DateApp.fromMap(documento.data()));
    }
    return listaDates;
  }

  Future<int> insereDate(DateApp date) async {
    final map = date.toMap();
    await dates.doc(uid! + "Dates").collection("meus_dates").doc().set({
      "nome": map["nome"],
      "data": map["data"],
      "salgados": map["salgados"],
      "doces": map["doces"],
      "bebidas": map["bebidas"],
      "atividades": map["atividades"],
    });
    return 42;
  }

  Future<int> updateDate(dateID, DateApp dateApp) async {
    final map = dateApp.toMap();
    await dates.doc(uid! + "Dates").update({
      "nome": map["nome"],
      "data": map["data"],
      "salgados": map["salgados"],
      "doces": map["doces"],
      "bebidas": map["bebidas"],
      "atividades": map["atividades"],
    });
    return 42;
  }
}
