import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muta/utils/app_asset.dart';
import 'package:muta/utils/app_theme.dart';
import 'package:muta/utils/components/custom_text.dart';
import 'package:muta/utils/utils_helper.dart';
import 'package:muta/views/language_selection/language_selection_view.dart';
import 'package:muta/views/learning_selection/learning_selection.dart';
import 'package:muta/views/login/login_view.dart';

import '../../utils/button.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: 360.h,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImgAssets.welcomeHeader),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high
                  )
              ),
            ),
            Positioned(
              top: 250,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAxiformaText(text: "Learn languages from", textColor: AppTheme.white, fontWeight: FontWeight.w300, textSize: 18.sp,),
                    const YMargin(16),
                    CustomMagicaText(text: "Africa", textColor: AppTheme.white, fontWeight: FontWeight.w400, textSize: 64.sp,),
                    const YMargin(32),
                    CustomAxiformaText(text: "Muta helps you learn African languages in the easiest way", textColor: AppTheme.faintTextColor, fontWeight: FontWeight.w400, textSize: 15.sp,),
                    const YMargin(72),
                    Button(onPressed: (){
                      Get.to(() => const LanguageSelectionView());
                    }, text: 'GET STARTED',textSize: 14,  block: true, textColor: AppTheme.black, color: AppTheme.secondaryColor, borderColor: AppTheme.border,),
                    const YMargin(32),
                    Button(onPressed: (){
                      Get.to(() => const LoginView());
                    }, text: 'Login', textSize: 14, block: true, textColor: AppTheme.border, color: AppTheme.transparent, borderColor: AppTheme.border,),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 32,
                left: 17,
                right: 16,
                child: RichText(
                  textAlign: TextAlign.center,
                  text:  const TextSpan(
                    text: 'By continuing on this app, you agree to Muta’s \n',
                    style: TextStyle(
                      color: AppTheme.white,
                      fontSize: 12,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                          color: AppTheme.border,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(
                          color: AppTheme.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: AppTheme.border,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
