import 'package:book_your_taxi/core/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'core/route/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,

    );
  }
}
