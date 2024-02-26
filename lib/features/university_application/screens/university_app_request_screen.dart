import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/models/data/university_application/university_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/error_text_widget.dart';
import 'package:hive_mobile/features/university_application/screens/application_info_screen.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';
import 'package:hive_mobile/features/university_application/view_models/request_vm.dart';
import 'package:provider/provider.dart';

class UniversitySelectionScreen extends StatefulWidget {
  static const route = "/UniversitySelection";
  final UniAppRequestVM? model;

  const UniversitySelectionScreen({Key? key, this.model}) : super(key: key);

  @override
  State<UniversitySelectionScreen> createState() =>
      _UniversitySelectionScreenState();
}

class _UniversitySelectionScreenState extends State<UniversitySelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return ChangeNotifierProvider.value(
      value: widget.model,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Consumer<UniAppRequestVM>(
            builder: (context, provider, child) {
              return Form(
                key: provider.form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DividerAppBar(
                      title: AppStrings.applicationInformation,
                    ),
                    if (provider.isObjectLoading)
                      Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    else if (provider.hasError)
                      Expanded(
                        child: ErrorTextWidget(
                          onRefresh: provider.refresh,
                        ),
                      )
                    else
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              26.verticalSpace,
                              Text(
                                provider.title,
                                style: styles.inter14w600.copyWith(
                                  color: styles.darkSlateGrey,
                                ),
                              ),
                              14.verticalSpace,
                              if (provider.isGettingUniversities)
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 20.h,
                                    ),
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              else if (provider.universities.isEmpty &&
                                  provider.model == null)
                                Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20.h),
                                    child: Text(
                                      AppStrings.noUniFound,
                                      style: styles.inter12w400Italic,
                                    ),
                                  ),
                                )
                              else ...[
                                if (provider.model == null) ...[
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
                                    child: DropdownButton<UniversityModel>(
                                      value: provider.selectedUniversity,
                                      hint: Text(
                                        "Select University",
                                        style: styles.inter12w400,
                                      ),
                                      isExpanded: true,
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_sharp),
                                      dropdownColor: styles.white,
                                      underline: const SizedBox(),
                                      items: provider.universities
                                          .map(
                                            (value) => DropdownMenuItem<
                                                UniversityModel>(
                                              value: value,
                                              child: Text(
                                                value.name ?? "",
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
                                  35.verticalSpace,
                                ] else ...[
                                  Text(
                                    provider.model?.university?.name ?? "",
                                    style: styles.inter12w400,
                                  ),
                                  10.verticalSpace,
                                  Divider(
                                    thickness: 0.2,
                                  ),
                                  35.verticalSpace,
                                ],
                                if (provider.selectedUniversity != null ||
                                    provider.model != null) ...[
                                  ApplicationInfoScreen()
                                ],
                              ],
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
