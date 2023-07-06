import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/text_field_widget.dart';
import 'package:hive_mobile/features/news_feed/models/mock_news_feed_model.dart';
import 'package:hive_mobile/features/inbox/widgets/chat_widget.dart';
import 'package:hive_mobile/features/university_application/screens/application_request/screens/divider_app_bar.dart';

class ChatScreen extends StatelessWidget {
  static const route = "/ChatScreen";

  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 19.w,
        ),
        child: Column(
          children: [
            DividerAppBar(title: _user.name),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          buildDivider(styles),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              "Wednesday - 12:45PM",
                              style: styles.inter9w400,
                            ),
                          ),
                          buildDivider(styles),
                        ],
                      ),
                      34.verticalSpace,
                      const ChatWidget(),
                      8.verticalSpace,
                      const ChatWidget(),
                      // 14.verticalSpace,
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //             color: styles.greyWhite,
                      //             border: Border.all(color: styles.skyBlue),
                      //             borderRadius: BorderRadius.circular(36.r)),
                      //         child: Padding(
                      //           padding: EdgeInsets.symmetric(
                      //             horizontal: 26.w,
                      //           ),
                      //           child: TextFieldWidget(
                      //             hintText: AppStrings.typeMessagesHere,
                      //             styles: styles,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     11.horizontalSpace,
                      //     SvgPicture.asset(SvgIcons.send)
                      //   ],
                      // ),
                      25.verticalSpace,
                    ],
                  );
                },
              ),
            ),
            // Expanded(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Row(
            //         children: [
            //           buildDivider(styles),
            //           Padding(
            //             padding: EdgeInsets.symmetric(horizontal: 8.w),
            //             child: Text(
            //               "Wednesday - 12:45PM",
            //               style: styles.inter9w400,
            //             ),
            //           ),
            //           buildDivider(styles),
            //         ],
            //       ),
            //       34.verticalSpace,
            //       const ChatWidget(),
            //       8.verticalSpace,
            //       const ChatWidget(),
            //       14.verticalSpace,
            //       Row(
            //         children: [
            //           Expanded(
            //             child: Container(
            //               decoration: BoxDecoration(
            //                   color: styles.greyWhite,
            //                   border: Border.all(color: styles.skyBlue),
            //                   borderRadius: BorderRadius.circular(36.r)),
            //               child: Padding(
            //                 padding: EdgeInsets.symmetric(
            //                   horizontal: 26.w,
            //                 ),
            //                 child: TextFieldWidget(
            //                   hintText: AppStrings.typeMessagesHere,
            //                   styles: styles,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           11.horizontalSpace,
            //           SvgPicture.asset(SvgIcons.send)
            //         ],
            //       ),
            //       25.verticalSpace,
            //     ],
            //   ),
            // ),
            12.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: styles.greyWhite,
                        border: Border.all(color: styles.skyBlue),
                        borderRadius: BorderRadius.circular(36.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 26.w,
                      ),
                      child: TextFieldWidget(
                        hintText: AppStrings.typeMessagesHere,
                        styles: styles,
                      ),
                    ),
                  ),
                ),
                11.horizontalSpace,
                SvgPicture.asset(SvgIcons.send)
              ],
            ),
            12.verticalSpace,
          ],
        ),
      ),
    );
  }

  Radius buildRadius() => Radius.circular(27.r);

  Expanded buildDivider(AppTheme styles) {
    return Expanded(
      child: Container(
        height: 1,
        decoration: BoxDecoration(
          color: styles.black.withOpacity(0.5),
        ),
      ),
    );
  }



}


const _user = MockNewsFeedModel.user;
