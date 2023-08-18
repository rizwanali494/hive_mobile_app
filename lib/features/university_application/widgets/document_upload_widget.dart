import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class DocumentUploadWidget extends StatelessWidget {


  const DocumentUploadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 19.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: styles.black.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  badgeColor: styles.greyWhite,
                ),
                position: badges.BadgePosition.topEnd(end: -5),
                badgeContent: Icon(
                  Icons.close,
                  size: 10,
                  color: styles.darkGrey,
                ),
                child: Container(
                  width: 51.w,
                  height: 51.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: styles.greyWhite,
                  ),
                ),
              ),
              11.horizontalSpace,
              Text(AppStrings.documentName)
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: styles.lightGrey,
                minimumSize: const Size(0, 0),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 25.w,
                  vertical: 6.h,
                )),
            child: Text(
              AppStrings.upload,
              style: styles.inter12w400.copyWith(
                color: styles.darkGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
