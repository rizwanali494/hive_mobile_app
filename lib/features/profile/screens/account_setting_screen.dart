import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/network_images.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/dialogs/blue_elevated_button.dart';
import 'package:hive_mobile/features/profile/widgets/hobbie_chip_widget.dart';
import 'package:hive_mobile/app/view/widgets/text_field_widget.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';

class AccountSettingScreen extends StatefulWidget {
  static const route = '/AccountScreen';

  const AccountSettingScreen({Key? key}) : super(key: key);

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      backgroundColor: styles.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 19.w,
            ),
            child: DividerAppBar(title: AppStrings.accountSettings),
          ),
          28.verticalSpace,
          const CircleAvatar(
            backgroundImage: NetworkImage(NetworkImages.userUrl),
            radius: 30,
          ),
          11.verticalSpace,
          Text(
            AppStrings.editProfilePicture,
            style: styles.inter14w600.copyWith(color: styles.darkSlateGrey),
          ),
          30.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
            margin: EdgeInsets.symmetric(horizontal: 19.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: styles.black.withOpacity(.3),
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextFieldWidget(
              hintText: AppStrings.editBios,
            ),
          ),
          14.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            margin: EdgeInsets.symmetric(horizontal: 19.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: styles.black.withOpacity(.3),
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                5.verticalSpace,
                TextFieldWidget(hintText: AppStrings.editHobbies),
                35.verticalSpace,
                Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    runSpacing: 12.w,
                    spacing: 8,
                    children: [
                      ...List.generate(
                        hobbies.length,
                        (index) => HobbyChipWidget(text: hobbies[index]),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
          24.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: Align(
                alignment: Alignment.topLeft,
                child: BlueElevatedButton(text: AppStrings.saveChanges)),
          )
        ],
      ),
    );
  }

  final hobbies = [
    "Gaming",
    "Praying",
    "News",
    "Podcast",
  ];
}
