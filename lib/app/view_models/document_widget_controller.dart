import 'dart:io';

import 'package:flutter/material.dart';

class DocumentWidgetController {
  final Function(int id)? onRemove;
  final String? documentName;
  final File? file;
  int? id;

  DocumentWidgetController({
    this.documentName,
    this.onRemove,
    this.file,
    this.id,
  }) {
    id ??= DateTime.now().millisecondsSinceEpoch;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DocumentWidgetController &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
