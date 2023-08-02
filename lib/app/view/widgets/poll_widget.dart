import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/news_feed/view_models/poll_widget_vm.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PollWidget extends StatelessWidget {
 final PollWidgetVM controller;

  const PollWidget({
    super.key,
    required this.selected, required this.controller,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: IntrinsicHeight(
          child: IntrinsicWidth(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                // LinearPercentIndicator(
                //   // lineHeight: 35.h,
                //   percent: controller.pollPercentage,
                //   backgroundColor: styles.smokeWhite,
                //   progressColor: selected
                //       ? styles.lavender
                //       : styles.platinum,
                //   barRadius: const Radius.circular(36),
                //   padding: EdgeInsets.zero,
                // ),
                Container(
                  // height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36.r),
                    color: styles.smokeWhite,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: FractionallySizedBox(
                    widthFactor: controller.pollPercentage,
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36.r),
                        color: selected
                              ? styles.lavender
                              : styles.platinum,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      children: [
                        Radio<bool>(
                          value: true,
                          fillColor: MaterialStateProperty.resolveWith ((Set  states) {
                            if (states.contains(MaterialState.selected)) {
                              return styles.deepSkyBlue;
                            }
                            return Colors.white;
                          }),
                          activeColor: styles.deepSkyBlue,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          groupValue: false,
                          onChanged: (val) {},
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: Text(
                            controller.labelText,
                            style: styles.inter12w400,
                            // overflow: TextOverflow.ellipsis,
                            // maxLines: 1,
                          ),
                        ),
                        10.horizontalSpace,
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${controller.pollPercentageString}%",
                            // AppStrings.percent67,
                            style: styles.inter12w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}