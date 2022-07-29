import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pointz/models/user_details_Response.dart';

import '../../constants/strings.dart';

class UserRegisterationServices {
  late Dio dio;
  final String currentLang;
  String latestErrorMessage = "";

  UserRegisterationServices({this.currentLang = "ar"}) {
    BaseOptions options = BaseOptions(
        baseUrl: baseURL,
        //baseUrl for my api
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000,
        /*contentType: "application/json",*/

        headers: {});
    dio = Dio(options);
  }

  Future<String> postNewUser(
      {required String firebaseToken,
      required Map<String, dynamic> user,
      required BuildContext context}) async {
    dio.options.headers = {
      'Authorization': 'Bearer $firebaseToken',
      "Content-Type": "application/json"
    };

    print("hhhhhhhhhhhhh");
    try {
      Response response = await dio.post("customer", data: user);
      if (response.statusCode == 200) {
        return "true";
      } else {
        return "false";
      }
    } on DioError catch (e) {
      if (e.response!.data["Error"] != null) {
        String errorMessage = e.response!.data["Error"]["Description"];
        if (errorMessage ==
            json.encode(["A customer with the same email already exist"])) {
          return "Sorry: No registration has been done, because this email has already been registered"
              .tr();
        } else {
          return errorMessage;
        }
      } else {
        return e.message.toString();
      }
    }
  }

  Future<dynamic> getUserDetails({
    required String firebaseToken,
    required Map<String, dynamic> user,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $firebaseToken',
      "Content-Type": "application/json"
    };

    print("hhhhhhhhhhhhh");
    try {
      Response response =
          await dio.post("customer/byPhoneAndTokenUpdate", data: user);
      if (response.statusCode == 200) {
        return UserDeatailsResponse.fromJson(response.data);
      } else {
        return "false";
      }
    } on DioError catch (e) {
      print(e.response?.data.toString());
      print(e.message);
      return false;
    }
  }
}
