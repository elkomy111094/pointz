import 'package:dio/dio.dart';

import '../../constants/strings.dart';
import '../../models/services_provider_response.dart';

class FavoritesServices {
  late Dio dio;

  String latestErrorMessage = "";

  FavoritesServices() {
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

  Future<dynamic> getFavoriteServicesProviders(
      {required int index, required int pageSize, required int userId}) async {
    try {
      Response response = await dio.get(
        "/Business/forCustomerFavorite/${userId}/paginated?pageIndex=${index}&pageSize=${pageSize}",
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
