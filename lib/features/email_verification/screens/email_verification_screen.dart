import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/dialogs/blue_elevated_button.dart';
import 'package:hive_mobile/features/email_verification/controllers/email_verfication_controller.dart';
import 'package:provider/provider.dart';

class EmailVerificationScreen extends StatelessWidget {
  static const route = "/EmailVerification";

  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => EmailVerifyController(),
        child: Consumer<EmailVerifyController>(
          builder: (context, provider, child) {
            return SafeArea(
              child: Column(
                children: [
                  50.verticalSpace,
                  Image(
                    image: AssetImage(
                      SvgIcons.hiveLogo,
                    ),
                    width: 109.w,
                    height: 55.h,
                  ),
                  65.verticalSpace,
                  Text(
                    AppStrings.verifyBackupEmail,
                    style: styles.inter40w700,
                  ),
                  40.verticalSpace,
                  Text(
                    "${AppStrings.verifyBackupEmail}",
                    style: styles.inter14w600,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "(also it should not be bh.edu.pk)",
                    style: styles.inter14w400,
                    textAlign: TextAlign.center,
                  ),
                  20.verticalSpace,
                  Form(
                    key: provider.form,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          SvgIcons.emailLogo,
                        ),
                        20.horizontalSpace,
                        Expanded(
                          child: TextFormField(
                            style: styles.inter14w400,
                            validator: provider.emailValidator,
                            controller: provider.emailCtrl,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: AppStrings.email,
                              hintStyle: styles.inter12w400.copyWith(
                                color: styles.black.withOpacity(0.5),
                              ),
                              isDense: true,
                            ),
                          ),
                        ),
                        30.verticalSpace,
                        SizedBox(
                          width: double.infinity,
                          child: BlueElevatedButton(
                            text: AppStrings.verify.toUpperCase(),
                            onTap: () {
                              // if (EmailValidator.validate(emailCtrl.text)) {
                              // context.pop(emailCtrl.text);
                              // }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
