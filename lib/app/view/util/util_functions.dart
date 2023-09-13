import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/view/dialogs/image_type_dialog.dart';
import 'package:images_picker/images_picker.dart';

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

  static Future<List<Media>?> openImageTypeDialog(BuildContext context,
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

  static Future<List<Media>?> imageFromGallery({int imageCount = 1}) async {
    var file = await ImagesPicker.pick(
      maxSize: 300,
      quality: 0.6,
      pickType: PickType.image,
      count: imageCount,
      cropOpt: CropOption(),
    );
    return file;
  }

  static Future<List<Media>?> imageFromCamera() async {
    var file = await ImagesPicker.openCamera(
      maxSize: 300,
      quality: 0.6,
      pickType: PickType.image,
      cropOpt: CropOption(),
    );
    return file;
  }

  static void showToast({String? msg, BuildContext? context}) {
    if (context == null) {
      Fluttertoast.showToast(
        msg: msg ?? AppStrings.somethingWentWrong,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 12.0,
      );
      return;
    }
    FToast fToast = FToast();

    fToast.init(context);
    Widget toast = Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(25.0),
        color: Colors.black,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Something went wrong",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  fToast.removeCustomToast();
                },
                child: Text(
                  "Dismiss",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      fadeDuration: Duration(milliseconds: 400),
      toastDuration: Duration(seconds: 2),
    );
  }
}
