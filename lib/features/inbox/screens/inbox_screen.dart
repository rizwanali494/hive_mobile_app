import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/home/screens/app_bar_widget.dart';
import 'package:hive_mobile/features/inbox/screens/new_conversations/new_conversation.dart';
import 'package:hive_mobile/features/inbox/view_models/inbox_screen_vm.dart';
import 'package:hive_mobile/features/inbox/widgets/inboxListTile.dart';
import 'package:provider/provider.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
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
                onMenuTap: () {},
                actions: [
                  IconButton(
                    onPressed: () => context.pushNamed(NewConversationScreen.route),
                    icon: SvgPicture.asset(SvgIcons.messageAdd),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    // final record = records[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          InboxListTile(
                            onTap: () {},
                            title: AppStrings.academicReport,
                            subTitle: 'Awais Ali Khan Lorem ipsum dolor sit amet',
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '2:45PM',
                                  style: styles.inter10w400,
                                ),
                                7.verticalSpace,
                                Container(
                                  height: 7.h,
                                  width: 7.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: styles.linearBlueGradientTopLeft,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black45),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}