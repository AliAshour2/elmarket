import 'package:dartz/dartz.dart';
import 'package:elmarket/core/errors/failures.dart';
import 'package:elmarket/features/layout/categories/domain/entities/category_model.dart';
import 'package:elmarket/features/layout/categories/domain/repositories/categories_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllCategoriesUseCase {
  CategoriesRepository categoriesRepository;
  GetAllCategoriesUseCase({required this.categoriesRepository});

  Future<Either<Failures, List<CategoryModel>>> call() async =>
      await categoriesRepository.getAllCategories();
}
