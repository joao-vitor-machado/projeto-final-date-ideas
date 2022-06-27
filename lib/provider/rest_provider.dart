import 'package:dio/dio.dart';

import '../bloc/signUp/signup_state.dart';

class RestServer {
  // Atributo que irá afunilar todas as consultas
  static RestServer helper = RestServer._createInstance();

  // Construtor privado
  RestServer._createInstance();

  final Dio _dio = Dio();
  String prefixUrl =
      "https://projeto-final-date-ideas-default-rtdb.firebaseio.com/";
  String suffixUrl = "/.json";

  Future<int> insertSignupData(SignupState signupData) async {
    try {
      Response response = await _dio.post(
        prefixUrl + suffixUrl,
        data: signupData.toMap(),
      );
    } catch (error) {
      print(error);
      return 400;
    }

    return 200;
  }
}
