import 'package:elmarket/core/resources/color_manager.dart';
import 'package:elmarket/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final Color? backgroundColor;
  final double? radius;
  final void Function()? onTap;
  final TextStyle? textStyle;
  final bool isStadiumBorder;
  final bool? isLoading;

  const CustomElevatedButton(
      {super.key,
      this.prefixIcon,
      this.textStyle,
      this.isStadiumBorder = true,
      this.backgroundColor,
      this.radius,
      this.suffixIcon,
      required this.label,
      required this.onTap,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: isStadiumBorder
              ? const StadiumBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.r)),
          backgroundColor: backgroundColor ?? ColorManager.primary,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon ?? const SizedBox(),
            SizedBox(
              width: 24.w,
            ),
            (isLoading ?? false)
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    label,
                    style: textStyle ??
                        getMediumStyle(color: ColorManager.white)
                            .copyWith(fontSize: 12.sp),
                  ),
            SizedBox(
              width: 27.w,
            ),
            suffixIcon ?? const SizedBox()
          ],
        ));
  }
}
