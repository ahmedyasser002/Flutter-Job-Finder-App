import 'dart:io';
import 'package:flutter_application_1/core/utils/local_storage_helper.dart';
import 'package:flutter_application_1/core/utils/profile_model.dart';
import 'package:flutter_application_1/core/utils/profile_remote_request.dart';
import 'package:flutter_application_1/features/profile_setting/controller/profile_state.dart';
import 'package:flutter_application_1/features/profile_setting/data/data_sources/my_profile_local_storage.dart';
import 'package:flutter_application_1/features/profile_setting/data/data_sources/my_profile_remote_request.dart';
import 'package:flutter_application_1/features/sign_in/data/data_sources/login_remote_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileState> {
  File? img;
  bool? isTruePass;
  List portfolios = [];

  ProfileCubit() : super(GetInitialProfileState()) {
    getProfileDetails();
  }
  ProfileModel? profileModel;
  getProfileDetails() async {
    emit(GetProfileDetailsLoading());
    String token = await LocalStorageHelper.getStrings('token');
    var response = await ProfileRemoteRequest.getProfileDetails(token);
    if (response != null) {
      emit(GetProfileDetailsSuccess());
      profileModel = response;
    } else {
      emit(GetProfileDetailsFailed());
    }
  }

  editProfile(
      {required String bio,
      required String mobile,
      required String address}) async {
    emit(EditProfileLoading());
    String token = await LocalStorageHelper.getStrings('token');
    try {
      await MyProfileRemoteRequest.editProfile(
          token: token, bio: bio, address: address, mobile: mobile);
      MyProfileLocalStorage.setBio(bio);
      await MyProfileLocalStorage.setAddress(address);
      await MyProfileLocalStorage.setPhone(mobile);
      emit(EditProfileSuccess());
    } catch (e) {
      emit(EditProfileFailed());
    }
  }

  updateName(String name) async {
    emit(EditProfileLoading());
    String token = await LocalStorageHelper.getStrings('token');
    try {
      await MyProfileRemoteRequest.updateName(token: token, name: name);
      profileModel?.name = name;
      await LocalStorageHelper.setStrings('name', name);
      emit(EditProfileSuccess());
    } catch (e) {
      emit(EditProfileFailed());
    }
  }

  updatePassword(String password, String oldPass) async {
    emit(EditProfileLoading());
    String token = await LocalStorageHelper.getStrings('token');
    if (password.length >= 8) {
      try {
        var checkPass = await checkPassword(oldPass);
        if (checkPass) {
          await MyProfileRemoteRequest.updatePassword(
              token: token, password: password);
          emit(EditProfileSuccess());
        } else {
          emit(EditProfileFailed());
        }
      } catch (e) {
        emit(EditProfileFailed());
      }
    } else {
      emit(EditProfileFailed());
    }
  }

  void pickImage() async {
    try {
      emit(UploadImageLoading());
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      img = File(image!.path);
      emit(UploadImageSuccess());
    } catch (e) {
      emit(UploadImageFailed());
    }
  }

  setPersonalDetails(int value) async {
    emit(EditProfileLoading());
    await LocalStorageHelper.setIntegers('progress', value);
    emit(EditProfileSuccess());
  }

  updateTwoStep(bool newValue) {
    emit(UpdateTwoStepLoading());
    emit(UpdateTwoStepSuccess());
  }

  checkPassword(String password) async {
    emit(CheckingPassLoading());
    try {
      var response =
          await LoginRemoteRequest.login(profileModel!.email!, password);
      if (response != false) {
        isTruePass = true;
        emit(CheckingPassSuccess());
        return true;
      } else {
        isTruePass = false;
        emit(WrongPass());
        return false;
      }
    } catch (e) {
      emit(CheckingPassFailed());
      return false;
    }
  }

  getPortfolio() async {
    emit(EditProfileLoading());
    portfolios.clear();

    String token = await LocalStorageHelper.getStrings('token');
    try {
      var remotePortfolios = await MyProfileRemoteRequest.getPortfolios(token);
      if (remotePortfolios != null) {
        portfolios.addAll(remotePortfolios);
        emit(EditProfileSuccess());
      }
    } catch (e) {
      emit(EditProfileFailed());
    }
  }

  addPortfolio(File cvFile) async {
    emit(EditProfileLoading());
    String token = await LocalStorageHelper.getStrings('token');
    try {
      await MyProfileRemoteRequest.addPortfolio(
          token: token, cvFile: cvFile, image: cvFile);
      emit(EditProfileSuccess());
      getPortfolio();
    } catch (e) {
      emit(EditProfileFailed());
    }
  }

  logOut() async {
    emit(EditProfileLoading());
    await LocalStorageHelper.setBool('Remember', false);
    emit(EditProfileSuccess());
  }
}
