import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/models/data/inbox_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/inbox/screens/chat_screens/chat_screen.dart';
import 'package:hive_mobile/features/inbox/screens/new_conversations/new_conversation_vm.dart';
import 'package:hive_mobile/features/inbox/view_models/inboxtile_widget_vm.dart';
import 'package:hive_mobile/features/inbox/widgets/inboxListTile.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';
import 'package:provider/provider.dart';

class NewConversationScreen extends StatelessWidget {
  final List<InboxModel> conversation;

  static const route = '/NewConversationScreen';

  const NewConversationScreen({Key? key, required this.conversation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) =>
            NewConversationScreenVM(conversations: conversation),
        child: Consumer<NewConversationScreenVM>(
          builder: (context, provider, child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DividerAppBar(title: AppStrings.newConversation),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 20,
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                      ),
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 17.h),
                          child: Divider(
                            color: styles.black.withOpacity(0.3),
                            height: 1,
                          ),
                        );
                      },
                      itemBuilder: (context, index) {
                        // final record = records[index];
                        return Column(
                          children: [
                            InboxListTile(
                              contentPadding: EdgeInsets.only(
                                top: 20.h,
                                bottom: 20.h,
                              ),
                              onTap: () {
                                context.push(
                                  ChatScreen.route,
                                  extra: {
                                    "receiverId":
                                        provider.conversations[index].id
                                  },
                                );
                              },
                              controller: InboxTileWidgetVM(
                                model: provider.conversations[index],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
