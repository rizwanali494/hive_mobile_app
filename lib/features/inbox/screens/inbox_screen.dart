import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/models/data/inbox_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/app/view/widgets/base_listview_widget.dart';
import 'package:hive_mobile/features/inbox/screens/chat_screens/chat_screen.dart';
import 'package:hive_mobile/features/inbox/screens/inbox_search_screen.dart';
import 'package:hive_mobile/features/inbox/screens/new_conversations/new_conversation.dart';
import 'package:hive_mobile/features/inbox/view_models/inbox_screen_vm.dart';
import 'package:hive_mobile/features/inbox/view_models/inboxtile_widget_vm.dart';
import 'package:hive_mobile/features/inbox/widgets/inboxListTile.dart';
import 'package:hive_mobile/features/inbox/widgets/inbox_shimmer_widget.dart';
import 'package:hive_mobile/features/university_application/widgets/title_text_field.dart';
import 'package:provider/provider.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Consumer<InboxScreenVM>(
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
                  onPressed: () {
                    context.pushNamed(NewConversationScreen.route, extra: {
                      "list": provider.newConversation,
                    }).then((value) => provider.refreshList());
                  },
                  icon: SvgPicture.asset(SvgIcons.messageAdd),
                )
              ],
            ),
            19.verticalSpace,
            GestureDetector(
              onTap: () {
                context
                    .push(InboxSearchScreen.route)
                    .then((value) => provider.refreshList());
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                // padding: EdgeInsets.symmetric(
                //   horizontal: 26.w,
                // ),
                decoration: BoxDecoration(
                  color: styles.greyWhite,
                  borderRadius: BorderRadius.circular(
                    36.r,
                  ),
                ),
                child: TitleTextField(
                  hintText: AppStrings.searchMessagesHere,
                  textFieldOnly: true,
                  enabled: false,
                ),
              ),
            ),
            5.verticalSpace,
            BaseListViewWidget<InboxModel>(
              controller: provider.listViewVM,
              emptyText: AppStrings.noDataFound,
              listViewChild: (item) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: InboxListTile(
                  onTap: () {
                    context.push(
                      ChatScreen.route,
                      extra: {"receiverId": item},
                    ).then((value) => provider.refreshList());
                  },
                  controller: InboxTileWidgetVM(
                    model: item,
                  ),
                ),
              ),
              listSeparatorChild: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: Divider(
                  color: styles.black.withOpacity(0.3),
                  height: 1,
                  thickness: 0.5,
                ),
              ),
              shimmerChild: Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: InboxShimmerWidget(),
              ),
            )
            // InboxListWidget(
            //   provider: InboxListVM(
            //       hasError: provider.hasError,
            //       isLoading: provider.isLoading,
            //       items: provider.items,
            //       listCount: provider.listCount,
            //       refreshList: provider.refreshList),
            // ),
          ],
        );
      },
    );
  }
}
