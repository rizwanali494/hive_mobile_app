import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/dialogs/blue_elevated_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
        child: Column(
          children: [
            Text(
              "${AppStrings.enterBackupEmail}",
              style: styles.inter16w600,
              textAlign: TextAlign.center,
            ),
            Text(
              "(also it should not be bh.edu.pk)",
              style: styles.inter14w400,
              textAlign: TextAlign.center,
            ),
          ],
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
                style: styles.inter14w400,
                controller: emailCtrl,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: AppStrings.email,
                  hintStyle: styles.inter12w400
                      .copyWith(color: styles.black.withOpacity(0.5)),
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
          child: BlueElevatedButton(
            text: AppStrings.enter.toUpperCase(),
            onTap: () {
              if (EmailValidator.validate(emailCtrl.text)) {
                context.pop(emailCtrl.text);
              }
            },
          ),
        ),
      ],
    );
  }
}
