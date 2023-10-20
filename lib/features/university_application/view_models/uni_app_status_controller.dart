import 'dart:ui';

import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/enums/university_application_eums.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view_models/base_status_controller.dart';

class UApplicationStatusController extends BaseStatusController {
  final AppTheme styles;

  final UniversityApplicationModel application;

  UApplicationStatusController(
      {required this.application, required this.styles});

  @override
  Color get bgColor {
    switch (application.getState) {
      case ApplicationState.accepted:
        return styles.paleWhite;
      case ApplicationState.rejected:
        return styles.lightPink;
      case ApplicationState.applied:
        return styles.lightCyan;
    }
  }

  @override
  String get icon {
    switch (application.getState) {
      case ApplicationState.accepted:
        return SvgIcons.tickSquare;
      case ApplicationState.rejected:
        return SvgIcons.undecided;
      case ApplicationState.applied:
        return SvgIcons.applied;
    }
  }

  @override
  String get title {
    switch (application.getState) {
      case ApplicationState.accepted:
        return AppStrings.accepted;
      case ApplicationState.rejected:
        return AppStrings.rejected;
      case ApplicationState.applied:
        return AppStrings.applied;
    }
  }
}
