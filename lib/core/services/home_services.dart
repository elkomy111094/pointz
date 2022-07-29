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
          "BusinessAdvertisment/allActiveForCustomer/paginated?pageIndex=1&pageSize=1000000");
      if (response.statusCode == 200) {
        print(response.data);
        List<dynamic> map = response.data["result"]["data"];
        return map.map((e) => Advertisment.fromJson(e)).toList();
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(e.response?.data.toString());
      print(e.message);
      return false;
    }
  }

  Future<dynamic> getAllCategories() async {
    try {
      Response response = await dio.get("BusinessTypeLookup");
      if (response.statusCode == 200) {
        List<dynamic> map = response.data["result"]["data"];
        return map.map((e) => Category.fromJson(e)).toList();
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(e.response?.data.toString());
      print(e.message);
      return false;
    }
  }

  Future<dynamic> getSomeServicesProviders(int customerID) async {
    try {
      Response response = await dio.post(
        "Business/allTopsForEachTypeForCustomer",
        data: {
          "customerId": customerID,
        },
      );
      if (response.statusCode == 200) {
        print(
            "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
        print(
            "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111");
        print(response.data);
        List<dynamic> map = response.data["result"]["data"];
        return map.map((e) => CategoriesTopsRespons.fromJson(e)).toList();
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

  Future addToMyFavorites(
      {required int customerID, required int businessID}) async {
    try {
      Response response = await dio.post(
        "CustomerFavoriteBusiness/toggle",
        data: {"customerId": customerID, "businessID": businessID},
      );
      if (response.statusCode == 200) {
        print(
            "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
        print(
            "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111");
        print(response.data);
        return true;
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
      {required String code,
      required int index,
      required List<String> tagCodeList,
      required int pageSize,
      required int customerID}) async {
    try {
      Response response = await dio.post(
        "Business/allForTypeForCustomerPaginated?pageIndex=${index}&pageSize=${pageSize}",
        data: {
          "businessTypeCode": code,
          "tagCodeList": tagCodeList,
          "customerID": customerID
        },
      );
      if (response.statusCode == 200) {
        print(response.data);
        List<dynamic> map = response.data["result"]["data"];
        return (map.map((e) => ServicesProvider.fromJson(e))).toList();
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(e.response?.data.toString());
      print(e.message);
      return false;
    }
  }

  Future<dynamic> getSearchResultInAll(
      {required int index,
      required int pageSize,
      required int userId,
      required String searchValue}) async {
    try {
      Response response = await dio.post(
          "Business/allBySearchForCustomerPaginated?pageIndex=${index}&pageSize=${pageSize}",
          data: {"customerID": userId, "businessName": searchValue});
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

  Future<dynamic> getSearchResultInCategory(
      {required int index,
      required int pageSize,
      required int userId,
      required String categoryCode,
      required String searchValue}) async {
    try {
      Response response = await dio.post(
          "Business/allInTypeBySearchForCustomerPaginated?pageIndex=${index}&pageSize=${pageSize}",
          data: {
            "customerID": userId,
            "businessName": searchValue,
            "businessTypeCode": categoryCode,
          });
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
