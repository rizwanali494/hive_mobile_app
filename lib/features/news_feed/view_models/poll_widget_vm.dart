import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/polls_model.dart';

class PollWidgetVM {
  final Polls poll;
  final double totalPolls;

  PollWidgetVM({required this.poll, required this.totalPolls});

  String get labelText {
    return poll.label ?? "";
  }

  double get pollPercentage {
    if ( totalPolls == 0) {
      return 0;
    }
    var percentage = ((poll.selectors ?? 0).toDouble() / totalPolls);
    log("factor------------ $percentage $totalPolls ${poll.selectors}");
    return percentage;
  }

  String get pollPercentageString {
    if( totalPolls <= 0 ){
      return "0";
    }

    var percentage = (((poll.selectors ?? 0).toDouble() / totalPolls) * 100)
        .toStringAsFixed(0);
    return percentage;
  }
}
