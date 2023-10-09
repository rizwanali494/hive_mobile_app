import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class ErrorTextWidget extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final String? errorText;

  const ErrorTextWidget({super.key, required this.onRefresh, this.errorText});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return LayoutBuilder(
      builder: (context, constraints) => RefreshIndicator(
        onRefresh: onRefresh,
        backgroundColor: styles.white,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  errorText ?? AppStrings.somethingWentWrong,
                  style: styles.inter20w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
