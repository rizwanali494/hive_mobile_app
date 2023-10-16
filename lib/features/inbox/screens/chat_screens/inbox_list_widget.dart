import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/models/data/inbox_model.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/base_listview_widget.dart';
import 'package:hive_mobile/app/view/widgets/error_text_widget.dart';
import 'package:hive_mobile/features/inbox/view_models/inbox_list_vm.dart';
import 'package:hive_mobile/features/inbox/view_models/inboxtile_widget_vm.dart';
import 'package:hive_mobile/features/inbox/widgets/inboxListTile.dart';
import 'package:hive_mobile/features/inbox/widgets/inbox_shimmer_widget.dart';
import 'package:hive_mobile/features/inbox/screens/chat_screens/chat_screen.dart';

class InboxListWidget extends StatelessWidget {
  final InboxListVM provider;

  const InboxListWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;




    if (provider.isLoading) {
      return Expanded(
        child: ListView.separated(
          itemCount: 12,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
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
      );
    } else if (provider.hasError) {
      return ErrorTextWidget(
        onRefresh: () async {
          return;
        },
      );
    }
    return Expanded(
      child: RefreshIndicator(
        backgroundColor: styles.white,
        onRefresh: provider.refreshList,
        child: ListView.separated(
          itemCount: provider.listCount,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            vertical: 19.h,
          ),
          itemBuilder: (context, index) {
            if (provider.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  InboxListTile(
                    onTap: () {
                      context.push(
                        ChatScreen.route,
                        extra: {"receiverId": provider.items[index]},
                      );
                    },
                    controller: InboxTileWidgetVM(
                      model: provider.items[index],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            if (provider.isLoading) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
              child: Divider(
                color: styles.black.withOpacity(0.3),
                height: 1,
              ),
            );
          },
        ),
      ),
    );
  }
}
