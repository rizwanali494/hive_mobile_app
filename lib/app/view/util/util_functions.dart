import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
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

  showToast({String? msg}) {
    Fluttertoast.showToast(
      msg: msg ?? AppStrings.somethingWentWrong,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 12.0,
    );
  }
}
