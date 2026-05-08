import 'package:book_your_taxi/core/app_theme/app_theme.dart';
import 'package:book_your_taxi/core/storage/hive_storage_initializer.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:toastification/toastification.dart';
import 'core/app_binding/app_binding.dart';
import 'core/localisation/app_translation.dart';
import 'core/route/app_router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveStorageInitializer.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp.router(
        initialBinding: AppBinding(),
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        translations: AppTranslations(),
        locale: Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        fallbackLocale: Locale('en', 'US'),
        title: 'BYT',
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
