import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.label,
    this.hint,
    this.isObscured = false,
    this.iconData,
    this.textInputType = TextInputType.text,
    this.backgroundColor,
    this.hintTextStyle,
    this.labelTextStyle,
    this.cursorColor,
    this.readOnly = false,
    this.validation,
    this.onTap,
    this.maxLines,
    this.prefixIcon,
    this.borderBackgroundColor,
    this.suffixIcon, this.autovalidateMode,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final AutovalidateMode? autovalidateMode;
  final bool isObscured;
  final String? label;
  final String? hint;
  final TextInputType textInputType;
  final IconData? iconData;
  final Color? backgroundColor;
  final Color? borderBackgroundColor;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final Color? cursorColor;
  final bool readOnly;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validation;
  final void Function()? onTap;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool hidden = widget.isObscured;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: AppMargin.m5),
          child: TextFormField(
            maxLines: widget.maxLines ?? 1,
            controller: widget.controller,
            focusNode: widget.focusNode,
            readOnly: widget.readOnly,
            style: getMediumStyle(color: ColorManager.black)
                .copyWith(fontSize: 12.sp),
            obscureText: hidden,
            keyboardType: widget.textInputType,
            obscuringCharacter: '*',
            cursorColor: widget.cursorColor ?? ColorManager.primary,
            onTap: widget.onTap,
            onEditingComplete: () {
              widget.focusNode?.unfocus();
              if (widget.nextFocus != null) {
                FocusScope.of(context).requestFocus(widget.nextFocus);
              }
            },
            textInputAction: widget.nextFocus == null
                ? TextInputAction.done
                : TextInputAction.next,
            validator: (value) {
              if (widget.validation == null) {
                setState(() {
                  errorText = null;
                });
              } else {
                setState(() {
                  errorText = widget.validation!(value);
                });
              }
              return errorText;
            },
            decoration: InputDecoration(
              labelText: widget.label,
              hintText: widget.hint,
              prefixIcon: widget.prefixIcon ??
                  (widget.iconData != null
                      ? Icon(widget.iconData, color: ColorManager.primary)
                      : null),
              suffixIcon: widget.isObscured
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          hidden = !hidden;
                        });
                      },
                      icon: hidden
                          ? const Icon(Icons.visibility_off_outlined,
                              color: Colors.grey)
                          : Icon(Icons.visibility, color: ColorManager.primary),
                    )
                  : widget.suffixIcon,
              hintStyle: widget.hintTextStyle ??
                  getRegularStyle(color: Colors.grey[600]!)
                      .copyWith(fontSize: 12.sp),
              filled: true,
              fillColor: Colors.grey[100],
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.blue, width: 2),
              ),
              errorStyle: getLightStyle(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
