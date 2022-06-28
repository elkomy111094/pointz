import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

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
        connectTimeout: 5000,
        receiveTimeout: 3000,
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
            json.encode(
                ["A customer with the same phone number already exist"])) {
          return "عفوا:لم يتم التسجيل،لان رقم الهاتف مسجل من قبل";
        } else if (errorMessage ==
            json.encode([
              "A customer with the same email already exist",
              "A customer with the same phone number already exist"
            ])) {
          return "عفوا:لم يتم التسجيل،لان هذا الحساب مسجل من قبل من فضلك توجه الي شاشه تسجيل الدخول";
        } else if (errorMessage ==
            json.encode(["A customer with the same email already exist"])) {
          return "عفوا:لم يتم التسجيل،لان هذا البريد الالكتروني مسجل من قبل";
        } else {
          return errorMessage;
        }
      } else {
        return e.message.toString();
      }
    }
  }

  Future<String> getUserDetails(
      {required String firebaseToken,
      required Map<String, dynamic> user,
      required BuildContext context}) async {
    dio.options.headers = {
      'Authorization': 'Bearer $firebaseToken',
      "Content-Type": "application/json"
    };

    print("hhhhhhhhhhhhh");
    try {
      Response response =
          await dio.post("customer/byPhoneAndTokenUpdate", data: user);
      if (response.statusCode == 200) {
        return "true";
      } else {
        return "false";
      }
    } on DioError catch (e) {
      if (e.response!.data["Error"] != null) {
        String errorMessage = e.response!.data["Error"]["Description"];
        if (errorMessage ==
            json.encode(
                ["A customer with the same phone number already exist"])) {
          return "عفوا:لم يتم التسجيل،لان رقم الهاتف مسجل من قبل";
        } else if (errorMessage ==
            json.encode([
              "A customer with the same email already exist",
              "A customer with the same phone number already exist"
            ])) {
          return "عفوا:لم يتم التسجيل،لان هذا الحساب مسجل من قبل من فضلك توجه الي شاشه تسجيل الدخول";
        } else if (errorMessage ==
            json.encode(["A customer with the same email already exist"])) {
          return "عفوا:لم يتم التسجيل،لان هذا البريد الالكتروني مسجل من قبل";
        } else {
          return errorMessage;
        }
      } else {
        return e.message.toString();
      }
    }
  }
}
