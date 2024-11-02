import 'package:docdoc/core/di/di.dart';
import 'package:docdoc/core/routes/app_router.dart';
import 'package:docdoc/doc_doc_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(
    DocDocApp(
      appRouter: AppRouter(),
    ),
  );
}
