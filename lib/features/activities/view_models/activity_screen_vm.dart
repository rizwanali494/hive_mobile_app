import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/local_services/isar_service.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/activities/repositories/activity_repo.dart';

// class ActivityScreenVM1 extends ChangeNotifier {
//   LocalService<ActivityModel> localService = LocalService();
//
//   List<ActivityModel> activities = [];
//   bool _isLoading = true;
//   bool _isGettingMore = false;
//   bool _hasError = false;
//   final _limit = 10;
//   late PaginationController paginationController;
//   ScrollController scrollController = ScrollController();
//   final apiService = GetIt.instance.get<ApiService>();
//
//   late ActivityRepo activityRepo;
//
//   ActivityScreenVM() {
//     initValues();
//   }
//
//   void initValues() {
//     paginationController = PaginationController(
//         controller: scrollController, onScroll: getNextSessionNotes);
//     activityRepo = ActivityRepositoryImpl(
//       apiService: apiService,
//     );
//     setPaginationController();
//     getInitialSessionList();
//   }
//
//   void setPaginationController() {
//     if (scrollController.hasListeners) {
//       return;
//     }
//     paginationController = PaginationController(
//       controller: scrollController,
//       onScroll: getNextSessionNotes,
//     );
//   }
//
//   Future<void> getInitialSessionList() async {
//     // if (localList.isNotEmpty) {
//     //   notifyListeners();
//     // }
//     _isLoading = true;
//     notifyListeners();
//     final request = () async {
//       var list = await activityRepo.getInitialActivities(limit: _limit);
//       list.sortByRecentOrder(
//         getDateAdded: (item) =>
//             DateTime.tryParse(item.dateAdded ?? "") ?? DateTime.now(),
//       );
//       for (var value in list) {
//         log("${value.id}");
//       }
//       if (list.length < _limit) {
//         paginationController.isLastPage = true;
//       } else {
//         paginationController
//             .setOffset((paginationController.offset) + list.length);
//       }
//       activities.addAll(list);
//       await localService.saveAll(list);
//       paginationController.addListener();
//       var localList = await getLocalList();
//       activities.addAll(localList);
//       activities = activities.toSet().toList();
//       return;
//     };
//     await performRequest(request: request);
//     _isLoading = false;
//     notifyListeners();
//   }
//
//   Future<void> getNextSessionNotes() async {
//     paginationController.toggleIsGettingMore(true);
//     notifyListeners();
//     final request = () async {
//       var list = await activityRepo.getNextActivities(
//           limit: _limit, offSet: paginationController.offset);
//
//       if (list.length < _limit) {
//         paginationController.isLastPage = true;
//       } else {
//         paginationController
//             .setOffset((paginationController.offset) + list.length);
//       }
//       activities.addAll(list);
//       paginationController.toggleIsGettingMore(false);
//       return;
//     };
//     await performRequest(request: request);
//     notifyListeners();
//   }
//
//   Future<List<ActivityModel>> getLocalList() async {
//     var list = await localService.findAll();
//     return list;
//   }
//
//   Future<void> refreshActivities() async {
//     final request = () async {
//       _hasError = false;
//       paginationController.toggleIsGettingMore(false);
//       paginationController.toggleLastPage(false);
//       var list = await activityRepo.getInitialActivities(limit: _limit);
//       if (list.length < _limit) {
//         paginationController.isLastPage = true;
//       } else {
//         paginationController
//             .setOffset((paginationController.offset) + list.length);
//       }
//       activities = list;
//       addScrollListeners();
//     };
//     await performRequest(request: request);
//     notifyListeners();
//     return;
//   }
//
//   void addScrollListeners() {
//     if (!scrollController.hasListeners) {
//       paginationController.addListener();
//     }
//   }
//
//   void setLastPage([bool lastPage = true]) {
//     paginationController.isLastPage = lastPage;
//   }
//
//   void notifyListener() {
//     notifyListeners();
//   }
//
//   Future<void> performRequest({required Function request}) async {
//     try {
//       await request();
//     } catch (e) {
//       if (e is HTTPStatusCodeException) {
//         log("Error occurred : ${e.response.body}");
//         log("Error occurred : ${e.response.statusCode}");
//       }
//       log("Error occurred : $e");
//       onError();
//     }
//   }
//
//   bool get isGettingMore => paginationController.isGettingMore;
//
//   void onError() {
//     if (activities.isEmpty) {
//       _hasError = true;
//     }
//     _isLoading = false;
//     paginationController.toggleIsGettingMore(false);
//     paginationController.isLastPage = false;
//     paginationController.removeListener();
//     notifyListeners();
//   }
//
//   int get listCount {
//     if (isGettingMore) {
//       return activities.length + 1;
//     }
//     return activities.length;
//   }
//
//   bool get hasError => _hasError;
//
//   bool get isLoading => _isLoading;
//
//   Future<void> setActivitySelection(
//       {required ActivityModel model, required String state}) async {
//     var previousModel = model.copyWith();
//     model.selection = state.toUpperCase();
//     var index = activities.indexOf(model);
//     log("current model index : $index");
//     if (index > -1) {
//       activities[index] = model;
//     }
//     notifyListeners();
//     try {
//       await activityRepo.submitSelection(
//           id: model.id ?? 0, body: {}, state: state);
//       await localService.put(model);
//     } catch (e) {
//       if (e is HTTPStatusCodeException) {
//         log("message : ${e.response.statusCode.toString()}");
//         log("message : ${e.response.body.toString()}");
//       }
//       await Future.delayed(Duration(seconds: 1));
//       log("error updating activity: ${e.toString()}");
//       var index = activities.indexOf(previousModel);
//       log("previous model index : $index");
//       if (index > -1) {
//         activities[index] = previousModel;
//         notifyListeners();
//         log("error updating activity: ${e.toString()}");
//       }
//     }
// //
// // void sortByRecentOrder() {
// //   sessionNotesList.sortByRecentOrder(
// //     getDateAdded: (item) =>
// //         DateTime.tryParse(item.dateAdded ?? "") ?? DateTime.now(),
// //   );
//   }
// }

class ActivityScreenVM extends BaseApiVM<ActivityModel>
    with BaseExceptionController {
  late ActivityRepo activityRepo;

  @override
  Future<List<ActivityModel>> fetchInitialItems() async {
    var list = await activityRepo.getInitialActivities(limit: limit);
    return list;
  }

  @override
  Future<List<ActivityModel>> fetchNextItems() async {
    var list =
        await activityRepo.getNextActivities(limit: limit, offSet: offSet);
    return list;
  }

  final apiService = GetIt.instance.get<ApiService>();

  @override
  void setRepoInstance() {
    activityRepo = ActivityRepositoryImpl(apiService: apiService);
  }

  Future<void> setActivitySelection(
      {required ActivityModel model, required String state}) async {
    var previousModel = model.copyWith();
    model.selection = state.toUpperCase();
    var index = items.indexOf(model);
    log("current model index : $index");
    if (index > -1) {
      items[index] = model;
    }
    notifyListeners();
    try {
      await activityRepo.submitSelection(
          id: model.id ?? 0, body: {}, state: state);
      await localService.put(model);
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log("message : ${e.response.statusCode.toString()}");
        log("message : ${e.response.body.toString()}");
      }
      await Future.delayed(Duration(seconds: 1));
      var index = items.indexOf(previousModel);
      if (index > -1) {
        items[index] = previousModel;
        notifyListeners();
        handleException(e);
      }
    }
//
// void sortByRecentOrder() {
//   sessionNotesList.sortByRecentOrder(
//     getDateAdded: (item) =>
//         DateTime.tryParse(item.dateAdded ?? "") ?? DateTime.now(),
//   );
  }

  bool get isLoading => uiState.isLoading;

  bool get hasError => uiState.hasError;
}
