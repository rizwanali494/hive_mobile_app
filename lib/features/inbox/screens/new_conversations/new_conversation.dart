import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/inbox/screens/new_conversations/new_conversation_vm.dart';
import 'package:hive_mobile/features/inbox/widgets/inboxListTile.dart';
import 'package:provider/provider.dart';

class NewConversationScreen extends StatelessWidget {
  static const route = '/NewConversationScreen';

  const NewConversationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 20.h,
            color: styles.black,
          ),
        ),
        titleSpacing: 0.w,
        title: Text(
          AppStrings.newConversation,
          style: styles.inter20w700,
        ),
      ),
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
                  const Divider(color: Colors.black45),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        // final record = records[index];
                        return Column(
                          children: [
                            InboxListTile(
                              contentPadding: EdgeInsets.only(
                                top: 20.h,
                                bottom: 20.h,
                              ),
                              onTap: () {},
                              title: 'Awais Ali Khan',
                              subTitle: 'Awais Ali Khan Lorem ipsum dolor sit amet',
                            ),
                            const Divider(color: Colors.black45),
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