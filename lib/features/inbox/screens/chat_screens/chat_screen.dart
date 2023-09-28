import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/models/data/inbox_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/inbox/view_models/chat_screen_vm.dart';
import 'package:hive_mobile/features/inbox/view_models/chat_widget_vm.dart';
import 'package:hive_mobile/features/inbox/view_models/date_message_class.dart';
import 'package:hive_mobile/features/news_feed/models/mock_news_feed_model.dart';
import 'package:hive_mobile/features/inbox/widgets/chat_widget.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';
import 'package:hive_mobile/features/university_application/widgets/title_text_field.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final InboxModel inboxModel;

  static const route = "/ChatScreen";

  const ChatScreen({Key? key, required this.inboxModel}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 19.w,
        ),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => ChatScreenVM(
              receiverId: widget.inboxModel.accountDataModel?.owner ?? 0),
          lazy: false,
          child: Consumer<ChatScreenVM>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  DividerAppBar(title: widget.inboxModel.accountDataModel?.extra?.employeeName??""),
                  if (provider.uiState.isLoading)
                    Expanded(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ))
                  else
                    Expanded(
                      child: ListView.builder(
                        controller: provider.controller,
                        itemCount: provider.messageData.length,
                        // reverse: true,
                        itemBuilder: (context, index) {
                          final list = provider.messageData;
                          var element = list[index];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (element is MessageDate) ...[
                                Row(
                                  children: [
                                    buildDivider(styles),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      child: Text(
                                        element.date,
                                        style: styles.inter9w400,
                                      ),
                                    ),
                                    buildDivider(styles),
                                  ],
                                ),
                                34.verticalSpace,
                              ] else if (element is MessageData) ...[
                                ChatWidget(
                                  controller: ChatWidgetVM(
                                    model: element.model,
                                  ),
                                ),
                                8.verticalSpace,
                              ]
                              //  ChatWidget(),
                              // 25.verticalSpace,
                            ],
                          );
                        },
                      ),
                    ),
                  12.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: styles.greyWhite,
                            border: Border.all(color: styles.skyBlue),
                            borderRadius: BorderRadius.circular(36.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 26.w,
                            ),
                            child: TitleTextField(
                              hintText: AppStrings.typeMessagesHere,
                              controller: provider.messageCtrl,
                              textFieldOnly: true,
                            ),
                          ),
                        ),
                      ),
                      11.horizontalSpace,
                      GestureDetector(
                        onTap: () {
                          provider.sendMessage();
                        },
                        child: SvgPicture.asset(SvgIcons.send),
                      )
                    ],
                  ),
                  12.verticalSpace,
                ],
              );
            },
          ),
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
