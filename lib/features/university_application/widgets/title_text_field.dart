import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class TitleTextField extends StatelessWidget {
  final String? title;
  final int? maxLength;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;

  final TextEditingController? controller;
  final int? maxLines;

  const TitleTextField({
    super.key,
    this.title,
    required this.hintText,
    this.maxLines,
    this.controller,
    this.hintStyle,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

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
          child: TextFormField(
            style: styles.inter12w400,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            maxLength: maxLength,
            controller: controller,
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                hintStyle: hintStyle,
                hintText: hintText),
          ),
        ),
      ],
    );
  }
}
