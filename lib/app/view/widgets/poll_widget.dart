import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/news_feed/view_models/news_feed_vm.dart';
import 'package:hive_mobile/features/news_feed/view_models/poll_widget_vm.dart';
import 'package:provider/provider.dart';

class PollWidget extends StatelessWidget {
  final PollWidgetVM controller;

  const PollWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final newsFeedVM = context.read<NewsFeedVM>();

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: IntrinsicHeight(
          child: IntrinsicWidth(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
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
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36.r),
                        color: controller.isSelected
                            ? styles.lavender
                            : styles.platinum,
                      ),
                      duration: Duration(milliseconds: 1200),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      children: [
                        Radio<int>(
                          value: controller.poll.id ?? 0,
                          fillColor:
                              MaterialStateProperty.resolveWith((Set states) {
                            if (states.contains(MaterialState.selected)) {
                              return styles.deepSkyBlue;
                            }
                            return Colors.white;
                          }),
                          activeColor: styles.deepSkyBlue,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          groupValue: controller.selectedPollId,
                          onChanged: (val) {},
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                            child: Text(
                              controller.labelText,
                              style: styles.inter12w400,
                              // overflow: TextOverflow.ellipsis,
                              // maxLines: 1,
                            ),
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
