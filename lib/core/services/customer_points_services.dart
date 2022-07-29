import 'package:dio/dio.dart';

import '../../constants/strings.dart';
import '../../models/customer_points_response.dart';

class CustomerPointsServices {
  late Dio dio;

  String latestErrorMessage = "";

  CustomerPointsServices() {
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

  Future<dynamic> getAllCustomerPoints(
      {required int index, required int pageSize, required int userId}) async {
    try {
      Response response = await dio.get(
        "CustomerPoint/allForCustomer/$userId/paginated?pageIndex=${index}&pageSize=${pageSize}",
      );
      if (response.statusCode == 200) {
        print(
            "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
        print(response.data);
        List<dynamic> map = response.data["result"]["data"];
        return map.map((e) => CustomerPointModel.fromJson(e)).toList();
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
