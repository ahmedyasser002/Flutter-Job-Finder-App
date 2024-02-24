import 'dart:async';

import 'package:flutter_application_1/core/utils/local_storage_helper.dart';
import 'package:flutter_application_1/features/homescreen/controller/homescreen_states.dart';
import 'package:flutter_application_1/features/homescreen/data/data_models/suggested_job_model.dart';
import 'package:flutter_application_1/features/homescreen/data/data_sources/recent_job_remote_request.dart';
import 'package:flutter_application_1/features/homescreen/data/data_sources/search_history_sharedpref.dart';
import 'package:flutter_application_1/features/homescreen/data/data_sources/suggested_remote_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  List<SuggestedJobModel> suggestJobsList = [];
  List<SuggestedJobModel> recentJobsList = [];
  List<String> searchHistory = [];
  bool isApply = false;

  HomeScreenCubit() : super(GetInitialHomeScreen()) {
    getSearchHistory();
  }

  getSuggestedJobs() async {
    emit(GetSuggestedJobLoading());
    suggestJobsList.clear();
    String token = await LocalStorageHelper.getStrings('token');
    var response = await SuggestedRemoteRequest.getSuggestedJob(token);
    if (response != null) {
      suggestJobsList.addAll(response);
      emit(GetSuggestedJobSuccess());
    } else {
      emit(GetSuggestedJobFailed());
    }
  }

  getRecentJobs() async {
    emit(GetRecentJobLoading());
    recentJobsList.clear();
    String token = await LocalStorageHelper.getStrings('token');
    var response = await RecentJobRemoteRequest.getRecentJob(token);
    if (response != null) {
      recentJobsList.addAll(response);
      emit(GetRecentJobSuccess());
    } else {
      emit(GetRecentJobFailed());
    }
  }

  removeFromSearchHistory(String item) {
    // searchHistory.removeWhere((element) => element == item);
    searchHistory.remove(item);
    addSearchHistory();
    getSearchHistory();
  }

  addSearchHistory() async {
    emit(AddSearchHistoryLoading());
    SearchHistorySharedPref.setSearchList(searchHistory);
    emit(AddSearchHistorySuccess());
  }

  getSearchHistory() async {
    emit(GetSearchHistoryLoading());
    var myList = await SearchHistorySharedPref.getSearchList();
    // return myList;
    searchHistory = myList;
    emit(AddSearchHistorySuccess());
  }

  isApplied() async {
    isApply = LocalStorageHelper.getBool('apply');
    Timer(Duration(seconds: 10), () {
      emit(GetRecentJobLoading());
      emit(GetRecentJobSuccess());
    });
  }
}
