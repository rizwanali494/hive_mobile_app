import 'package:flutter/material.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class ImageSelection extends StatelessWidget {
  const ImageSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
            leading: const Icon(Icons.photo_library),
            title: Text(
              'Pick from Gallery',
              style: styles.inter12w500,
            ),
            onTap: () {
              Navigator.of(context).pop(0);
            }),
        ListTile(
          leading: const Icon(Icons.photo_camera),
          title: Text('Take from Camera', style: styles.inter12w500),
          onTap: () {
            Navigator.of(context).pop(1);
          },
        ),
      ],
    );
  }
}
