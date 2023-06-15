import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/description_screen.dart';
import 'package:hive_mobile/features/my_services/screens/my_service_widget.dart';
import 'package:hive_mobile/features/my_services/screens/service_count_widget.dart';
import 'package:hive_mobile/features/university_application/screens/application_request/screens/divider_app_bar.dart';
import 'package:hive_mobile/features/university_application/screens/blue_action_button.dart';

class MyServicesScreen extends StatefulWidget {
  const MyServicesScreen({Key? key}) : super(key: key);
  static const route = "/MyServices";

  @override
  State<MyServicesScreen> createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 19.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DividerAppBar(
              title: AppStrings.myServices,
              titleStyle: styles.inter36w700,
              showDivider: false,
            ),
            26.verticalSpace,
            BlueActionButton(
              onTap: () {},
              title: AppStrings.initiateRequest,
            ),
            21.verticalSpace,
            Row(
              children: [
                ServiceCountWidget(
                    color: styles.yellowGreen,
                    count: "20",
                    type: AppStrings.approved),
                13.horizontalSpace,
                ServiceCountWidget(
                    color: styles.darkOrange,
                    count: "3",
                    type: AppStrings.pending),
                13.horizontalSpace,
                ServiceCountWidget(
                    color: styles.red, count: "13", type: AppStrings.rejected),
              ],
            ),
            34.verticalSpace,
            Text(
              AppStrings.myRequest,
              style: styles.inter20w700,
            ),
            5.verticalSpace,
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        context.push(DescriptionScreen.route);
                      },
                      child: MyServiceWidget());
                },
                separatorBuilder: (context, index) {
                  return 10.verticalSpace;
                },
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
