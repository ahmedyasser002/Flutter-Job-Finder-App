import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/local_storage_helper.dart';
import 'package:flutter_application_1/main_app.dart';
import 'package:flutter_application_1/my_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageHelper.init();
  // LocalStorageHelper.setBool('Remember', false);
  // LocalStorageHelper.setIntegers('progress', 0);
  // LocalStorageHelper.setBool('board', false);
  runApp(const MainApp());
}
