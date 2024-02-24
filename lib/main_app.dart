import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/applied/controller/applied_cubit.dart';
import 'package:flutter_application_1/features/apply_job/controller/apply_cubit.dart';
import 'package:flutter_application_1/features/homescreen/controller/homescreen_cubit.dart';
import 'package:flutter_application_1/features/homescreen/controller/searchscreen_cubit.dart';
import 'package:flutter_application_1/features/messages/controller/message_cubit.dart';
import 'package:flutter_application_1/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:flutter_application_1/features/profile_setting/controller/profile_cubit.dart';
import 'package:flutter_application_1/features/saved_notifications/controller/notify_cubit.dart';
import 'package:flutter_application_1/features/saved_notifications/controller/saved_cubit.dart';
import 'package:flutter_application_1/features/sign_in/controller/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/features/create_account/controller/register_bloc.dart';

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => RegisterCubit()),
            BlocProvider(create: (context) => LoginCubit()),
            BlocProvider(
              create: (context) => HomeScreenCubit(),
            ),
            BlocProvider(create: (context) => SearchScreenCubit()),
            BlocProvider(create: (context) => MessageCubit()),
            BlocProvider(create: (context) => NotifyCubit()),
            BlocProvider(create: (context) => SavedCubit()),
            BlocProvider(create: (context) => ProfileCubit()),
            BlocProvider(create: (context) => ApplyCubit()),
            BlocProvider(create: (context) => AppliedCubit()),
          ],
          child: const MaterialApp(
            // routes: {
            //       '/TwoStepOne': (context) => TwoStepOne(onTwoStepChanged: (value){} /* your callback */),
            // },
            debugShowCheckedModeBanner: false,

            home: SplashScreen(),
            // home: SearchScreen(),
            // home: SplashScreen(),
          )),
    );
  }
}
