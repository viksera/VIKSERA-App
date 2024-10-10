import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/core/widget_helper/widget_helper.dart';

class CustomTextField<B extends StateStreamable<S>, S> extends StatelessWidget {
  final bool Function(S, S)? buildWhen;
  final void Function(String, B)? onChanged;
  final TextEditingController? controller;
  final String Function(S)? onErrorChanged;
  final String hintText;
  final Widget? prefixIcon;
  final double paddingX;
  final double paddingY;
  final bool boxShadow;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final void Function(String, B)? onSubmitted;
  const CustomTextField(
      {super.key,
      this.buildWhen,
      this.controller,
      this.textStyle,
      this.hintStyle,
      this.onChanged,
      this.onErrorChanged,
      this.onSubmitted,
      this.boxShadow = false,
      this.prefixIcon,
      this.paddingX = 16,
      this.paddingY = 12,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      buildWhen: (p, c) => buildWhen?.call(p, c) ?? true,
      builder: (context, state) {
        String? errorText = onErrorChanged?.call(state);
        return Ink(
          decoration: boxShadow ? WidgetHelper.cardDecoration() : null,
          child: TextFormField(
            controller: controller,
            cursorColor: AppColors.appPrimaryColor,
            decoration: InputDecoration(
              hintText: hintText,
              errorText: errorText,
              isDense: true,
              prefixIconConstraints:
                  BoxConstraints(minHeight: 48.w, minWidth: 48.w),
              prefixIcon: prefixIcon,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: paddingX.w, vertical: paddingY.w),
            ),
            onChanged: (value) => onChanged?.call(value, context.read<B>()),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            onFieldSubmitted: (value) =>
                onSubmitted?.call(value, context.read<B>()),
          ),
        );
      },
    );
  }
}
