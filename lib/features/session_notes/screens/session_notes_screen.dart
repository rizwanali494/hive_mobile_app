import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/models/data/session_note_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/app/view/widgets/error_text_widget.dart';
import 'package:hive_mobile/features/notification/widgets/notification_shimmer_widget.dart';
import 'package:hive_mobile/features/reports/widgets/tab_bar_widget.dart';
import 'package:hive_mobile/features/session_notes/screens/session_note_widget.dart';
import 'package:hive_mobile/features/session_notes/view_models/pending_session_note_vm.dart';
import 'package:hive_mobile/features/session_notes/view_models/session_note_vm.dart';
import 'package:hive_mobile/features/session_notes/view_models/ack_session_note_vm.dart';
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
                            ChangeNotifierProvider<ACKSessionNoteVM>(
                              create: (context) => ACKSessionNoteVM(),
                              key: Key("ack"),
                            ),
                            ChangeNotifierProvider<PendingSessionNoteVM>(
                              create: (context) => PendingSessionNoteVM(),
                              key: Key("pending"),
                            ),
                          ],
                          child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              Consumer<ACKSessionNoteVM>(
                                key: Key("ack"),
                                builder: (context, provider, child) {
                                  return buildListView(
                                      isLoading: provider.uiState.isLoading,
                                      hasError: provider.uiState.hasError,
                                      list: provider.items,
                                      listCount: provider.listCount,
                                      controller: provider.scrollController,
                                      onRefresh: provider.refreshList,
                                      isGettingMore: provider.isGettingMore);
                                },
                              ),
                              Consumer<PendingSessionNoteVM>(
                                key: Key("pending"),
                                builder: (context, provider, child) {
                                  return buildListView(
                                      isLoading: provider.uiState.isLoading,
                                      hasError: provider.uiState.hasError,
                                      list: provider.items,
                                      listCount: provider.listCount,
                                      controller: provider.scrollController,
                                      onRefresh: provider.refreshList,
                                      isGettingMore: provider.isGettingMore);
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

  Widget buildListView({
    required bool isLoading,
    required bool isGettingMore,
    required bool hasError,
    required List<SessionNoteModel> list,
    required int listCount,
    required ScrollController controller,
    required Future<void> Function() onRefresh,
  }) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final color = styles.greayShade300;


    if (isLoading) {
      return ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
        ),
        separatorBuilder: (context, index) {
          return 20.verticalSpace;
        },
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 50.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                      color: color,
                    ),
                  ),
                  5.verticalSpace,
                  Container(
                    width: 50.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                      color: color,
                    ),
                  ),
                ],
              ),
              55.horizontalSpace,
              Container(
                width: 150.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: color,
                ),
              ),

            ],
          ).animate(
            onComplete: (controller) => controller.repeat(),
          )
              .shimmer(
            color: styles.greyShade200,
            duration: const Duration(seconds: 2),
          );
          // return NotificationShimmerWidget();
        },
        itemCount: 12,
      );
    } else {
      if (hasError) {
        return ErrorTextWidget(
          onRefresh: onRefresh,
        );
      }
      return RefreshIndicator(
        onRefresh: onRefresh,
        backgroundColor: styles.white,
        child: ListView.separated(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 18.h),
          itemBuilder: (context, index) {
            if (index == list.length) {
              if (isGettingMore) {
                return Center(child: CircularProgressIndicator());
              }
              return SizedBox.shrink();
            }

            return SessionNoteWidget(
              isPending: list[index].isPending,
              controller: SessionNoteWidgetVM(
                model: list[index],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return 14.verticalSpace;
          },
          itemCount: listCount,
        ),
      );
      //   else {
      //     if (list.isNotEmpty) {
      //       return ListView.separated(
      //         padding: EdgeInsets.symmetric(vertical: 18.h),
      //         itemBuilder: (context, index) {
      //           if (index == list.length) {
      //             if (isGettingMore) {
      //               return Center(child: CircularProgressIndicator());
      //             }
      //             return SizedBox.shrink();
      //           }
      //
      //           return SessionNoteWidget(
      //             isPending: list[index].isPending,
      //             controller: SessionNoteWidgetVM(
      //               model: list[index],
      //             ),
      //           );
      //         },
      //         separatorBuilder: (BuildContext context, int index) {
      //           return 14.verticalSpace;
      //         },
      //         itemCount: listCount,
      //       );
      //     }
      //   }
      // }
      // return Center(
      //   child: Text("No Session Note Found"),
      // );
    }
  }
}
