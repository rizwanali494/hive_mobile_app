import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class BackUpEmaiSuccesfullDialog extends StatefulWidget {
  const BackUpEmaiSuccesfullDialog({Key? key}) : super(key: key);

  @override
  State<BackUpEmaiSuccesfullDialog> createState() =>
      _BackUpEmaiSuccesfullDialogState();
}

class _BackUpEmaiSuccesfullDialogState
    extends State<BackUpEmaiSuccesfullDialog> {
  final emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return AlertDialog(
      title: SvgPicture.asset(
        SvgIcons.emailLogo,
        width: 73.w,
        height: 64.h,
        colorFilter: ColorFilter.mode(
          styles.skyBlue,
          BlendMode.srcIn,
        ),
      ),
      content: Text(
        "Mail has been sent to your given email address",
        style: styles.inter16w400,
        textAlign: TextAlign.center,
      ),
    );
  }
}
