import 'package:flutter/material.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  final TextStyle? hintStyle;
  final TextEditingController? controller;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.maxLines,
    this.controller,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return TextFormField(
      style: styles.inter12w400,
      controller: controller,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          hintStyle: hintStyle,
          hintText: hintText),
    );
  }
}
