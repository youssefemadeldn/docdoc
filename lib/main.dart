import 'package:bloc/bloc.dart';
import 'package:docdoc/core/cache/shared_pref.dart';
import 'package:docdoc/core/di/di.dart';
import 'package:docdoc/core/helper/constants.dart';
import 'package:docdoc/core/routes/app_router.dart';
import 'package:docdoc/doc_doc_app.dart';
import 'package:docdoc/my_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  Shared pref init
  await SharedPrefUtils.init();

  // to fix text being hidden in release mode
  await ScreenUtil.ensureScreenSize();

  // Bloc observer
  Bloc.observer = MyBlocObserver();

  configureDependencies();
  checkIfUserLoggedIn();
  runApp(
    DocDocApp(
      appRouter: AppRouter(),
    ),
  );
}

void checkIfUserLoggedIn() {
  var token = SharedPrefUtils.getData('token');
  if (token != null && token.isNotEmpty) {
    isLoggedIn = true;
  } else {
    isLoggedIn = false;
  }
}
