import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/network_images.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/dialogs/blue_elevated_button.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/app/view/widgets/user_placeholder_widget.dart';
import 'package:hive_mobile/features/profile/view_models/account_setting_vm.dart';
import 'package:hive_mobile/features/profile/widgets/hobbie_chip_widget.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';
import 'package:hive_mobile/features/university_application/widgets/title_text_field.dart';
import 'package:provider/provider.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => AccountSettingVM(),
          child: Consumer<AccountSettingVM>(
            builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    DividerAppBar(title: AppStrings.accountSettings),
                    28.verticalSpace,
                    if (provider.image != null)
                      CircleAvatar(
                        backgroundImage: FileImage(provider.image!),
                        radius: 40,
                      )
                    else
                      CachedNetworkImage(
                        imageUrl: provider.userImageUrl,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 80.h,
                          height: 80.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => UserPlaceHolderWidget(
                          height: 80.h,
                        ),
                        errorWidget: (context, url, error) =>
                            UserPlaceHolderWidget(
                          height: 80.h,
                        ),
                      ),
                    11.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        provider.setImage(context);
                      },
                      child: Text(
                        AppStrings.editProfilePicture,
                        style: styles.inter14w600
                            .copyWith(color: styles.darkSlateGrey),
                      ),
                    ),
                    30.verticalSpace,
                    TitleTextField(
                      hintText: AppStrings.editBios,
                      controller: provider.biosCtrl,
                      keyboardType: TextInputType.multiline,
                      maxLength: 150,
                    ),
                    14.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      // margin: EdgeInsets.symmetric(horizontal: 19.w),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: styles.black.withOpacity(.3),
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          10.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: TitleTextField(
                                  hintText: AppStrings.editHobbies,
                                  controller: provider.hobbiesCtrl,
                                  textFieldOnly: true,
                                  maxLength: 50,
                                  enabled: !provider.hobbiesMaxed,
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    provider.setHobby();
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: styles.skyBlue,
                                  )),
                            ],
                          ),
                          35.verticalSpace,
                          Align(
                            alignment: Alignment.topLeft,
                            child: Wrap(
                              runSpacing: 12.w,
                              spacing: 8,
                              children: [
                                ...List.generate(
                                  provider.hobbies.length,
                                  (index) => HobbyChipWidget(
                                    text: provider.hobbies[index],
                                    onRemove: (String value) {
                                      provider.removeHobby(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          20.verticalSpace,
                        ],
                      ),
                    ),
                    24.verticalSpace,
                    Align(
                      alignment: Alignment.topLeft,
                      child: BlueElevatedButton(
                        text: AppStrings.saveChanges,
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          provider.saveChanges(context);
                        },
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

  final hobbies = [
    "Gaming",
    "Praying",
    "News",
    "Podcast",
  ];
}
