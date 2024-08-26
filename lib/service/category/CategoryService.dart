import 'package:dio/dio.dart';
import 'package:flutter_application_1/di/DioClient.dart';
import 'package:flutter_application_1/models/OrganizationContactModel.dart';
import 'package:flutter_application_1/models/OrganizationModel.dart';
import 'package:flutter_application_1/models/ProductDetailModel.dart';
import 'package:flutter_application_1/models/category/parent_category_model.dart';
import 'package:flutter_application_1/service/log_service/LogService.dart';

class GetCategoryService {
  static final GetCategoryService _inheritance = GetCategoryService._init();

  static GetCategoryService get inheritance => _inheritance;

  GetCategoryService._init();

  static Future<List<ParentCategoryModel>?> getCategory() async {
    Log.i('getCategory');

    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .get("https://m.taqsim.uz/api/v1/Products?size=10&page=1&tab=34");
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());
      print(response.data);

      if (response.statusCode == 200) {
        final data = (response.data['item'] as List)
            .map((e) => ParentCategoryModel.fromJson(e))
            .toList();

        return data;
      } else {
        Log.e("${response.statusMessage} ${response.statusCode}");
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


  static Future<ProductDetailModel?> getProductDetail(String id) async {

    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .get("https://m.taqsim.uz/api/v1/Products/${id}");
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());
      print(response.data);

      if (response.statusCode == 200) {
        Log.i(response.data.toString());
        Log.i(response.statusCode.toString());
        print(response.data);
        // final data = (response.data['item'] as List)
        //     .map((e) => ParentCategoryModel.fromJson(e))
        //     .toList();
        final data = ProductDetailModel.fromJson(response.data);

        return data;
      } else {
        Log.e("${response.statusMessage} ${response.statusCode}");
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


   static Future<OrganizationContactModel?> getOrganizationContact(int organizationId) async {

    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .get("https://m.taqsim.uz/api/Organizations/${9}/contact");
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());
      print(response.data);

      if (response.statusCode == 200) {
        Log.i(response.data.toString());
        Log.i(response.statusCode.toString());
        print(response.data);
        // final data = (response.data['item'] as List)
        //     .map((e) => ParentCategoryModel.fromJson(e))
        //     .toList();
        final data = OrganizationContactModel.fromJson(response.data);

        return data;
      } else {
        Log.e("${response.statusMessage} ${response.statusCode}");
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


   static Future<List<OrganizationModel>?> getOrganizations() async {

    try {
      final response = await DioConfig.inheritance
          .createRequest()
          .get("https://m.taqsim.uz/api/Organizations");
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());
      print(response.data);

      if (response.statusCode == 200) {
        Log.i(response.data.toString());
        Log.i(response.statusCode.toString());
        print(response.data);
        final data = (response.data as List)
            .map((e) => OrganizationModel.fromJson(e))
            .toList();
        // final data = OrganizationContactModel.fromJson(response.data);

        return data;
      } else {
        Log.e("${response.statusMessage} ${response.statusCode}");
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




