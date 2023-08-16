import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/dialogs/blue_elevated_button.dart';
import 'package:hive_mobile/features/my_services/view_models/service_request_vm.dart';
import 'package:hive_mobile/features/university_application/screens/application_info/screens/title_text_field.dart';
import 'package:hive_mobile/features/university_application/screens/application_request/screens/divider_app_bar.dart';
import 'package:provider/provider.dart';

class NewRequestScreen extends StatefulWidget {
  static const route = "/NewRequest";

  const NewRequestScreen({Key? key}) : super(key: key);

  @override
  State<NewRequestScreen> createState() => _NewRequestScreenState();
}

class _NewRequestScreenState extends State<NewRequestScreen> {
  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return ChangeNotifierProvider(
      create: (BuildContext context) => ServiceRequestVM(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 19.w,
          ),
          child: Consumer<ServiceRequestVM>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  DividerAppBar(
                    title: AppStrings.newRequest,
                    titleStyle: styles.inter20w700,
                  ),
                  16.verticalSpace,
                  TitleTextField(
                    title: AppStrings.myRequest,
                    controller: titleCtrl,
                    hintText: AppStrings.characterCertificate,
                  ),
                  15.verticalSpace,
                  Row(
                    children: [
                      10.horizontalSpace,
                      SizedBox(
                        width: 16.w,
                        height: 16.h,
                        child: Checkbox(
                          value: provider.isChangeRequest,
                          activeColor: styles.skyBlue,
                          fillColor: MaterialStateProperty.resolveWith(
                            (Set states) {
                              if (states.contains(MaterialState.disabled)) {
                                return styles.skyBlue;
                              }
                              return styles.skyBlue;
                            },
                          ),
                          // checkColor: styles.skyBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          onChanged: (value) {
                            provider.toggleChangeRequest();
                          },
                        ),
                      ),
                      12.horizontalSpace,
                      Text(
                        AppStrings.subjectChange,
                        style: styles.inter12w400,
                      ),
                    ],
                  ),
                  29.verticalSpace,
                  TitleTextField(
                    title: AppStrings.description,
                    controller: descriptionCtrl,
                    hintText: AppStrings.loremPorum * 2,
                    maxLines: 5,
                  ),
                  23.verticalSpace,
                  Align(
                    alignment: Alignment.topLeft,
                    child: BlueElevatedButton(
                      text: AppStrings.sendRequest,
                      onTap: () {
                        provider.validate(
                            titleCtrl.text, descriptionCtrl.text, context);
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
