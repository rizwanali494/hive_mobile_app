import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/view_models/document_widget_controller.dart';
import 'package:path_provider/path_provider.dart';

mixin DocumentController {
  Future<List<DocumentWidgetController>> downloadAllDocs(
      {List<Attachments>? docs}) async {
    List<DocumentWidgetController> documents = [];
    final files = await Future.wait([
      for (final element in docs ?? <Attachments>[])
        downloadDoc(
            fileName: element.label ?? "",
            url: element.file ?? "",
            fileId: element.id),
    ]);
    for (var value in files) {
      if (value != null) {
        documents.add(value);
      }
    }
    return documents;
  }

  Future<DocumentWidgetController?> downloadDoc(
      {required String fileName,
      required String url,
      required String? fileId}) async {
    final file = await _downloadFile(url, fileName);
    if (file == null) {
      return null;
    }
    final controller = DocumentWidgetController(
        documentName: fileName,
        fileId: fileId,
        file: file,
        url: url,
        downloaded: true,
        onRemove: (id) {});
    return controller;
  }

  Future<File?> _downloadFile(String url, String filename) async {
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    final dir = await getTemporaryDirectory();
    File file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }
}
