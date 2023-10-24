import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/email_verification/controllers/mail_sent_controller.dart';
import 'package:provider/provider.dart';

class MailSentScreen extends StatelessWidget {
  final String email;

  static const route = "/MailSent";

  const MailSentScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => MailSentController(),
        child: Consumer<MailSentController>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.verticalSpace,
                Image(
                  image: AssetImage(
                    SvgIcons.hiveLogo,
                  ),
                  width: 109.w,
                  height: 55.h,
                ),
                142.verticalSpace,
                SvgPicture.asset(
                  SvgIcons.emailLogo,
                  width: 83.w,
                  height: 56.h,
                ),
                32.verticalSpace,
                Text(
                  'Mail has been sent to your given email address',
                  style: styles.inter16w400,
                ),
                actionButton(
                    onTap: () {
                      provider.resendEmail(email: email);
                    },
                    text: "Resend"),
                actionButton(
                    onTap: () {
                      provider.changeEmail(context);
                    },
                    text: "Change Email"),
                actionButton(
                    onTap: () {
                      provider.checkStatus(context);
                    },
                    text: "Check Status"),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget actionButton({required Function() onTap, required String text}) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
      ),
    );
  }
}
