import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/features/university_application/screens/application_request/screens/divider_app_bar.dart';

import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class DescriptionScreen extends StatelessWidget {
  static const route = "/DescriptionScreen";
  final String? title;

  const DescriptionScreen({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 19.w
            ),
            child: DividerAppBar(
              title: title ?? AppStrings.subjectTitle,
            ),
          ),
          26.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 23.w
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.description,
                    style: styles.inter14w600.copyWith(
                      color: styles.darkSlateGrey,
                    ),
                  ),
                  22.verticalSpace,
                  Text(
                    AppStrings.loremPorum*15,
                    style: styles.inter12w400,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
