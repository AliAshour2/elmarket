import 'package:elmarket/core/resources/color_manager.dart';
import 'package:elmarket/core/resources/styles_manager.dart';
import 'package:elmarket/features/layout/categories/domain/entities/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  const CustomCategoryWidget({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CachedNetworkImage(
        //   height: 100,
        //   width: 100,
        //   imageUrl: (categoryModel.image?.isNotEmpty ?? false)
        //       ? categoryModel.image!
        //       : 'https://via.placeholder.com/100',
        //   placeholder: (context, url) =>
        //       const Center(child: CircularProgressIndicator()),
        //   errorWidget: (context, url, error) =>
        //       const Center(child: Icon(Icons.error)),
        //   imageBuilder: (context, imageProvider) {
        //     return Container(
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         image: DecorationImage(
        //           image: imageProvider,
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     );
        //   },
        // ),
        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: Container(
            height: 70.h,
            width: 70.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              categoryModel.image ?? 'assets/images/placeholder.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          categoryModel.name ?? 'Unknown Category',
          style: getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
