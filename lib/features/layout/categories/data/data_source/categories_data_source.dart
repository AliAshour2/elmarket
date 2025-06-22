import 'package:elmarket/features/layout/categories/data/models/categories_response.dart';

abstract class CategoriesDataSource {
  Future<CategoriesListResponse> getAllCategories();
}
