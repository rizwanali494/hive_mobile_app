import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/dialogs/blue_elevated_button.dart';
import 'package:hive_mobile/features/university_application/view_models/request_vm.dart';
import 'package:hive_mobile/features/university_application/view_models/university_app_request_object_vm.dart';
import 'package:hive_mobile/features/university_application/widgets/document_upload_widget.dart';
import 'package:hive_mobile/features/university_application/widgets/title_text_field.dart';
import 'package:hive_mobile/features/university_application/widgets/application_state_selection_widget.dart';
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

    return Consumer<UniAppRequestVM>(
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
                      isSelected: provider.iSelected(AppStrings.rejected),
                      onTap: () {
                        provider.selectStatus(AppStrings.rejected);
                      },
                    ),
                  ],
                ),
                34.verticalSpace,
                if (provider.isNotApplying) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TitleTextField(
                          title: AppStrings.scholarshipAmount,
                          validator: provider.scholarShipAmountValidator,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^[0-9]+.?[0-9]*'),
                            ),
                            FilteringTextInputFormatter.deny(
                              RegExp(r'\s'),
                            )
                          ],
                          controller: provider.scholarShipAmount,
                          hintText: "",
                        ),
                      ),
                      18.horizontalSpace,
                      Expanded(
                        child: TitleTextField(
                          title: "${AppStrings.scholarship} %",
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          buildCounter: (p0,
                                  {required currentLength,
                                  required isFocused,
                                  maxLength}) =>
                              null,
                          validator: provider.scholarShipPercentValidator,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^[0-9]+.?[0-9]*'),
                            ),
                            FilteringTextInputFormatter.deny(
                              RegExp(r'\s'),
                            )
                          ],
                          controller: provider.scholarShipPercent,
                          hintText: "",
                        ),
                      ),
                    ],
                  ),
                  29.verticalSpace,
                ],
                if (provider.fileDownloading)
                  Center(
                    child: CircularProgressIndicator(),
                  )
                else if (provider.errorDownloading)
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.errorDocDownloading,
                          style: styles.inter12w500,
                        ),
                        TextButton(
                            onPressed: () {
                              provider.downloadAllDocs();
                            },
                            child: Text(
                              AppStrings.retry,
                              style: styles.inter12w400Italic,
                            )),
                      ],
                    ),
                  )
                else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 4.w),
                        child: Text(
                          AppStrings.addDocument,
                          style: styles.inter14w600
                              .copyWith(color: styles.darkSlateGrey),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.selectDocuments(context);
                        },
                        child: Icon(
                          Icons.add,
                          color: styles.skyBlue,
                        ),
                      ),
                    ],
                  ),
                  14.verticalSpace,
                  for (final doc in provider.documents)
                    DocumentUploadWidget(
                      controller: doc,
                    ),
                ],
                29.verticalSpace,
                BlueElevatedButton(
                  text: provider.model == null
                      ? AppStrings.upload
                      : AppStrings.update,
                  onTap: () {
                    provider.uploadUniApp(context: context);
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
