import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/features/inbox/screens/chat_screens/inbox_list_widget.dart';
import 'package:hive_mobile/features/inbox/screens/new_conversations/new_conversation.dart';
import 'package:hive_mobile/features/inbox/view_models/inbox_list_vm.dart';
import 'package:hive_mobile/features/inbox/view_models/inbox_screen_vm.dart';
import 'package:hive_mobile/features/inbox/view_models/inbox_search_vm.dart';
import 'package:hive_mobile/features/inbox/view_models/inboxtile_widget_vm.dart';
import 'package:hive_mobile/features/inbox/widgets/inboxListTile.dart';
import 'package:hive_mobile/features/inbox/widgets/inbox_shimmer_widget.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';
import 'package:hive_mobile/features/university_application/widgets/title_text_field.dart';
import 'package:provider/provider.dart';

import 'package:hive_mobile/features/inbox/screens/chat_screens/chat_screen.dart';

import 'package:hive_mobile/app/view/widgets/error_text_widget.dart';

class InboxSearchScreen extends StatelessWidget {
  static const route = "/InboxSearch";

  const InboxSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => InboxSearchVM(),
        child: Consumer<InboxSearchVM>(
          builder: (context, provider, child) {
            return Padding(
              padding: MediaQuery.of(context).padding,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 19.w,
                ),
                child: Column(
                  children: [
                    19.verticalSpace,
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10.w,
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
                            child: TitleTextField(
                              hintText: AppStrings.searchMessagesHere,
                              textFieldOnly: true,
                              textFormField: TextFormField(
                                controller: provider.controller,
                                style: styles.inter12w400,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: AppStrings.searchMessagesHere,
                                    hintStyle: styles.inter12w400,
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  provider.search();
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Divider(
                      thickness: 0.5,
                      color: styles.black.withOpacity(0.5),
                    ),
                    InboxListWidget(
                      provider: InboxListVM(
                        hasError: provider.hasError,
                        isLoading: provider.isLoading,
                        items: provider.items,
                        listCount: provider.listCount,
                        refreshList: provider.refreshList,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );

    return ChangeNotifierProvider(
      create: (BuildContext context) => InboxScreenVM(),
      child: Consumer<InboxSearchVM>(
        builder: (context, provider, child) {
          return InboxListWidget(
            provider: InboxListVM(
                hasError: provider.hasError,
                isLoading: provider.isLoading,
                items: provider.items,
                listCount: provider.listCount,
                refreshList: provider.refreshList),
          );
        },
      ),
    );
  }
}
