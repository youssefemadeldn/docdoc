import 'package:bloc/bloc.dart';
import 'package:docdoc/core/di/di.dart';
import 'package:docdoc/core/routes/app_router.dart';
import 'package:docdoc/doc_doc_app.dart';
import 'package:docdoc/my_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // to fix text being hidden in release mode
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();

  configureDependencies();
  runApp(
    DocDocApp(
      appRouter: AppRouter(),
    ),
  );
}
