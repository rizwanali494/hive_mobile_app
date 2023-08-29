import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/features/reports/widgets/tab_bar_widget.dart';
import 'package:hive_mobile/features/session_notes/screens/session_note_widget.dart';
import 'package:hive_mobile/features/session_notes/view_models/session_note_vm.dart';
import 'package:hive_mobile/features/session_notes/view_models/session_note_widget_vm.dart';
import 'package:provider/provider.dart';

class SessionNotesScreen extends StatefulWidget {
  static const route = "/SessionNotes";

  const SessionNotesScreen({Key? key}) : super(key: key);

  @override
  State<SessionNotesScreen> createState() => _SessionNotesScreenState();
}

class _SessionNotesScreenState extends State<SessionNotesScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return ChangeNotifierProvider(
      create: (BuildContext context) => SessionNoteVM(),
      child: Consumer<SessionNoteVM>(
        builder: (context, provider, child) {
          return Scaffold(
            body: DefaultTabController(
              length: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: Column(
                  children: [
                    AppBarWidget(
                      color: styles.black,
                      title: AppStrings.sessionNote,
                      horizontalPadding: 0,
                    ),
                    21.verticalSpace,
                    TabBarWidget(
                      onTap: (index) {
                        provider.setIndex(index);
                      },
                      selectedIndex: provider.selectedIndex,
                      tab1Title: AppStrings.acknowledged,
                      tab2Title: AppStrings.pending,
                    ),
                    25.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6.h,
                        horizontal: 19.w,
                      ),
                      decoration: BoxDecoration(
                        color: styles.lightCyan,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppStrings.subjectTitle,
                              style: styles.inter12w400,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              AppStrings.description,
                              style: styles.inter12w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 21.w),
                        child: MultiProvider(
                          providers: [
                            ChangeNotifierProvider(
                              create: (context) => SessionNoteWidgetVM(
                                endPoint:
                                    AppStrings.sessionNote.withNotPendingState,
                              ),
                              key: Key("ack"),
                              lazy: false,
                            ),
                            ChangeNotifierProvider(
                              create: (context) => SessionNoteWidgetVM(
                                endPoint:
                                    AppStrings.sessionNote.withPendingState,
                              ),
                              key: Key("pending"),
                              lazy: false,
                            ),
                          ],
                          child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              Consumer<SessionNoteWidgetVM>(
                                key: Key("ack"),
                                builder: (context, provider, child) {
                                  log("key ::: ${provider.endPoint}");
                                  return ListView.separated(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 18.h),
                                    itemBuilder: (context, index) {
                                      return SessionNoteWidget(
                                        isPending: false,
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return 14.verticalSpace;
                                    },
                                    itemCount: 20,
                                  );
                                },
                              ),
                              Consumer<SessionNoteWidgetVM>(
                                key: Key("pending"),
                                builder: (context, provider, child) {
                                  log("key ::: ${provider.endPoint}");
                                  return ListView.separated(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 14.h),
                                    itemBuilder: (context, index) {
                                      return SessionNoteWidget(
                                        isPending: true,
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return 14.verticalSpace;
                                    },
                                    itemCount: 20,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
