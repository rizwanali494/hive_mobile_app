import 'package:flutter/material.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/dialogs/image_type_dialog.dart';
import 'package:images_picker/images_picker.dart';

class UtilFunctions {
  showLoaderDialog(BuildContext context, {String text = 'Loading'}) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    AlertDialog alert = AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
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
}
