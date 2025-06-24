import 'package:dartz/dartz.dart';
import 'package:elmarket/core/errors/exceptions.dart';
import 'package:elmarket/core/errors/failures.dart';
import 'package:elmarket/features/categories/data/data_source/categories_data_source.dart';
import 'package:elmarket/features/categories/data/mapper/categories_mapper.dart';
import 'package:elmarket/features/categories/data/models/categories_response.dart';
import 'package:elmarket/features/categories/domain/entities/category_model.dart';
import 'package:elmarket/features/categories/domain/repositories/categories_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesDataSource categoriesDataSource;
  CategoriesRepositoryImpl({
    required this.categoriesDataSource,
  });

  @override
  Future<Either<Failures, List<CategoryModel>>> getAllCategories() async {
    try {
      CategoriesListResponse categories =
          await categoriesDataSource.getAllCategories();
      return right((categories.data ?? [])
          .map(
            (e) => e.categoryResponseToCategoryMapper(),
          )
          .toList());
    } on AppExceptions catch (e) {
      return left(Failures(message: e.message));
    }
  }
}
