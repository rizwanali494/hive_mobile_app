import 'package:flutter/material.dart';

import '../../resources/app_theme.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;

  const TextFieldWidget({
    super.key,
    required this.styles,
    required this.hintText,
  });

  final AppTheme styles;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: styles.inter12w400,
      decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          hintStyle: styles.inter12w400Italic,
          hintText: hintText),
    );
  }
}
