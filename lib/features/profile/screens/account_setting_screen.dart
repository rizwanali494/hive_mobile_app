import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/network_images.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/view/dialogs/blue_elevated_button.dart';
import 'package:hive_mobile/features/home/screens/app_bar_widget.dart';
import 'package:hive_mobile/features/profile/widgets/hobbie_chip_widget.dart';
import 'package:hive_mobile/app/view/widgets/text_field_widget.dart';

import 'package:hive_mobile/app/resources/app_theme.dart';

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
      body: Column(
        children: [
          AppBarWidget(
            color: styles.black,
            title: AppStrings.accountSettings,
            titleStyle: styles.inter20w700,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onMenuTap: () {
              context.pop();
            },
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: Divider(
              color: styles.black.withOpacity(.2),
            ),
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
              styles: styles,
              hintText: AppStrings.editProfilePicture,
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
                TextFieldWidget(
                    styles: styles, hintText: AppStrings.editHobbies),
                35.verticalSpace,
                Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    runSpacing: 8.w,
                    spacing: 8,
                    children: [
                      ...List.generate(
                        hobbies.length,
                        (index) => HobbyChipWidget(text: hobbies[index]),
                      )
                    ],
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
          24.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 19.w
            ),
            child: Align(alignment: Alignment.topLeft,child: BlueElevatedButton(text: AppStrings.saveChanges)),
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
