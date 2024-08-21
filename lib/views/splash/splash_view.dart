import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muta/utils/app_asset.dart';
import 'package:muta/utils/app_theme.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Container(
          alignment: Alignment.center,
          child: Image.asset(AppImgAssets.logo, height: 112.h,
            width: 112.w,)
      ),
    );
  }
}
