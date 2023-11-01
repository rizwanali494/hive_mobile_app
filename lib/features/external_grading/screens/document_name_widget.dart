import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class DocumentNameWidget extends StatelessWidget {
  final String name;

  const DocumentNameWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return DecoratedBox(
      // width: 65.w,
      // constraints: BoxConstraints(maxHeight: 24.h),
      decoration: BoxDecoration(
        color: styles.whiteSmoke,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 24.2,
            height: 24.h,
            decoration: BoxDecoration(
                color: styles.lavender,
                borderRadius: BorderRadius.circular(4.r)),
          ),
          4.horizontalSpace,
          Flexible(
            child: Text(
              name,
              style: styles.inter9w400,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          5.horizontalSpace,
        ],
      ),
    );
  }
}
