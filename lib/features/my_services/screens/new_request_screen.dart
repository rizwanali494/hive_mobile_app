import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/dialogs/blue_elevated_button.dart';
import 'package:hive_mobile/features/university_application/screens/application_info/screens/title_text_field.dart';
import 'package:hive_mobile/features/university_application/screens/application_request/screens/divider_app_bar.dart';

class NewRequestScreen extends StatefulWidget {
  static const route = "/NewRequest";

  const NewRequestScreen({Key? key}) : super(key: key);

  @override
  State<NewRequestScreen> createState() => _NewRequestScreenState();
}

class _NewRequestScreenState extends State<NewRequestScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 19.w,
        ),
        child: Column(
          children: [
            DividerAppBar(
              title: AppStrings.newRequest,
              titleStyle: styles.inter20w700,
            ),
            16.verticalSpace,
            TitleTextField(
                title: AppStrings.myRequest,
                hintText: AppStrings.characterCertificate),
            11.verticalSpace,
            Row(
              children: [
                SvgPicture.asset(
                  SvgIcons.tickSquare,
                  colorFilter:
                      ColorFilter.mode(styles.skyBlue, BlendMode.srcIn),
                ),
                9.horizontalSpace,
                Text(
                  AppStrings.subjectChange,
                  style: styles.inter12w400,
                ),
              ],
            ),
            29.verticalSpace,
            TitleTextField(
              title: AppStrings.description,
              hintText: AppStrings.loremPorum * 2,
              maxLines: 5,
            ),
            23.verticalSpace,
            Align(alignment: Alignment.topLeft,child: BlueElevatedButton(text: AppStrings.sendRequest))
          ],
        ),
      ),
    );
  }
}
