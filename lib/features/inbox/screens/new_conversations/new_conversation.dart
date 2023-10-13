import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/models/data/inbox_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/inbox/screens/chat_screens/inbox_list_widget.dart';
import 'package:hive_mobile/features/inbox/view_models/inbox_list_vm.dart';
import 'package:hive_mobile/features/inbox/view_models/new_conversation_vm.dart';
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
        create: (BuildContext context) => NewConversationScreenVM(),
        child: Consumer<NewConversationScreenVM>(
          builder: (context, provider, child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DividerAppBar(title: AppStrings.newConversation),
                  InboxListWidget(
                    provider: InboxListVM(
                        hasError: provider.hasError,
                        isLoading: provider.isLoading,
                        items: provider.items,
                        listCount: provider.listCount,
                        refreshList: provider.refreshList),
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
