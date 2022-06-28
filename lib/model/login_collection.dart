import 'package:date_ideas_app/model/login.dart';

class SignupCollection {
  List idList = [];
  List<SignupData> signupList = [];

  SignupCollection() {
    idList = [];
    signupList = [];
  }

  int length() {
    return idList.length;
  }

  SignupData getUserAtIndex(int index) {
    return signupList[index];
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

  updateOrInsertUserOfId(String id, SignupData signupData) {
    int index = getIndexOfId(id);
    if (index != -1) {
      signupList[index] = signupData;
    } else {
      idList.add(id);
      signupList.add(signupData);
    }
  }

  updateUserOfId(String id, SignupData signupData) {
    int index = getIndexOfId(id);
    if (index != -1) {
      signupList[index] = signupData;
    }
  }

  insertUserOfId(String id, SignupData signupData) {
    idList.add(id);
    signupList.add(signupData);
  }
}
