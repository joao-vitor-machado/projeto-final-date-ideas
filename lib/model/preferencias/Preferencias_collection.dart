import 'package:date_ideas_app/model/preferencias/Atividade.dart';
import 'package:date_ideas_app/model/preferencias/Bebida.dart';
import 'package:date_ideas_app/model/preferencias/Salgado.dart';

import 'Doce.dart';
import 'Preferencia.dart';

class PreferenciasCollection {
  List idList = [];
  List<Preferencia> prefList = [];

  PreferenciasCollection() {
    idList = [];
    prefList = [];
  }

  int length() {
    return idList.length;
  }

  Preferencia getPreferenciaIndex(int index) {
    return prefList[index];
  }

  String getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(String id) {
    for (int i = 0; i < idList.length; i++) {
      if (id == idList[i]) {
        return i;
      }
    }
    return -1;
  }

  updateOrInsertPreferenciaOfId(String id, Preferencia pref) {
    int index = getIndexOfId(id);
    if (index != -1) {
      prefList[index] = pref;
    } else {
      idList.add(id);
      prefList.add(pref);
    }
  }

  updatePreferenciaOfId(String id, Preferencia pref) {
    int index = getIndexOfId(id);
    if (index != -1) {
      prefList[index] = pref;
    }
  }

  deletePreferenciaOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      prefList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertPreferenciaOfId(String id, Preferencia pref) {
    idList.add(id);
    prefList.add(pref);
  }

  cleanPreferencias() {
    for (int i = 0; i < prefList.length; i++) {
      if (prefList[i].isPreferencia == false) {
        deletePreferenciaOfId(idList[i]);
      }
    }
  }

  List<Map> preferenciasFromListToMap() {
    List<Map> list = [];

    prefList.forEach((preferencia) {
      list.add(preferencia.toMap());
    });

    return list;
  }

  PreferenciasCollection.fromMap(map) {
    idList = [];
    print(map);
    List preferencesListMap = map["prefList"];

    prefList = [];
    int index = 0;
    preferencesListMap.forEach((prefMap) {
      idList.add(index);
      prefList.add(Preferencia.fromMap(prefMap));
    });
  }

  Map toMap() {
    Map map = Map();

    map["prefList"] = preferenciasFromListToMap();

    return map;
  }

  List<Salgado> getSalgados() {
    List<Salgado> salgados = [];

    prefList.forEach((preferencia) {
      if (preferencia is Salgado) {
        salgados.add(preferencia);
      }
    });

    return salgados;
  }

  List<Doce> getDoces() {
    List<Doce> doces = [];

    prefList.forEach((preferencia) {
      if (preferencia is Doce) {
        doces.add(preferencia);
      }
    });

    return doces;
  }

  List<Bebida> getBebidas() {
    List<Bebida> bebidas = [];

    prefList.forEach((preferencia) {
      if (preferencia is Bebida) {
        bebidas.add(preferencia);
      }
    });

    return bebidas;
  }

  List<Atividade> getAtividades() {
    List<Atividade> atividades = [];

    prefList.forEach((preferencia) {
      if (preferencia is Atividade) {
        atividades.add(preferencia);
      }
    });

    return atividades;
  }
}
