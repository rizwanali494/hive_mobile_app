import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class AppTheme extends ThemeExtension<AppTheme> {
  //w400
  final TextStyle inter8w400;
  final TextStyle inter7w400;
  final TextStyle inter9w400;
  final TextStyle inter10w400;
  final TextStyle inter12w400;
  final TextStyle inter14w400;
  final TextStyle inter15w400;
  final TextStyle inter16w400;

  //w500
  final TextStyle inter12w500;

  //w600
  final TextStyle inter14w600;
  final TextStyle inter16w600;
  final TextStyle inter20w600;

  //w700
  final TextStyle inter12w700;
  final TextStyle inter20w700;
  final TextStyle inter28w700;
  final TextStyle inter30w700;
  final TextStyle inter32w700;
  final TextStyle inter36w700;
  final TextStyle inter40w700;
  final TextStyle inter50w700;

  //colors
  final Color linearBlueGradientTopLeft;
  final Color linearBlueGradientBottomRight;
  final Color white;
  final Color black;
  final Color skyBlue;
  final Color lavender;
  final Color darkGrey;
  final Color lightGrey;
  final Color greyWhite;
  final Color darkSlateGrey;
  final Color lightCyan;
  final Color yellowGreen;
  final Color darkOrange;
  final Color red;
  final Color lightPink;

  const AppTheme({
    required this.inter8w400,
    required this.inter7w400,
    required this.inter9w400,
    required this.inter10w400,
    required this.inter12w400,
    required this.inter14w400,
    required this.inter15w400,
    required this.inter16w400,
    required this.inter12w500,
    required this.inter14w600,
    required this.inter16w600,
    required this.inter20w600,
    required this.inter12w700,
    required this.inter20w700,
    required this.inter28w700,
    required this.inter30w700,
    required this.inter32w700,
    required this.inter36w700,
    required this.inter40w700,
    required this.inter50w700,
    required this.linearBlueGradientTopLeft,
    required this.linearBlueGradientBottomRight,
    required this.white,
    required this.black,
    required this.skyBlue,
    required this.lavender,
    required this.darkGrey,
    required this.lightGrey,
    required this.greyWhite,
    required this.darkSlateGrey,
    required this.lightCyan,
    required this.yellowGreen,
    required this.darkOrange,
    required this.red,
    required this.lightPink,
  });

  @override
  ThemeExtension<AppTheme> lerp(
      covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      inter8w400: TextStyle.lerp(inter8w400, other.inter8w400, t)!,
      inter7w400: TextStyle.lerp(inter7w400, other.inter7w400, t)!,
      inter9w400: TextStyle.lerp(inter9w400, other.inter9w400, t)!,
      inter10w400: TextStyle.lerp(inter10w400, other.inter10w400, t)!,
      inter12w400: TextStyle.lerp(inter12w400, other.inter12w400, t)!,
      inter14w400: TextStyle.lerp(inter14w400, other.inter14w400, t)!,
      inter15w400: TextStyle.lerp(inter15w400, other.inter15w400, t)!,
      inter16w400: TextStyle.lerp(inter16w400, other.inter16w400, t)!,
      inter12w500: TextStyle.lerp(inter12w500, other.inter12w500, t)!,
      inter14w600: TextStyle.lerp(inter14w600, other.inter14w600, t)!,
      inter16w600: TextStyle.lerp(inter16w600, other.inter16w600, t)!,
      inter20w600: TextStyle.lerp(inter20w600, other.inter20w600, t)!,
      inter12w700: TextStyle.lerp(inter12w700, other.inter12w700, t)!,
      inter20w700: TextStyle.lerp(inter20w700, other.inter20w700, t)!,
      inter28w700: TextStyle.lerp(inter28w700, other.inter28w700, t)!,
      inter30w700: TextStyle.lerp(inter30w700, other.inter30w700, t)!,
      inter32w700: TextStyle.lerp(inter32w700, other.inter32w700, t)!,
      inter36w700: TextStyle.lerp(inter36w700, other.inter36w700, t)!,
      inter40w700: TextStyle.lerp(inter40w700, other.inter40w700, t)!,
      inter50w700: TextStyle.lerp(inter50w700, other.inter50w700, t)!,
      linearBlueGradientTopLeft: Color.lerp(
          linearBlueGradientTopLeft, other.linearBlueGradientTopLeft, t)!,
      linearBlueGradientBottomRight: Color.lerp(linearBlueGradientBottomRight,
          other.linearBlueGradientBottomRight, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      skyBlue: Color.lerp(skyBlue, other.skyBlue, t)!,
      lavender: Color.lerp(lavender, other.lavender, t)!,
      darkGrey: Color.lerp(darkGrey, other.darkGrey, t)!,
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t)!,
      greyWhite: Color.lerp(greyWhite, other.greyWhite, t)!,
      darkSlateGrey: Color.lerp(darkSlateGrey, other.darkSlateGrey, t)!,
      lightCyan: Color.lerp(lightCyan, other.lightCyan, t)!,
      yellowGreen: Color.lerp(yellowGreen, other.yellowGreen, t)!,
      darkOrange: Color.lerp(darkOrange, other.darkOrange, t)!,
      red: Color.lerp(red, other.red, t)!,
      lightPink: Color.lerp(lightPink, other.lightPink, t)!,
    );
  }

  void eat() {}

  static final light = AppTheme(
    inter8w400: TextStyle(
      fontFamily: 'Inter',
      fontSize: 8.sp,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter7w400: TextStyle(
      fontFamily: 'Inter',
      fontSize: 7.sp,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter9w400: TextStyle(
      fontFamily: 'Inter',
      fontSize: 9.sp,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter10w400: TextStyle(
      fontFamily: 'Inter',
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter12w400: TextStyle(
      fontFamily: 'Inter',
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter14w400: TextStyle(
      fontFamily: 'Inter',
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter15w400: TextStyle(
      fontFamily: 'Inter',
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter16w400: TextStyle(
      fontFamily: 'Inter',
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter12w500: TextStyle(
      fontFamily: 'Inter',
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter14w600: TextStyle(
      fontFamily: 'Inter',
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter16w600: TextStyle(
      fontFamily: 'Inter',
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter20w600: TextStyle(
      fontFamily: 'Inter',
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter12w700: TextStyle(
      fontFamily: 'Inter',
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter20w700: TextStyle(
      fontFamily: 'Inter',
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter28w700: TextStyle(
      fontFamily: 'Inter',
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter30w700: TextStyle(
      fontFamily: 'Inter',
      fontSize: 30.sp,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter32w700: TextStyle(
      fontFamily: 'Inter',
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter36w700: TextStyle(
      fontFamily: 'Inter',
      fontSize: 36.sp,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter40w700: TextStyle(
      fontFamily: 'Inter',
      fontSize: 40.sp,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    inter50w700: TextStyle(
      fontFamily: 'Inter',
      fontSize: 50.sp,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    linearBlueGradientTopLeft: const Color(0xff08A5DE),
    linearBlueGradientBottomRight: const Color(0xff00739C),
    white: Colors.white,
    black: Colors.black,
    skyBlue: const Color(0xff08A5DE),
    lavender: const Color(0xffCEEDF8),
    darkGrey: const Color(0xff969696),
    lightGrey: const Color(0xffD9D9D9),
    greyWhite: const Color(0xffE6E6E6),
    darkSlateGrey: const Color(0xff464646),
    lightCyan: const Color(0xffCEF2FF),
    yellowGreen: const Color(0xffA2C73B),
    darkOrange: const Color(0xffF29200),
    red: const Color(0xffB75F5F),
    lightPink: const Color(0xffFFBEBE),
  );
}

// light
ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(
    background: Color.fromRGBO(248, 248, 248, 1),
    primary: Color(0xff6935D3),
    secondary: Color.fromRGBO(33, 33, 33, 1),
    surfaceTint: Color(0xffF6F2FD),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: AppTheme.light.inter20w600,
    iconTheme: const IconThemeData(color: Color(0xff6935D3)),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  ),
  extensions: <ThemeExtension<dynamic>>[
    AppTheme.light,
  ],
);

//dark
// ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
//   scaffoldBackgroundColor: Colors.black,
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ButtonStyle(
//       backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
//       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//         RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     ),
//   ),
//   buttonTheme: const ButtonThemeData(
//     colorScheme: ColorScheme.light(background: Colors.grey),
//   ),
//   textTheme: const TextTheme(
//     bodySmall: TextStyle(
//       fontSize: 18,
//       color: Colors.black,
//     ),
//     bodyMedium: TextStyle(
//       fontSize: 25,
//       color: Colors.black,
//     ),
//     bodyLarge: TextStyle(
//       fontSize: 40,
//       color: Colors.black,
//     ),
//   ),
//   extensions: <ThemeExtension<dynamic>>[
//     AppTheme.dark,
//   ],
// );
