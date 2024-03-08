import 'dart:developer';

import 'package:flutter_application_1/features/create_account/controller/register_states.dart';
import 'package:flutter_application_1/features/create_account/data/data_sources/register_remote_request.dart';
import 'package:flutter_application_1/features/create_account/data/user_model.dart';
import 'package:flutter_application_1/features/sign_in/data/data_sources/login_remote_request.dart';
import 'package:flutter_application_1/features/sign_in/data/data_sources/login_shared_pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(GetInitialStateRegister());
  void registerUser(UserModel user) async{
    emit(RegisterLoadingState());
    try {
      await RegisterRemoteDataSource.createAccount(user);
      emit(RegisterSuccessState());
    } catch (e) {
      emit(RegisterFailedState());
      // print('catched');
    }
  }
    void loginUserReg(String email, String password) async {
    emit(LoginRegLoading());
    try {
      var response = await LoginRemoteRequest.login(email, password);
      if (response != false) {
        LoginSharedPref.setToken(response.data['token']);
        log('${response.data['token']}');
        LoginSharedPref.setName(response.data['user']['name']);
        log('${response.data['user']['name']}');
        emit(LoginRegSuccess());
      } else {
        emit(LoginRegFailed());
      }
    } catch (e) {
      emit(LoginRegFailed());
    }
  }
}
