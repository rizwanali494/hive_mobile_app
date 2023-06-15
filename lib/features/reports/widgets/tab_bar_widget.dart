import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class TabBarWidget extends StatelessWidget {
  final String tab1Title;
  final String tab2Title;
  final Function(int index) onTap;
  final int selectedIndex;

  const TabBarWidget(
      {Key? key,
      required this.onTap,
      required this.selectedIndex,
      required this.tab1Title,
      required this.tab2Title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return TabBar(
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
      onTap: onTap,
      tabs: [
        Tab(
          child: Container(
            height: 29.h,
            margin: EdgeInsets.only(right: 10.w),
            decoration: BoxDecoration(
              color: selectedIndex == 0 ? styles.skyBlue : styles.darkGrey,
              borderRadius: BorderRadius.circular(26.r),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                tab1Title,
                style: styles.inter12w400.copyWith(
                  color: selectedIndex == 0 ? styles.white : styles.black,
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
              color: selectedIndex == 1 ? styles.skyBlue : styles.darkGrey,
              borderRadius: BorderRadius.circular(26.r),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                tab2Title,
                style: styles.inter12w400.copyWith(
                  color: selectedIndex == 1 ? styles.white : styles.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
