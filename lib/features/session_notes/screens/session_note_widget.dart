import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/description_screen.dart';

class SessionNoteWidget extends StatelessWidget {
  final bool isPending;

  const SessionNoteWidget({
    super.key,
    required this.isPending,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (!isPending) {
              context.push(DescriptionScreen.route);
            }
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  AppStrings.subjectTitle,
                  style: styles.inter12w400,
                ),
              ),
              if (isPending) 10.horizontalSpace,
              Expanded(
                flex: 2,
                child: Text(
                  AppStrings.loremPorum * 2,
                  style: styles.inter12w400,
                ),
              ),
              if (isPending)
                Column(
                  children: [
                    SvgPicture.asset(
                      SvgIcons.tickSquare,
                      colorFilter: ColorFilter.mode(
                        styles.yellowGreen,
                        BlendMode.srcIn,
                      ),
                    ),
                    6.verticalSpace,
                    SvgPicture.asset(
                      SvgIcons.undecided,
                      colorFilter: ColorFilter.mode(
                        styles.red,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        11.verticalSpace,
        Divider(
          color: styles.black.withOpacity(0.2),
        ),
      ],
    );
  }
}
