import 'package:elmarket/features/layout/categories/domain/use_case/get_all_categories_use_case.dart';
import 'package:elmarket/features/layout/categories/presentation/cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CategoriesCubit extends Cubit<CategoriesState> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  CategoriesCubit(this.getAllCategoriesUseCase)
      : super(GetAllCategoriesInitialState());

  Future<void> getAllCategories() async {
    emit(GetAllCategoriesLoadingState());
    var response = await getAllCategoriesUseCase();
    response.fold((l) => emit(GetAllCategoriesErrorState(message: l.message)),
        (r) => emit(GetAllCategoriesSuccessState(r)));
  }
}
