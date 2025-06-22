import 'package:dio/dio.dart';
import 'package:elmarket/core/constants/api_constants.dart';
import 'package:elmarket/core/errors/exceptions.dart';
import 'package:elmarket/features/layout/categories/data/data_source/categories_data_source.dart';
import 'package:elmarket/features/layout/categories/data/models/categories_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as : CategoriesDataSource)
class CategoriesRemoreDaraSource implements CategoriesDataSource {
  Dio dio;

  CategoriesRemoreDaraSource({required this.dio});
  @override
  Future<CategoriesListResponse> getAllCategories() async {
    try {
      var response = await dio.get(ApiConstants.getAllCategoriesEndPoint);
      return CategoriesListResponse.fromJson(response.data);
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response?.data['message'] ?? "not definded dio error";
      }
      throw RemoteException(message: message);
    }
  }
}
