import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class TitleTextField extends StatelessWidget {
  final String? title;
  final bool showBorder;
  final int? maxLength;
  final bool enabled;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final bool textFieldOnly;
  final TextEditingController? controller;
  final int? maxLines;
  final void Function()? onTap;
  final Function(String)? onChanged;
  final TextFormField? textFormField;
  final String? Function(String?)? validator;
  final Widget? Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;

  const TitleTextField({
    super.key,
    this.title,
    this.textFieldOnly = false,
    this.hintText,
    this.maxLines,
    this.controller,
    this.hintStyle,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.enabled = true,
    this.showBorder = true,
    this.onTap,
    this.onChanged,
    this.textFormField,
    this.buildCounter,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    if (textFieldOnly) {
      return buildTextFormField(styles);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: Text(
              title!,
              style: styles.inter14w600.copyWith(
                color: styles.darkSlateGrey,
              ),
            ),
          ),
          11.verticalSpace,
        ],
        Container(
          // padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     color: styles.black.withOpacity(.3),
          //   ),
          //   borderRadius: BorderRadius.circular(25),
          // ),
          child: buildTextFormField(styles),
        ),
      ],
    );
  }

  Widget buildTextFormField(AppTheme styles) {
    return textFormField ??
        TextFormField(
          onChanged: onChanged,
          validator: validator,
          style: styles.inter12w400,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          maxLength: maxLength,
          controller: controller,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(22.w, 15, 12, 12),
              enabledBorder: showBorder ? enabledBorder(styles) : null,
              focusedBorder: showBorder ? focusedBorder() : null,
              enabled: enabled,
              // errorText: "as",
              errorBorder: showBorder ? errorBorder(styles) : null,
              focusedErrorBorder: showBorder ? focusedError(styles) : null,
              hintStyle: hintStyle,
              hintText: hintText),
          buildCounter: buildCounter,
        );
  }

  OutlineInputBorder focusedError(AppTheme styles) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(width: 1, color: styles.red));
  }

  OutlineInputBorder errorBorder(AppTheme styles) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(width: 0.7, color: styles.red));
  }

  OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(width: 0.5));
  }

  OutlineInputBorder enabledBorder(AppTheme styles) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide:
            BorderSide(color: styles.black.withOpacity(0.5), width: 0.5));
  }
}
