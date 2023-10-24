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
import 'package:hive_mobile/features/university_application/widgets/title_text_field.dart';
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 64.w
                  ),
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
                        AppStrings.emailVerification,
                        textAlign: TextAlign.center,
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
                        child: TitleTextField(
                          controller: provider.emailCtrl,
                          // showBorder: false,
                          prefixIcon: SvgPicture.asset(
                            SvgIcons.emailLogo,
                            width: 14.w,
                            height: 20.h,
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 50,
                            maxWidth: 60.w,
                            minHeight: 0,
                            maxHeight: 20.h,
                          ),
                          validator: provider.emailValidator,
                          hintText: AppStrings.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      28.verticalSpace,
                      SizedBox(
                        width: double.infinity,
                        child: BlueElevatedButton(
                          text: AppStrings.verify.toUpperCase(),
                          onTap: () {
                            provider.validate(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
