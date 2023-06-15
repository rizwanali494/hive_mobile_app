import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/drop_down/dropdown_button2.dart';
import 'package:hive_mobile/features/home/screens/app_bar_widget.dart';
import 'package:hive_mobile/features/reports/view_models/reports_screen_vm.dart';
import 'package:hive_mobile/features/reports/widgets/report_list_tile.dart';
import 'package:hive_mobile/features/reports/widgets/tab_bar_widget.dart';
import 'package:provider/provider.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return ChangeNotifierProvider(
      create: (BuildContext context) => ReportsScreenVM(),
      child: Consumer<ReportsScreenVM>(
        builder: (context, provider, child) {
          return DefaultTabController(
            length: 2, // Specify the number of tabs
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarWidget(
                  color: styles.black,
                  title: AppStrings.reports,
                  titleStyle: styles.inter40w700,
                  onMenuTap: () {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: TabBarWidget(
                    onTap: (index) {
                      provider.setIndex(index);
                    },
                    selectedIndex: provider.selectedIndex,
                    tab1Title: AppStrings.academicReport,
                    tab2Title: AppStrings.attendance,
                  ),
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Text(
                            AppStrings.overAll,
                            style: styles.inter12w400,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      items: provider.items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: styles.inter12w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: provider.selectedValue,
                      onChanged: (value) {
                        provider.setSelectedValue(value!);
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 29.h,
                        width: 99.w,
                        padding: EdgeInsets.only(left: 13.w, right: 14.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: styles.black,
                          ),
                          color: styles.smokeWhite,
                        ),
                        elevation: 0,
                      ),
                      iconStyleData: IconStyleData(
                        icon: const Icon(
                          Icons.keyboard_arrow_down_sharp,
                        ),
                        iconSize: 14,
                        iconEnabledColor: styles.black,
                        iconDisabledColor: styles.black,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 200,
                        padding: null,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: styles.smokeWhite,
                        ),
                        elevation: 8,
                        offset: const Offset(-20, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all<double>(6),
                          thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                ),
                23.verticalSpace,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 19.w),
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
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: ReportListTile(
                  onTap: () {},
                  date: '14-3-2023',
                  title: AppStrings.academicReport,
                  trailing: Container(
                    height: 21.h,
                    width: 21.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: styles.yellowGreen),
                    child: Icon(
                      Icons.arrow_downward_sharp,
                      size: 15,
                      color: styles.white,
                    ),
                  ),
                ),
              ),
              const Divider(color: Colors.black45),
            ],
          ),
        );
      },
    );
  }
}
