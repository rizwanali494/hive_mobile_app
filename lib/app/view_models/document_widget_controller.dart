import 'dart:io';

import 'package:uuid/v1.dart';

class DocumentWidgetController {
  final Function(String? id)? onRemove;
  final String? documentName;
  final File file;
  String? fileId;
  String? id;
  bool downloaded;

  DocumentWidgetController({
    this.documentName,
    this.onRemove,
    required this.file,
    this.id,
    this.fileId,
    this.downloaded = false,
  }) {
    final uuid = UuidV1();
    id ??= uuid.generate();
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
