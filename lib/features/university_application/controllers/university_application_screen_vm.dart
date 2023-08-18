import 'package:flutter/cupertino.dart';

class UniversityApplicationScreenVM extends ChangeNotifier {
  bool _isAcceptedLoading = false;
  bool _isPreviousLoading = false;
  bool _hasAllAccepted = false;
  bool _hasAllPrevious = false;

  bool get isAcceptedLoading => _isAcceptedLoading;

  bool get isPreviousLoading => _isPreviousLoading;

  bool get hasAllAccepted => _hasAllAccepted;

  bool get hasAllPrevious => _hasAllPrevious;
}
