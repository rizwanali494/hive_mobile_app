import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class TitleTextField extends StatelessWidget {
  final String? title;
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
    this.onTap,
    this.onChanged,
    this.textFormField,
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
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: styles.black.withOpacity(.3),
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: buildTextFormField(styles),
        ),
      ],
    );
  }

  Widget buildTextFormField(AppTheme styles) {
    return textFormField ??
        TextFormField(
          onChanged: onChanged,
          style: styles.inter12w400,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          maxLength: maxLength,
          controller: controller,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              enabled: enabled,
              hintStyle: hintStyle,
              hintText: hintText),
        );
  }
}
