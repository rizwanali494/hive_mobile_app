import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/view/dialogs/blue_elevated_button.dart';
import 'package:hive_mobile/features/university_application/screens/application_info/screens/application_info_screen.dart';
import 'package:hive_mobile/features/university_application/screens/application_request/screens/divider_app_bar.dart';
import 'package:hive_mobile/features/university_application/screens/application_request/view_models/university_selection_vm.dart';
import 'package:provider/provider.dart';

import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class UniversitySelectionScreen extends StatefulWidget {
  static const route = "/UniversitySelection";

  const UniversitySelectionScreen({Key? key}) : super(key: key);

  @override
  State<UniversitySelectionScreen> createState() =>
      _UniversitySelectionScreenState();
}

class _UniversitySelectionScreenState extends State<UniversitySelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return ChangeNotifierProvider(
      create: (BuildContext context) => UniversitySelectionVM(),
      child: Consumer<UniversitySelectionVM>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DividerAppBar(
                    title: AppStrings.applicationInformation,
                  ),
                  26.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.w,
                    ),
                    child: Text(
                      AppStrings.selectUniversity,
                      style: styles.inter14w600.copyWith(
                        color: styles.darkSlateGrey,
                      ),
                    ),
                  ),
                  14.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                      border: Border.all(
                        color: styles.black.withOpacity(
                          0.2,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 19.w,
                    ),
                    child: DropdownButton<String>(
                      value: provider.selectedUniversity,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down_sharp),
                      dropdownColor: styles.white,
                      underline: const SizedBox(),
                      items: provider.universities
                          .map(
                            (value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: styles.inter12w400,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        provider.selectUniversity(value);
                      },
                    ),
                  ),
                  12.verticalSpace,
                  BlueElevatedButton(
                    text: AppStrings.add,
                    onTap: () {
                      context.push(ApplicationInfoScreen.route);
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
