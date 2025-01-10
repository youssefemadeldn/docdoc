import 'package:docdoc/core/routes/app_router.dart';
import 'package:docdoc/core/routes/routes.dart';
import 'package:docdoc/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helper/constants.dart';

class DocDocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocDocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Docdoc App',
        theme: ThemeData(
          primaryColor: AppColors.mainBlue,
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.mainBlue,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: isLoggedIn ? Routes.homeView : Routes.loginView,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
