import 'package:elmarket/features/categories/data/models/categories_response.dart';
import 'package:elmarket/features/categories/domain/entities/category_model.dart';

extension CategoriesMapper on CategoryResponse {
  CategoryModel categoryResponseToCategoryMapper() => CategoryModel(
        id: id,
        name: name,
        image: image,
        slug: slug,
      );
}
