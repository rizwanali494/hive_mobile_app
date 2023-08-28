import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/navigation/extensions.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/dialogs/blue_elevated_button.dart';
import 'package:hive_mobile/features/home/screens/home_screen.dart';
import 'package:hive_mobile/features/university_application/view_models/university_app_request_vm.dart';
import 'package:hive_mobile/features/university_application/view_models/university_application_screen_vm.dart';
import 'package:hive_mobile/features/university_application/widgets/document_upload_widget.dart';
import 'package:hive_mobile/features/university_application/widgets/title_text_field.dart';
import 'package:hive_mobile/features/university_application/view_models/application_info_vm.dart';
import 'package:hive_mobile/features/university_application/widgets/application_state_selection_widget.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';
import 'package:provider/provider.dart';

class ApplicationInfoScreen extends StatefulWidget {
  static const route = "/ApplicationInfo";

  const ApplicationInfoScreen({Key? key}) : super(key: key);

  @override
  State<ApplicationInfoScreen> createState() => _ApplicationInfoScreenState();
}

class _ApplicationInfoScreenState extends State<ApplicationInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Consumer<UniversityAppRequestVM>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.selectStatus,
                  style:
                      styles.inter14w600.copyWith(color: styles.darkSlateGrey),
                ),
                13.verticalSpace,
                Row(
                  children: [
                    ApplicationStatusToggleWidget(
                      title: AppStrings.applied,
                      onTap: () {
                        provider.selectStatus(AppStrings.applied);
                      },
                      iconPath: SvgIcons.applied,
                      isSelected: provider.iSelected(AppStrings.applied),
                    ),
                    10.horizontalSpace,
                    ApplicationStatusToggleWidget(
                      title: AppStrings.accepted,
                      iconPath: SvgIcons.tickSquare,
                      isSelected: provider.iSelected(AppStrings.accepted),
                      onTap: () {
                        provider.selectStatus(AppStrings.accepted);
                      },
                      spaceBetween: 7,
                    ),
                    10.horizontalSpace,
                    ApplicationStatusToggleWidget(
                      title: AppStrings.rejected,
                      iconPath: SvgIcons.undecided,
                      spaceBetween: 7,
                      onTap: () {
                        provider.selectStatus(AppStrings.rejected);
                      },
                      isSelected: provider.iSelected(AppStrings.rejected),
                    ),
                  ],
                ),
                34.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: Text(
                    AppStrings.addDocument,
                    style: styles.inter14w600
                        .copyWith(color: styles.darkSlateGrey),
                  ),
                ),
                14.verticalSpace,
                DocumentUploadWidget(
                  onTap: provider.pickFile,
                  onRemove: provider.removeFile,
                  documentName: provider.documentName,
                  isDownloading: provider.fileDownloading,
                ),
                28.verticalSpace,
                // TitleTextField(
                //   title: AppStrings.description,
                //   controller: provider.description,
                //   hintText: "",
                // ),
                // 26.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TitleTextField(
                        title: AppStrings.scholarshipAmount,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^[0-9]+.?[0-9]*')),
                        ],
                        controller: provider.scholarShipAmount,
                        hintText: "",
                      ),
                    ),
                    18.horizontalSpace,
                    Expanded(
                      child: TitleTextField(
                        title: AppStrings.scholarship,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^[0-9]+.?[0-9]*')),
                        ],
                        controller: provider.scholarShipPercent,
                        hintText: "",
                      ),
                    ),
                  ],
                ),
                29.verticalSpace,
                BlueElevatedButton(
                  text: AppStrings.add,
                  onTap: () {
                    provider.validate(
                      scholarshipAmount: provider.scholarShipAmount.text,
                      scholarshipPercent: provider.scholarShipPercent.text,
                      context: context);
                    // context.popUntil(
                    //   HomeScreen.route,
                    // );
                  },
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
