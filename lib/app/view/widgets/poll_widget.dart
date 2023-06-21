import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PollWidget extends StatelessWidget {
  final String value;
  final bool isSelected;
  final double percentage;

  const PollWidget({
    super.key,
    required this.selected,
    required this.value,
    required this.isSelected,
    required this.percentage,
  });

  final String selected;

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
              children: [
                LinearPercentIndicator(
                  lineHeight: 35.h,
                  percent: percentage,
                  backgroundColor: styles.smokeWhite,
                  progressColor: isSelected
                      ? styles.lavender
                      : styles.platinum,
                  barRadius: const Radius.circular(36),
                  padding: EdgeInsets.zero,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      children: [
                        Radio<String>(
                          value: value,
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
                          groupValue: selected,
                          onChanged: (val) {},
                        ),
                        10.horizontalSpace,
                        Text(
                          AppStrings.loremPorum,
                          style: styles.inter12w400,
                          maxLines: 1,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "${(percentage*100).toStringAsFixed(0)}%",
                              // AppStrings.percent67,
                              style: styles.inter12w600,
                            ),
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