import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/view/dialogs/image_type_dialog.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:uuid/uuid.dart';

class UtilFunctions {
  showLoaderDialog(BuildContext context, {String text = 'Loading'}) {
    AlertDialog alert = AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      useRootNavigator: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static Future<List<File>?> openImageTypeDialog(BuildContext context,
      {int imageCount = 1}) async {
    var selection = await showModalBottomSheet(
      context: context,
      builder: (context) => const ImageSelection(),
    );
    if (selection != null) {
      if (selection == 0) {
        return imageFromGallery(imageCount: imageCount);
      }
      if (selection == 1) {
        return imageFromCamera();
      }
    }
    return null;
  }

  static Future<List<File>?> imageFromGallery({
    int imageCount = 1,
  }) async {
    // FilePickerResult? result = await FilePicker.platform
    //     .pickFiles(allowedExtensions: ["pdf"], type: FileType.custom);
    // var result = await ImagePickers.pickerPaths(
    //   maxSize: 300,
    //   count: imageCount,
    //   quality: 0.6,
    //   pickType: PickType.image,
    //   cropOpt: CropOption(),
    // );
    var result = await ImagePickers.pickerPaths(
        galleryMode: GalleryMode.image,
        selectCount: imageCount,
        showGif: false,
        showCamera: false,
        compressSize: 100,
        cropConfig: CropConfig(
          enableCrop: true,
        ));

    List<File>? imageFiles;
    if (result.isNotEmpty) {
      imageFiles = [];
      for (int index = 0; index < result.length; index++) {
        final imageMedia = result[index];
        if (imageMedia.path != null) {
          final now = DateTime.now();
          final file = await changeFileNameOnly(
              File(imageMedia.path!), now.millisecond.toString());
          imageFiles.add(file);
        }
      }
    }
    return imageFiles;
  }

  static Future<List<File>?> imageFromCamera() async {
    var mediaFiles = await ImagePickers.openCamera(
        compressSize: 100, cropConfig: CropConfig(enableCrop: true));
    List<File>? imageFiles;
    if (mediaFiles != null) {
      final imageMedia = mediaFiles;
      if (imageMedia.path != null) {
        imageFiles = [];
        final now = DateTime.now();
        final file = await changeFileNameOnly(
            File(imageMedia.path!), now.millisecond.toString());
        imageFiles.add(file);
      }
    }
    return imageFiles;
  }

  static Future<File> changeFileNameOnly(File file, String newFileName) {
    final uuid = Uuid();
    final id = uuid.v1();
    var path = file.path;
    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    var newPath = path.substring(0, lastSeparator + 1) + "Doc_${id}.jpg";
    log("old: ${path} new file name: $newPath");
    return file.rename(newPath);
  }

  static void showToast(
      {String? msg,
      BuildContext? context,
      List<Widget> actionButtons = const []}) {
    // context = context ?? navigatorKey.currentContext;
    Fluttertoast.cancel().then((value) {
      Fluttertoast.showToast(
        msg: msg ?? AppStrings.somethingWentWrong,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    });

    // if (context == null || !(context.mounted)) {
    //   Fluttertoast.showToast(
    //     msg: msg ?? AppStrings.somethingWentWrong,
    //     toastLength: Toast.LENGTH_LONG,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.black,
    //     textColor: Colors.white,
    //     fontSize: 12.0,
    //   );
    //   return;
    // }
    // FToast fToast = FToast();
    //
    // fToast.init(context);
    // Widget toast = Container(
    //   width: double.infinity,
    //   padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
    //   decoration: BoxDecoration(
    //     // borderRadius: BorderRadius.circular(25.0),
    //     color: Colors.black,
    //   ),
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Align(
    //         alignment: Alignment.topLeft,
    //         child: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Text(
    //             msg ?? AppStrings.somethingWentWrong,
    //             style: TextStyle(color: Colors.white),
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         width: 12.0,
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         children: [
    //           TextButton(
    //             onPressed: () {
    //               fToast.removeCustomToast();
    //             },
    //             child: Text(
    //               AppStrings.dismiss,
    //               style: TextStyle(color: Colors.white),
    //             ),
    //           ),
    //           ...actionButtons
    //         ],
    //       ),
    //     ],
    //   ),
    // );
    // fToast.showToast(
    //   child: toast,
    //   gravity: ToastGravity.BOTTOM,
    //   fadeDuration: Duration(milliseconds: 400),
    //   toastDuration: Duration(seconds: 3),
    // );
  }
}
