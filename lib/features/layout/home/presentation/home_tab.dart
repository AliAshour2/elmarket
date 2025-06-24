import 'dart:async';
import 'package:elmarket/core/di/service_locator.dart';
import 'package:elmarket/core/resources/assets_manager.dart';
import 'package:elmarket/features/layout/categories/presentation/cubit/categories_cubit.dart';
import 'package:elmarket/features/layout/categories/presentation/cubit/categories_state.dart';
import 'package:elmarket/features/layout/home/presentation/widgets/custom_ads_widget.dart';
import 'package:elmarket/features/layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  late CategoriesCubit categoriesCubit;

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
    categoriesCubit = getIt.get<CategoriesCubit>();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAdsWidget(
              adsImages: adsImages, currentIndex: _currentIndex, timer: _timer),
          Column(
            children: [
              BlocProvider<CategoriesCubit>(
                create: (context) => categoriesCubit,
                child: BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state) {
                    if (state is GetAllCategoriesLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GetAllCategoriesErrorState) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else if (state is GetAllCategoriesSuccessState) {
                      return SizedBox(
                          height: 300.h,
                          child: GridView.builder(
                              itemCount: state.categoriesList.length,
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 22.h, crossAxisCount: 3),
                              itemBuilder: (context, index) {
                                return CustomCategoryWidget(
                                    categoryModel: state.categoriesList[index]);
                              }));
                    } else {
                      return Center(
                        child: Text('No categories available'),
                      );
                    }
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
