import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/auth_button_widget.dart';
import 'package:hive_mobile/features/authentication/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static final route = "/SignIn";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthVM(),
      child: Consumer<AuthVM>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Padding(
              padding: MediaQuery.of(context).padding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SvgPicture.asset(SvgIcons.hiveLogo,width: 193.w,height: 98.h,),
                  Expanded(
                    child: Image.asset(
                      SvgIcons.hiveLogo,
                      width: 193.w,
                      height: 98.h,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: containerRadius,
                          topRight: containerRadius,
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            styles.linearBlueGradientTopLeft,
                            styles.linearBlueGradientBottomRight,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 50,
                              color: styles.white.withOpacity(0.2),
                              spreadRadius: 0,
                              offset: const Offset(0, 4),
                              blurStyle: BlurStyle.outer),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.welcome,
                            style: styles.inter50w700
                                .copyWith(color: styles.white),
                          ),
                          SizedBox(
                            height: 17.h,
                          ),
                          Text(
                            AppStrings.signInWithBeaconiteId,
                            style: styles.inter12w400
                                .copyWith(color: styles.white),
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                          AuthButtonWidget(
                            onTap: () async {
                              await provider.googleSignIn(context);
                            },
                          ),
                          10.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  final containerRadius = const Radius.circular(50);
}
