import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muta/controller/app.dart';
import 'package:muta/utils/app_theme.dart';

import 'views/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414.0, 896.0),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'Muta',
        defaultTransition: Transition.native,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.primaryColor),
          useMaterial3: true,
          scaffoldBackgroundColor: AppTheme.primaryColor
        ),
        initialBinding: BindingsBuilder.put(() => AppController()),
        home: const SplashScreen(),
        // home: const ProfileView(),
      ),
    );
  }
}
