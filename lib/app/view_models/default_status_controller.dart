import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/view_models/base_status_controller.dart';

class DefaultStatusController extends BaseStatusController {
  @override
  String get icon => SvgIcons.undecided;

  @override
  String get title => AppStrings.rejected;

  @override
  Color get bgColor => Colors.grey;
}
