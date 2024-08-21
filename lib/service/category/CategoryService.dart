import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/CategoryModel.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';

class GetCategoryService {
  static final GetCategoryService _inheritance = GetCategoryService._init();

  static GetCategoryService get inheritance => _inheritance;

  GetCategoryService._init();

  static Future<List<CategoryModel>?> getCategory() async {
    try {
      Response res = await DioConfig.inheritance
          .createRequest()
          .get("https://m.taqsim.uz/api/v1/products");
      print(res.data.toString());
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200) {
        List<CategoryModel> data = [];
        for (var e in (res.data as List)) {
          data.add(CategoryModel.fromJson(e));
        }
        print(data.toString());

        return data;
      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
    }
    return null;
  }
}
