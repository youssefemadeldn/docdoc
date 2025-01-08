import 'package:docdoc/core/di/di.dart';
import 'package:docdoc/core/routes/routes.dart';
import 'package:docdoc/features/home/presentation/controller/home_cubit/home_cubit.dart';
import 'package:docdoc/features/home/presentation/controller/home_cubit/home_cubit.dart';
import 'package:docdoc/features/home/presentation/view/home_view.dart';
import 'package:docdoc/features/login/presentation/controller/cubit/login_cubit.dart';
import 'package:docdoc/features/login/presentation/views/login_view.dart';
import 'package:docdoc/features/login/presentation/views/on_boarding_view.dart';
import 'package:docdoc/features/sign_up/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:docdoc/features/sign_up/presentation/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());

      case Routes.loginView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginView(),
          ),
        );
      case Routes.homeView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<HomeCubit>()..getHomeData(),
                  child: const HomeView(),
                ));
      case Routes.signView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SignUpCubit>(),
                  child: const SignUpView(),
                ));

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
