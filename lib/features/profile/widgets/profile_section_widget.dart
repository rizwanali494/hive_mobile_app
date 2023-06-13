import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/view/widgets/blue_text_widget.dart';

import '../../../app/resources/app_theme.dart';

class ProfileSectionWidget extends StatelessWidget {
  final Widget? icon;
  final List<String> wrapChildren;
  final String heading;

  const ProfileSectionWidget({
    super.key,
    required this.wrapChildren,
    required this.heading,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: styles.inter16w600.copyWith(
            color: styles.darkSlateGrey,
          ),
        ),
        12.verticalSpace,
        Wrap(
          runSpacing: 8.w,
          spacing: 5.h,
          children: [
            ...List.generate(
              wrapChildren.length,
              (index) => BlueTextWidget(title: wrapChildren[index],icon: icon,),
            ),
          ],
        ),
        16.verticalSpace,

      ],
    );
  }
}
