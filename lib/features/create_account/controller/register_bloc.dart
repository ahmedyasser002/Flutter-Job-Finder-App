import 'package:flutter_application_1/features/create_account/controller/register_states.dart';
import 'package:flutter_application_1/features/create_account/data/data_sources/register_remote_request.dart';
import 'package:flutter_application_1/features/create_account/data/user_model.dart';
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
}
