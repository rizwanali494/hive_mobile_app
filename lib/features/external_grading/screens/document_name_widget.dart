import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/services/download_service/download_service.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';

class DocumentNameWidget extends StatelessWidget {
  final String name;
  final String url;

  const DocumentNameWidget({
    super.key,
    required this.name,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    ReceivePort _port = ReceivePort();

    return GestureDetector(
      onTap: () async {
        try {
          final downloadService = GetIt.instance.get<DownloadService>();
          downloadService.downloadFile(fileUrl: url, name: name);
          UtilFunctions.showToast(
              msg:
                  "Download Started. Please visit Notifications system for status.");
        } catch (e) {
          log("message : ${e.toString()}");
        }
      },
      child: DecoratedBox(
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
      ),
    );
  }
}
