import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:path_provider/path_provider.dart';

class DownloadService {
  late Directory dir;
  ReceivePort _port = ReceivePort();

  Future<void> listenToChanges() async {
    log("here");
    // IsolateNameServer.registerPortWithName(
    //     _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      log("here 222");
      String id = data[0];
      DownloadTaskStatus status = DownloadTaskStatus(data[1]);
      int progress = data[2];
      log("message :: file download completed ${progress}");
      if (status.value == DownloadTaskStatus.complete) {
        UtilFunctions.showToast(msg: "File Downloaded");
        log("message :: file download completed");
        // IsolateNameServer.removePortNameMapping('downloader_send_port');
      }
    });
  }

  Future<void> registerService() async {
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    dir = await getApplicationDocumentsDirectory();
    final dirExist = await dir.exists();
    if (!dirExist) {
      await dir.create();
    }
    await FlutterDownloader.initialize(
      debug: kDebugMode,
    );
    FlutterDownloader.registerCallback(_DownloadCallbackClass.callback);
  }

  Future<void> downloadFile({required String fileUrl, String? name}) async {
    try {
      final taskId = await FlutterDownloader.enqueue(
          url: fileUrl,
          savedDir: dir.path,
          saveInPublicStorage: true,
          showNotification: true,
          openFileFromNotification: true,
          fileName: name);
      // listenToChanges();
    } catch (e) {
      log("message : ${e.toString()}");
      // TODO
    }
  }

  DownloadService() {
    registerService();
  }
}

class _DownloadCallbackClass {
  @pragma('vm:entry-point')
  static void callback(String id, int status, int progress) {
    print(
      'Callback on background isolate: '
      'task ($id) is in status ($status) and process ($progress)',
    );
    IsolateNameServer.lookupPortByName('downloader_send_port')
        ?.send([id, status, progress]);
  }
}
