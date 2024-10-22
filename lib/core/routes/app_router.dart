import 'package:docdoc/core/routes/routes.dart';
import 'package:docdoc/features/login/presentation/views/login_view.dart';
import 'package:docdoc/features/login/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (_) => OnBoardingView());

      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => LoginView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No Route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
