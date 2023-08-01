import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/text_field_widget.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/features/inbox/screens/new_conversations/new_conversation.dart';
import 'package:hive_mobile/features/inbox/view_models/inbox_screen_vm.dart';
import 'package:hive_mobile/features/inbox/widgets/inbox_shimmer_widget.dart';
import 'package:provider/provider.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return ChangeNotifierProvider(
      create: (BuildContext context) => InboxScreenVM(),
      child: Consumer<InboxScreenVM>(
        builder: (context, provider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(
                color: styles.black,
                title: AppStrings.inbox,
                titleStyle: styles.inter40w700,
                actions: [
                  IconButton(
                    onPressed: () =>
                        context.pushNamed(NewConversationScreen.route),
                    icon: SvgPicture.asset(SvgIcons.messageAdd),
                  )
                ],
              ),
              19.verticalSpace,
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 26.w,
                ),
                decoration: BoxDecoration(
                  color: styles.greyWhite,
                  borderRadius: BorderRadius.circular(
                    36.r,
                  ),
                ),
                child: TextFieldWidget(
                  hintText: AppStrings.searchMessagesHere,
                  styles: styles,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 12,
                  padding: EdgeInsets.symmetric(
                    vertical: 19.h,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: InboxShimmerWidget(),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 15.h),
                      child: Divider(
                        color: styles.black.withOpacity(0.3),
                        height: 1,
                      ),
                    )..animate(
                        onComplete: (controller) => controller.repeat(),
                      ).shimmer(
                        color: styles.greyShade200,
                        duration: const Duration(seconds: 2),
                      );
                  },
                ),
              ),
              // Expanded(
              //   child: ListView.separated(
              //     itemCount: 20,
              //     padding: EdgeInsets.symmetric(
              //       vertical: 19.h,
              //     ),
              //     itemBuilder: (context, index) {
              //       // final record = records[index];
              //       return Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 20.w),
              //         child: Column(
              //           children: [
              //             InboxListTile(
              //               onTap: () {
              //                 context.push(ChatScreen.route);
              //               },
              //               title: AppStrings.academicReport,
              //               subTitle:
              //                   'Awais Ali Khan Lorem ipsum dolor sit amet',
              //               trailing: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 crossAxisAlignment: CrossAxisAlignment.end,
              //                 children: [
              //                   Text(
              //                     '2:45PM',
              //                     style: styles.inter10w400.copyWith(
              //                         color: styles.black.withOpacity(0.5)),
              //                   ),
              //                   7.verticalSpace,
              //                   Container(
              //                     height: 7.h,
              //                     width: 7.w,
              //                     decoration: BoxDecoration(
              //                       shape: BoxShape.circle,
              //                       color: styles.linearBlueGradientTopLeft,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //     separatorBuilder: (BuildContext context, int index) {
              //       return Padding(
              //         padding: EdgeInsets.symmetric(
              //             horizontal: 20.w, vertical: 17.h),
              //         child: Divider(
              //           color: styles.black.withOpacity(0.3),
              //           height: 1,
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
