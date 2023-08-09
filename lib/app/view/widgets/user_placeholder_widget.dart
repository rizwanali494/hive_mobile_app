import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';

class UserPlaceHolderWidget extends StatelessWidget {
  final double? height, width;

  const UserPlaceHolderWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      SvgIcons.userPlaceholder,
      width: width,
      height: height,
    );
  }
}
