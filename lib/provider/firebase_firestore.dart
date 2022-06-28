import 'package:cloud_firestore/cloud_firestore.dart';

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

  // Ponto de acesso com o servidor
  final CollectionReference preferencias =
      FirebaseFirestore.instance.collection("preferencias");

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
}
