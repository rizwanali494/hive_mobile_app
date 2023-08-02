import 'package:hive_mobile/app/models/data/announcement_post_models/polls_model.dart';

class PollWidgetVM {
  final Polls poll;
  final double totalPolls;

  PollWidgetVM({required this.poll, required this.totalPolls});

  String get labelText {
    return poll.label ?? "";
  }

  double get pollPercentage {
    return ((poll.selectors ?? 0).toDouble() / totalPolls);
  }
  String get pollPercentageString {
    return (((poll.selectors ?? 0).toDouble() / totalPolls)*100).toStringAsFixed(0);
  }
}
