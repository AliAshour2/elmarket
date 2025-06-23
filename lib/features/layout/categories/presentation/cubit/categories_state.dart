import 'package:elmarket/features/layout/categories/domain/entities/category_model.dart';

abstract class CategoriesState {}

class GetAllCategoriesInitialState extends CategoriesState {}

class GetAllCategoriesLoadingState extends CategoriesState {}

class GetAllCategoriesSuccessState extends CategoriesState {
  final List<CategoryModel> categoriesList;

  GetAllCategoriesSuccessState(this.categoriesList);
}

class GetAllCategoriesErrorState extends CategoriesState {
  final String message;

  GetAllCategoriesErrorState({required this.message});
}
