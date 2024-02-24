import 'package:flutter_application_1/core/utils/local_storage_helper.dart';
import 'package:flutter_application_1/features/saved_notifications/controller/saved_state.dart';
import 'package:flutter_application_1/features/saved_notifications/data/data_sources/saved_remote_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(GetInitialSavedState()) {
    getSavedJobs();
  }
  // bool isRead = false;
  // List<SavedContainer> savedList = [
  //   SavedContainer(
  //       savedImg: 'Twitter.png',
  //       savedContent: 'Twitter • Jakarta, Indonesia ',
  //       savedName: 'Senior UI Designer',
  //       savedTime: 'Posted 2 days ago'),
  //   SavedContainer(
  //       savedImg: 'vk.png',
  //       savedContent: 'Twitter • Jakarta, Indonesia ',
  //       savedName: 'Senior UI Designer',
  //       savedTime: 'Posted 2 days ago'),
  //   SavedContainer(
  //       savedImg: 'Twitter.png',
  //       savedContent: 'Twitter • Jakarta, Indonesia ',
  //       savedName: 'Senior UI Designer',
  //       savedTime: 'Posted 2 days ago'),
  //   SavedContainer(
  //       savedImg: 'Twitter.png',
  //       savedContent: 'Twitter • Jakarta, Indonesia ',
  //       savedName: 'Senior UI Designer',
  //       savedTime: 'Posted 2 days ago'),
  //   SavedContainer(
  //       savedImg: 'Twitter.png',
  //       savedContent: 'Twitter • Jakarta, Indonesia ',
  //       savedName: 'Senior UI Designer',
  //       savedTime: 'Posted 2 days ago'),
  //   SavedContainer(
  //       savedImg: 'Twitter.png',
  //       savedContent: 'Twitter • Jakarta, Indonesia ',
  //       savedName: 'Senior UI Designer',
  //       savedTime: 'Posted 2 days ago'),
  //   SavedContainer(
  //       savedImg: 'Twitter.png',
  //       savedContent: 'Twitter • Jakarta, Indonesia ',
  //       savedName: 'Senior UI Designer',
  //       savedTime: 'Posted 2 days ago'),
  //   SavedContainer(
  //       savedImg: 'Twitter.png',
  //       savedContent: 'Twitter • Jakarta, Indonesia ',
  //       savedName: 'Senior UI Designer',
  //       savedTime: 'Posted 2 days ago'),
  // ];
  List<dynamic> savedJobs = [];

  void addFavourite({required int id}) async {
    emit(AddSavedLoading());
    String token = await LocalStorageHelper.getStrings('token');

    try {
      await SavedRemoteRequest.addFavorite(id, token);
      emit(AddSavedSuccess());
      getSavedJobs();
    } catch (e) {
      emit(AddSavedFailed());
      // print('catched');
    }
  }

  getSavedJobs() async {
    emit(GetSavedLoading());
    savedJobs.clear();
    String token = await LocalStorageHelper.getStrings('token');
    var response = await SavedRemoteRequest.getAllFavorites(token);
    if (response != null) {
      // response = response.toSet();
      // response = response.toList();
      savedJobs.addAll(response);

      for (var i = 0; i < savedJobs.length; i++) {
        for (var j = i + 1; j < savedJobs.length; j++) {
          if (savedJobs[i].jobId == savedJobs[j].jobId) {
            savedJobs.removeAt(j);
            // savedJobs.remove(savedJobs[j]);
            j--; // Decrement j to account for the removed element
          }
        }
      }
      // This is important also ........

      //  savedJobs.removeWhere((job) =>
      //   savedJobs.indexWhere((otherJob) => otherJob.jobId == job.jobId) !=
      //   savedJobs.lastIndexOf(job));
      emit(GetSavedSuccess());
    } else {
      emit(GetSavedFailed());
    }
  }

  // bool isSavedBefore(int id) {
  //   bool x;
  //   for (var element in savedJobs) {
  //     if (element.jobId == id) {
  //       x = true;
  //     } else {
  //       x = false;
  //     }
  //     return x;
  //   }
  bool isSaved(int id) {
    for (var element in savedJobs) {
      if (element.jobId == id) {
        return true;
      }
    }
      return false;
  }
}
