import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/view/widgets/blue_text_widget.dart';

import 'package:hive_mobile/app/resources/app_theme.dart';

class ProfileSectionWidget extends StatelessWidget {
  final Widget? icon;
  final Function()? onTap;
  final UiState uiState;
  final List<String> wrapChildren;
  final String heading;

  const ProfileSectionWidget({
    super.key,
    required this.wrapChildren,
    required this.heading,
    this.icon,
    required this.uiState,
    this.onTap,
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
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ...List.generate(
              wrapChildren.length,
              (index) => BlueTextWidget(
                title: wrapChildren[index],
                icon: icon,
              ),
            ),
            if (uiState.isFetchingMore || uiState.isLoading)
              const Center(
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              )
            else if (!uiState.hasAll)
              TextButton(
                onPressed: onTap,
                child: Text(
                  AppStrings.showMore,
                  style: styles.inter12w400.copyWith(color: styles.skyBlue),
                ),
              )
            else if (wrapChildren.isEmpty)
              Center(
                child: Text(
                  AppStrings.noItemsFound,
                  style: styles.inter12w400Italic,
                ),
              ),
          ],
        ),
        16.verticalSpace,
      ],
    );
  }
}
