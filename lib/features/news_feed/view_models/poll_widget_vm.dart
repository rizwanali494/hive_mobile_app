import 'package:flutter/foundation.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/polls_model.dart';
import 'package:hive_mobile/features/news_feed/repositories/poll_repository.dart';

class PollWidgetVM extends ChangeNotifier {
  final Polls poll;
  final double totalPolls;
  late PollRepository pollRepository;
  int? selectedPollId;

  bool get isSelected {
    return selectedPollId == poll.id;
  }

  PollWidgetVM(
      {required this.poll,
      required this.totalPolls,
      required this.selectedPollId}) {
    pollRepository = PollRepository();
  }

  String get labelText {
    return poll.label ?? "";
  }

  double get pollPercentage {
    if (totalPolls == 0) {
      return 0;
    }
    var percentage = ((poll.selectors ?? 0).toDouble() / totalPolls);
    return percentage;
  }

  String get pollPercentageString {
    if (totalPolls <= 0) {
      return "0";
    }

    var percentage = (((poll.selectors ?? 0).toDouble() / totalPolls) * 100)
        .toStringAsFixed(0);
    return percentage;
  }

  // bool get isSelected {
  //   return poll.isSelected ?? false;
  // }

  Future<void> selectPoll() async {
    try {
      var selected = await pollRepository.selectPoll(poll.id ?? 0);
      poll.isSelected = selected;
    } catch (e) {}
    notifyListeners();
  }
}
