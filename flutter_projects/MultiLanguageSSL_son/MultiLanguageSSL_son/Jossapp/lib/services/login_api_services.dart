// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jossapp/constants/api_constants.dart';
import 'package:jossapp/model/user_response.dart';

class LoginApiServices {
  final String? userId;
  final String? password;

  Dio dio = Dio(BaseOptions(
      baseUrl: ApiConstants.myBaseUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000));

  LoginApiServices({required this.userId, required this.password});

  LoginApiServices copyWith({
    String? userId,
    String? password,
  }) {
    return LoginApiServices(
        userId: userId ?? this.userId, password: password ?? this.password);
  }

  Future postLoginApi() async {
    Map<String, dynamic> postBody = {"username": userId, "password": password};
    try {
      var response = await dio.post("login", data: postBody);

      if (response.statusCode == 200) {
        var loginInfo = jsonDecode(response.data);
        var user = UserResponse.fromMap(loginInfo);
        if (user.result == true &&
            user.errorCode == 1 &&
            user.response!.isNotEmpty) {
          return user.response;
        } else {
          throw Exception("Invalid User");
        }
      } //birdaha denesene
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw Exception("g-err-con-timeout".tr());
      } else if (e.type == DioErrorType.cancel) {
        throw Exception("g-err-req-cancelled".tr());
      } else if (e.type == DioErrorType.receiveTimeout) {
        throw Exception("g-err-recive-timeout".tr());
      } else if (e.type == DioErrorType.response) {
        throw Exception("g-err-srv-error".tr());
      } else if (e.type == DioErrorType.other) {
        throw Exception("g-err-unx-error".tr());
      } else if (e.type == DioErrorType.sendTimeout) {
        throw Exception("g-err-url-timeout".tr());
      }

      //return 500;
    }
  }
}
