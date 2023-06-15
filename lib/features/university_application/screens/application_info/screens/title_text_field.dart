import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/text_field_widget.dart';

class TitleTextField extends StatelessWidget {
  final String title;
  final String hintText;

  const TitleTextField({
    super.key,
    required this.title,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: Text(
            title,
            style: styles.inter14w600.copyWith(
              color: styles.darkSlateGrey,
            ),
          ),
        ),
        11.verticalSpace,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: styles.black.withOpacity(.3),
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextFieldWidget(
            styles: styles,
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
