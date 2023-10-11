import 'dart:developer';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view_models/document_widget_controller.dart';

class DocumentUploadWidget extends StatelessWidget {
  final DocumentWidgetController controller;

  const DocumentUploadWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    // if (controller.isDownloading) {
    //   return Padding(
    //     padding: EdgeInsets.symmetric(vertical: 10.h),
    //     child: Center(child: CircularProgressIndicator()),
    //   );
    // }

    return Container(
      margin: EdgeInsets.only(
        bottom: 28.h,
      ),
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
          Expanded(
            child: Row(
              children: [
                badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: styles.greyWhite,
                  ),
                  position: badges.BadgePosition.topEnd(end: -5),
                  onTap: () {
                    controller.onRemove!(controller.id ?? 0);
                  },
                  badgeContent: Icon(
                    Icons.close,
                    size: 10,
                    color: styles.darkGrey,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      controller.onRemove!(controller.id ?? 0);
                    },
                    child: Container(
                      width: 51.w,
                      height: 51.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        color: styles.greyWhite,
                      ),
                      child: controller.file != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(
                                10.r,
                              ),
                              child: Image.file(
                                controller.file!,
                                fit: BoxFit.cover,
                              ))
                          : null,
                    ),
                  ),
                ),
                11.horizontalSpace,
                Expanded(
                  child: Text(
                    controller.documentName ?? AppStrings.documentName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: styles.inter12w400,
                  ),
                )
              ],
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     if (controller.onTap != null) {
          //       controller.onTap!(context);
          //     }
          //   },
          //   style: ElevatedButton.styleFrom(
          //       backgroundColor: styles.lightGrey,
          //       minimumSize: const Size(0, 0),
          //       padding: EdgeInsetsDirectional.symmetric(
          //         horizontal: 25.w,
          //         vertical: 6.h,
          //       )),
          //   child: Text(
          //     AppStrings.select,
          //     style: styles.inter12w400.copyWith(
          //       color: styles.darkGrey,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
