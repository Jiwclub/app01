import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/login_model.dart';

class HomeApi {
  final dio = Dio();
  Future<LoginModel?> login(String username, String password) async {
    try {
      final response = await dio.post(
        options: Options(headers: {'Content-Type': 'application/json'}),
        'https://dummyjson.com/auth/login',
        data: {
          "username": username,
          "password": password,
        },
      );
      log('response : ${response.data}');
      return LoginModel.fromJson(response.data);
    } on Exception {
      // TODO
    }
    return null;
  }
}
