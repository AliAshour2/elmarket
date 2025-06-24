import 'package:elmarket/features/categories/domain/use_case/get_all_categories_use_case.dart';
import 'package:elmarket/features/categories/presentation/cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CategoriesCubit extends Cubit<CategoriesState> {
  GetAllCategoriesUseCase _getAllCategoriesUseCase;
  CategoriesCubit(this._getAllCategoriesUseCase)
      : super(GetAllCategoriesInitialState()) {
    getAllCategories();
  }

  Future<void> getAllCategories() async {
    emit(GetAllCategoriesLoadingState());
    var response = await _getAllCategoriesUseCase();
    response.fold((l) => emit(GetAllCategoriesErrorState(message: l.message)),
        (r) => emit(GetAllCategoriesSuccessState(r)));
  }
}
