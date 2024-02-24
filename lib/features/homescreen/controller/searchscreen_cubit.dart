import 'package:flutter_application_1/core/utils/local_storage_helper.dart';
import 'package:flutter_application_1/features/homescreen/controller/searchscreen_states.dart';
import 'package:flutter_application_1/features/homescreen/data/data_models/suggested_job_model.dart';
import 'package:flutter_application_1/features/homescreen/data/data_sources/search_remote_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  List<SuggestedJobModel> searchResultList = [];

  // String searchedJob = '';

  SearchScreenCubit() : super(GetInitialSearchScreen()) {
    // getSearchResults(jobName: SearchHistorySharedPref.getSearchList().last);
    // getSearchResults(jobName: getSearchedJob());
  }
  // getSearchedJob() async {
  //   String searchedJob = await SearchHistorySharedPref.getSearchList().last;
  //   return searchedJob;
  // }

  getSearchResults(
      {required String jobName,
      String location = '',
      String salary = ''}) async {
    emit(SearchResultLoading());
    searchResultList.clear();
    String token = await LocalStorageHelper.getStrings('token');
    var response = await SearchRemoteRequest.getSearchResult(
        token: token, name: jobName, location: location, salary: salary);
    if (response != null) {
      searchResultList.addAll(response);
      if (searchResultList.isNotEmpty) {
        emit(SearchResultSuccess());
      } else {
        emit(SearchResultFailed());
      }
    } else {
      emit(SearchResultFailed());
    }
  }

  int getMinSal(String salary) {
    if (salary.contains('K')) {
      salary = salary.replaceAll('K', '000');
    }
    String minimum = salary.split('-')[0].trim();
    String strippedMin = minimum.replaceAll('\$', '').trim();
    int minSal = int.parse(strippedMin);
    return minSal;
  }
    int getMaxSal(String salary) {
    if (salary.contains('K')) {
      salary = salary.replaceAll('K', '000');
    }
    String maximum = salary.split('-')[1].trim();
    String strippedMax = maximum.replaceAll('\$', '').trim();
    int maxSal = int.parse(strippedMax);
    return maxSal;
  }

}
