import 'package:dio/dio.dart';
import 'package:pointz/models/active_advertisement.dart';
import 'package:pointz/models/category.dart';
import 'package:pointz/models/services_provider_response.dart';

import '../../constants/strings.dart';

class HomeServices {
  late Dio dio;

  String latestErrorMessage = "";

  HomeServices() {
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

  Future<dynamic> getAllActiveAdvertisements() async {
    try {
      Response response = await dio.get(
          "BusinessAdvertisment/allActive/paginated?pageIndex=1&pageSize=1000000");
      if (response.statusCode == 200) {
        print(
            "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
        print(response.data);
        List<dynamic> map = response.data["result"]["data"];
        return map.map((e) => Advertisment.fromJson(e)).toList();
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(
          "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      print(e.response?.data.toString());
      print(e.message);
      return false;
    }
  }

  Future<dynamic> getAllCategories() async {
    try {
      Response response = await dio.get("BusinessTypeLookup");
      if (response.statusCode == 200) {
        print(
            "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
        List<dynamic> map = response.data["result"]["data"];
        return map.map((e) => Category.fromJson(e)).toList();
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(
          "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      print(e.response?.data.toString());
      print(e.message);
      return false;
    }
  }

  Future<dynamic> getSomeServicesProviders(String code) async {
    try {
      Response response = await dio.post(
        "Business/allActive/paginated?pageIndex=1&pageSize=5",
        data: {"typeCode": code, "tagCodeList": []},
      );
      if (response.statusCode == 200) {
        print(
            "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
        print(response.data);
        List<dynamic> map = response.data["result"]["data"];
        return map.map((e) => ServicesProvider.fromJson(e)).toList();
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(
          "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      print(e.response?.data.toString());
      print(e.message);
      return false;
    }
  }

  Future<dynamic> pgetSomeServicesProviders(
      String code, int index, int pageSize) async {
    try {
      Response response = await dio.post(
        "Business/allActive/paginated?pageIndex=${index}&pageSize=${pageSize}",
        data: {"typeCode": code, "tagCodeList": []},
      );
      if (response.statusCode == 200) {
        print(
            "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
        print(response.data);
        List<dynamic> map = response.data["result"]["data"];
        return map.map((e) => ServicesProvider.fromJson(e)).toList();
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(
          "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      print(e.response?.data.toString());
      print(e.message);
      return false;
    }
  }
}
