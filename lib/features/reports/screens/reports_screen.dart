import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/drop_down/dropdown_button2.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/features/reports/view_models/reports_screen_vm.dart';
import 'package:hive_mobile/features/reports/widgets/report_list_tile.dart';
import 'package:hive_mobile/features/reports/widgets/tab_bar_widget.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';
import 'package:provider/provider.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return ChangeNotifierProvider(
      create: (BuildContext context) => ReportsScreenVM(),
      child: Consumer<ReportsScreenVM>(
        builder: (context, provider, child) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 19.w,
            ),
            child: Column(
              children: [
                DividerAppBar(title: AppStrings.reports),
                27.verticalSpace,
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Image(
                        width: 138.w,
                        height: 54.h,
                        image: AssetImage(SvgIcons.bcpCollegeIcon),
                      ),
                      VerticalDivider(
                        color: styles.black,
                        thickness: 0.5,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textColumn("ID","01234567"),
                              textColumn("Name","Abdul Rehman"),
                              textColumn("Academic Year","Aug,2020 - July,2021"),
                            ],
                          ),
                          29.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textColumn("Class","CAIE A LEVEL - Year 1"),
                              textColumn("ID","01234567"),
                              textColumn("ID","01234567"),
                            ],
                          ),
                        ],
                      ),
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

  Widget textColumn(String heading,String description) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Padding(
      padding: EdgeInsets.only(
        bottom: 2.5.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: styles.inter8w600,
          ),
          Text(
            description,
            style: styles.inter8w400,
          ),
        ],
      ),
    );
  }
}
