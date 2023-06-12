import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';

import '../../resources/app_theme.dart';

class BackUpEmailDialog extends StatefulWidget {
  const BackUpEmailDialog({Key? key}) : super(key: key);

  @override
  State<BackUpEmailDialog> createState() => _BackUpEmailDialogState();
}

class _BackUpEmailDialogState extends State<BackUpEmailDialog> {
  final emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return AlertDialog(
      title: Center(
        child: Text(
          AppStrings.enterBackupEmail,
          style: styles.inter16w400,
        ),
      ),
      content: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 28.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: styles.black,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              SvgIcons.emailLogo,
            ),
            20.horizontalSpace,
            Expanded(
              child: TextFormField(
                style: styles.inter12w400,
                controller: emailCtrl,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: AppStrings.email,
                  hintStyle: styles.inter12w400.copyWith(
                    color: styles.black.withOpacity(0.5)
                  ),
                  isDense: true,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: styles.skyBlue,
            ),
            child: Text(
              AppStrings.email,
              style: styles.inter12w700.copyWith(color: styles.white),
            ),
          ),
        ),
      ],
    );
  }
}
