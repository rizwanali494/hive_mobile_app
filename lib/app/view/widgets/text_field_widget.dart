import 'package:flutter/material.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final int? maxLines;

  const TextFieldWidget({
    super.key,
    required this.styles,
    required this.hintText,
    this.maxLines,
  });

  final AppTheme styles;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: styles.inter12w400,
      maxLines: maxLines ,
      decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          hintStyle: styles.inter12w400Italic,
          hintText: hintText),
    );
  }
}
