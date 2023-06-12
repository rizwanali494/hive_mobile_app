import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/view_models/reports_screen_vm.dart';
import 'package:hive_mobile/features/reports/widgets/report_list_tile.dart';
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      isScrollable: false,
                      labelColor: styles.white,
                      padding: EdgeInsets.zero,
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
                                  color: provider.selectedIndex == 0 ? styles.white : styles.black,
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
                                  color: provider.selectedIndex == 1 ? styles.white : styles.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    Container(
                      height: 29.h,
                      width: 99.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: styles.darkGrey),
                      ),
                      child: PopupMenuButton<String>(
                        initialValue: provider.selectedDropdownItem,
                        itemBuilder: (BuildContext context) {
                          return provider.dropdownItems.map((String item) {
                            return PopupMenuItem<String>(
                              value: item,
                              child: ListTile(
                                title: Text(item),
                              ),
                            );
                          }).toList();
                        },
                        onSelected: (String value) {
                          provider.setSelectedDropdownItem(value);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(provider.selectedDropdownItem),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    23.verticalSpace,
                    Container(
                      height: 29.h,
                      decoration: BoxDecoration(
                        color: styles.skyBlue.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.name,
                              style: styles.inter10w400,
                            ),
                            137.horizontalSpace,
                            Text(
                              AppStrings.date,
                              style: styles.inter10w400,
                            ),
                            78.horizontalSpace,
                            Text(
                              AppStrings.action,
                              style: styles.inter10w400,
                            ),
                          ],
                        ),
                      ),
                    ),
                    13.verticalSpace,
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _buildRecordsList(provider.tab1Records, context),
                          _buildRecordsList(provider.tab2Records, context),
                        ],
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

  Widget _buildRecordsList(List<Record> records, BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return ListView.builder(
      itemCount: records.length,
      itemBuilder: (context, index) {
        final record = records[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ReportListTile(
            onTap: () {},
            date: '14-3-2023',
            title: AppStrings.academicReport,
            trailing: Container(
              height: 21.h,
              width: 21.w,
              decoration: BoxDecoration(shape: BoxShape.circle, color: styles.yellowGreen),
              child: Icon(
                Icons.arrow_downward_sharp,
                size: 15,
                color: styles.white,
              ),
            ),
          ),
        );
      },
    );
  }
}