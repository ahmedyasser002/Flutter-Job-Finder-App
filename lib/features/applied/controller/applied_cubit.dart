import 'dart:developer';
import 'package:flutter_application_1/core/utils/local_storage_helper.dart';
import 'package:flutter_application_1/features/applied/controller/applied_state.dart';
import 'package:flutter_application_1/features/applied/data/data_sources/applied_remote_request.dart';
import 'package:flutter_application_1/features/homescreen/data/data_models/suggested_job_model.dart';
import 'package:flutter_application_1/features/homescreen/data/data_sources/recent_job_remote_request.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppliedCubit extends Cubit<AppliedState> {
  List appliedID = [];
  List<SuggestedJobModel> recentJobsList = [];
  List appliedJobs = [];
  AppliedCubit() : super(GetInitialAppliedState()) {
    getappliedID();
  }
  getappliedID() async {
    appliedID.clear();
    recentJobsList.clear();
    appliedJobs.clear();
    emit(AppliedStateLoading());
    try {
      String token = await LocalStorageHelper.getStrings('token');
      var response = await AppliedRemoteRequest.getAppliedJob(token);
      appliedID.addAll(response);
      appliedID = response.toSet().toList();

      var jobResponse = await RecentJobRemoteRequest.getRecentJob(token);
      if (jobResponse != null) {
        recentJobsList.addAll(jobResponse);
      }
      // for (var i = 0; i < appliedID.length; i++) {
      //   if (appliedID[i] == recentJobsList[i].jobID) {
      //     appliedJobs.add(recentJobsList[i]);
      //   }
      // }
      for (var id in appliedID) {
        for (var i = 0; i < recentJobsList.length; i++) {
          if (id == recentJobsList[i].jobID) {
            appliedJobs.add(recentJobsList[i]);
          }
        }
      }
      emit(AppliedStateSuccess());
    } catch (e) {
      log("Error in getting data from server $e");
    }
  }
}
