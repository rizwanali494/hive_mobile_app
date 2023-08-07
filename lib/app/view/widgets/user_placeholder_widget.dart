import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';

class UserPlaceHolderWidget extends StatelessWidget {
  const UserPlaceHolderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(SvgIcons.userPlaceholder);
  }
}
