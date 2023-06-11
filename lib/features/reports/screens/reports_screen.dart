import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/view_models/reports_screen_vm.dart';
import 'package:provider/provider.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    return ChangeNotifierProvider(
      create: (BuildContext context) => ReportsScreenVM(),
      child: Consumer<ReportsScreenVM>(
        builder: (context, provider, child) {
          return Scaffold(
            body: DefaultTabController(
              length: 2, // Specify the number of tabs
              child: Column(
                children: [
                  TabBar(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    isScrollable: false,
                    labelColor: styles.white,
                    padding: EdgeInsets.symmetric(horizontal: 19.w),
                    labelPadding: EdgeInsets.zero,
                    dividerColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: styles.lightGrey,
                    unselectedLabelStyle: styles.inter12w400,
                    splashBorderRadius: BorderRadius.circular(26.r),
                    indicatorPadding: EdgeInsetsDirectional.zero,
                    indicator: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(26.r),
                    ),
                    onTap: (index) {
                      provider.setIndex(index);
                    },
                    tabs: [
                      Tab(
                        child: Container(
                          height: 29.h,
                          margin: EdgeInsets.only(right: 10.w),
                          decoration: BoxDecoration(
                            color: provider.selectedIndex == 0 ? styles.skyBlue : styles.darkGrey,
                            borderRadius: BorderRadius.circular(26.r),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              AppStrings.academicReport,
                              style: styles.inter12w400.copyWith(
                                color:
                                    provider.selectedIndex == 0 ? styles.white : styles.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 29.h,
                          margin: EdgeInsets.only(left: 10.w),
                          decoration: BoxDecoration(
                            color: provider.selectedIndex == 1 ? styles.skyBlue : styles.darkGrey,
                            borderRadius: BorderRadius.circular(26.r),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              AppStrings.attendance,
                              style: styles.inter12w400.copyWith(
                                color:
                                    provider.selectedIndex == 1 ? styles.white : styles.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildRecordsList(provider.tab1Records),
                        _buildRecordsList(provider.tab2Records),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecordsList(List<Record> records) {
    return ListView.builder(
      itemCount: records.length,
      itemBuilder: (context, index) {
        final record = records[index];
        return ListTile(
          title: Text(record.title),
          subtitle: Text(record.description),
        );
      },
    );
  }
}