import 'package:dio/dio.dart';
import 'package:pointz/models/customer_all_gifts_response.dart';

import '../../constants/strings.dart';
import '../../models/all_businesses_respponse.dart';

class GiftsServices {
  late Dio dio;

  String latestErrorMessage = "";

  GiftsServices() {
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

  Future<dynamic> getAllBusinesses() async {
    try {
      Response response = await dio.get(
        "Business/options",
      );
      if (response.statusCode == 200) {
        print(
            "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
        print(response.data);
        List<dynamic> map = response.data["result"]["data"];
        return map.map((e) => DropDownBusiness.fromJson(e)).toList();
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

  Future<dynamic> sendGift({required Map<String, dynamic> gift}) async {
    try {
      Response response = await dio.post("CustomerGift", data: gift);
      if (response.statusCode == 200) {
        print(
            "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
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

  Future<dynamic> getAllCustomerAvailableGifts(
      {required int index,
      required int pageSize,
      required String customerPhoneNumer}) async {
    try {
      Response response = await dio.post(
          "CustomerGift/forCustomer/paginated?pageIndex=${index}&pageSize=${pageSize}",
          data: {"phoneNumber": customerPhoneNumer});
      if (response.statusCode == 200) {
        print(
            "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
        print(response.data);
        List<dynamic> map = response.data["result"]["data"];
        return map.map((e) => ApiGiftModel.fromJson(e)).toList();
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
