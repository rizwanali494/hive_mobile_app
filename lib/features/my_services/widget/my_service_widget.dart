import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class MyServiceWidget extends StatelessWidget {
  const MyServiceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child : Text(
                "School Leaving Certificate",
                style: styles.inter14w600.copyWith(
                  color: styles.darkSlateGrey,
                ),
              ),
            ),
            Text(
              "2:45PM",
              style: styles.inter10w400.copyWith(
                color: styles.darkGrey,
              ),
            ),
          ],
        ),
        Text(
          AppStrings.loremPorum * 2,
          style: styles.inter10w400.copyWith(
            color: styles.darkGrey,
          ),
        ),
        12.verticalSpace,
        Divider(
          color: styles.black.withOpacity(.2),
        ),
      ],
    );
  }
}
