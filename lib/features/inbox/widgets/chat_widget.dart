import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 29.w,
            vertical: 29.h,
          ),
          decoration: BoxDecoration(
            color: styles.paleWhite,
            borderRadius: BorderRadius.only(
                topLeft: buildRadius(),
                topRight: buildRadius(),
                bottomLeft: buildRadius()),
          ),
          child: Text(
            AppStrings.loremPorum * 3,
            style: styles.inter16w400,
          ),
        ),
        12.verticalSpace,
        Align(
          alignment: Alignment.topRight,
          child: Text(
            "Sent - 2:45PM",
            style: styles.inter10w400,
          ),
        ),
      ],
    );
  }

  Radius buildRadius() => Radius.circular(27.r);
}
