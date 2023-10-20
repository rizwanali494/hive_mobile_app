import 'dart:ui';

import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/models/data/my_services_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view_models/base_status_controller.dart';

class ServiceStatusController implements BaseStatusController {
  final AppTheme styles;
  final MyServicesModel model;

  ServiceStatusController({required this.model, required this.styles});

  @override
  String get icon {
    if (model.isOpen) {
      return SvgIcons.applied;
    }
    return SvgIcons.tickSquare;
  }

  @override
  String get title {
    if (model.isOpen) {
      return AppStrings.open;
    }
    return AppStrings.closed;
  }

  @override
  Color get bgColor {
    if (model.isClosed) {
      return styles.paleWhite;
    }
    return styles.lightCyan;
  }
}
