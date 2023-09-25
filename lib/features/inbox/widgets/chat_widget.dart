import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/inbox/view_models/chat_widget_vm.dart';

class ChatWidget extends StatelessWidget {
  final ChatWidgetVM controller;

  const ChatWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 29.w,
              vertical: 29.h,
            ),
            decoration: BoxDecoration(
              color: styles.paleWhite,
              borderRadius: BorderRadius.only(
                  topLeft: buildRadius(),
                  topRight: buildRadius(),
                  bottomLeft: buildRadius()),
            ),
            child: Text(
              controller.content,
              style: styles.inter16w400,
            ),
          ),
        ),
        8.verticalSpace,
        if (controller.isSending)
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(Icons.access_time_sharp),
          )
       else if (controller.hasError)
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
                onTap: () {
                  controller.retry(context);
                },
                child: Icon(
                  Icons.error,
                  color: styles.red,
                )),
          )
        else
          Align(
            alignment: Alignment.topRight,
            child: Text(
              controller.timeSent,
              style: styles.inter10w400,
            ),
          ),
      ],
    );
  }

  Radius buildRadius() => Radius.circular(27.r);
}
