import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_application_1/core/utils/local_storage_helper.dart';
import 'package:flutter_application_1/core/utils/profile_model.dart';
import 'package:flutter_application_1/core/utils/profile_remote_request.dart';
import 'package:flutter_application_1/features/apply_job/controller/apply_state.dart';
import 'package:flutter_application_1/features/apply_job/data/data_sources/apply_remote_request.dart';
import 'package:flutter_application_1/features/apply_job/data/data_sources/apply_sharedpref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplyCubit extends Cubit<ApplyState> {
  File? img;
  bool? isTruePass;

  ApplyCubit() : super(GetInitialApplyState());
  ProfileModel? profileModel;
  applyJob(
      {required String name,
      required String email,
      required String mobile,
      required String workType,
      required File? otherFile,
      required File? cvFile,
      required int jobID}) async {
    emit(ApplyStateLoading());
    try {
      String token = await LocalStorageHelper.getStrings('token');
      var response = await ProfileRemoteRequest.getProfileDetails(token);
      if (response != null) {
        profileModel = response;
        var userID = profileModel!.id;
        await ApplyRemoteRequest.applyJob(
            token: token,
            name: name,
            email: email,
            mobile: mobile,
            workType: workType,
            jobID: jobID,
            userID: userID!,
            otherFile: otherFile,
            cvFile: cvFile);
        emit(ApplyStateSuccess());
      } else {
        emit(ApplyStateFailed());
      }
    } catch (e) {
      log('Exception caught: $e');

      emit(ApplyStateFailed());
    }
  }

  applyNotify(bool isApply) async{
  // Set apply to true
   await ApplySharedPref.setApply(isApply);

  // Set apply to false after 10 seconds
  Timer(Duration(seconds: 10), () {
  ApplySharedPref.setApply(false);
  });
}
}
