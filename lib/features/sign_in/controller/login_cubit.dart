import 'dart:developer';

import 'package:flutter_application_1/features/sign_in/controller/login_state.dart';
import 'package:flutter_application_1/features/sign_in/data/data_sources/login_remote_request.dart';
import 'package:flutter_application_1/features/sign_in/data/data_sources/login_shared_pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoggingState> {
  bool _isRemeberMe = false;
  LoginCubit() : super(GetInitialStateLogin());

  void setisRememberMe(bool value){
    _isRemeberMe=value;
  }

  void loginUser(String email, String password) async {
    emit(LoginLoadingState());
    try {
      var response = await LoginRemoteRequest.login(email, password);
      if (response != false) {
        LoginSharedPref.setToken(response.data['token']);
        log('${response.data['token']}');
        LoginSharedPref.setName(response.data['user']['name']);
        log('${response.data['user']['name']}');
        if (_isRemeberMe == true) {
          LoginSharedPref.rememberMe(_isRemeberMe);

          
        }
        emit(LoginSuccessState());
      } else {
        emit(LoginFailedState());
      }
    } catch (e) {
      emit(LoginFailedState());
    }
  }
}
