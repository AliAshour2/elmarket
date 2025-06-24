import 'package:elmarket/features/categories/data/models/categories_response.dart';

abstract class CategoriesDataSource {
  Future<CategoriesListResponse> getAllCategories();
}
