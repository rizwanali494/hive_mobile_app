import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/view_models/reports_screen_vm.dart';
import 'package:hive_mobile/features/reports/widgets/report_list_tile.dart';
import 'package:provider/provider.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'Apple'),
      Company(2, 'Google'),
      Company(3, 'Samsung'),
      Company(4, 'Sony'),
      Company(5, 'LG'),
    ];
  }
}

class _ReportsScreenState extends State<ReportsScreen> {
  List<Company> _companies = Company.getCompanies();
  late List<DropdownMenuItem<Company>> _dropdownMenuItems;
  late Company _selectedCompany;
  String dropdownValue = 'Dog';
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value!;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = [];
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

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
                    // DropdownButtonHideUnderline(
                    //   child: DropdownButton2(
                    //     isExpanded: true,
                    //     hint: Row(
                    //       children: [
                    //         Text(
                    //           AppStrings.overAll,
                    //           style: styles.inter12w400,
                    //           overflow: TextOverflow.ellipsis,
                    //         ),
                    //       ],
                    //     ),
                    //     items: items
                    //         .map((item) => DropdownMenuItem<String>(
                    //               value: item,
                    //               child: Text(
                    //                 item,
                    //                 style: styles.inter12w400,
                    //                 overflow: TextOverflow.ellipsis,
                    //               ),
                    //             ))
                    //         .toList(),
                    //     value: selectedValue,
                    //     onChanged: (value) {
                    //       setState(() {
                    //         selectedValue = value as String;
                    //       });
                    //     },
                    //     buttonStyleData: ButtonStyleData(
                    //       height: 29.h,
                    //       width: 99.w,
                    //       padding: EdgeInsets.only(left: 13.w, right: 14.w),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(14),
                    //         border: Border.all(
                    //           color: styles.black,
                    //         ),
                    //         color: styles.smokeWhite,
                    //       ),
                    //       elevation: 0,
                    //     ),
                    //     iconStyleData: IconStyleData(
                    //       icon: const Icon(
                    //         Icons.keyboard_arrow_down_sharp,
                    //       ),
                    //       iconSize: 14,
                    //       iconEnabledColor: styles.black,
                    //       iconDisabledColor: styles.black,
                    //     ),
                    //     dropdownStyleData: DropdownStyleData(
                    //       maxHeight: 200,
                    //       width: 200,
                    //       padding: null,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(14),
                    //         color: styles.smokeWhite,
                    //       ),
                    //       elevation: 8,
                    //       offset: const Offset(-20, 0),
                    //       scrollbarTheme: ScrollbarThemeData(
                    //         radius: const Radius.circular(40),
                    //         thickness: MaterialStateProperty.all<double>(6),
                    //         thumbVisibility: MaterialStateProperty.all<bool>(true),
                    //       ),
                    //     ),
                    //     menuItemStyleData: const MenuItemStyleData(
                    //       height: 40,
                    //       padding: EdgeInsets.only(left: 14, right: 14),
                    //     ),
                    //   ),
                    // ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            Text(
                              'Select an option',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        items: provider.items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                ))
                            .toList(),
                        value: provider.selectedValue,
                        onChanged: (value) {
                          provider.setSelectedValue(value!);
                        },
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