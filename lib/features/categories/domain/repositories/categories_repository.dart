import 'package:dartz/dartz.dart';
import 'package:elmarket/core/errors/failures.dart';
import 'package:elmarket/features/categories/domain/entities/category_model.dart';

abstract class CategoriesRepository {
  Future<Either<Failures, List<CategoryModel>>> getAllCategories();
}
