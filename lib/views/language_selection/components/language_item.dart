import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muta/utils/app_asset.dart';
import 'package:muta/utils/app_theme.dart';
import 'package:muta/utils/components/custom_text.dart';
import 'package:muta/utils/utils_helper.dart';

class LanguageItem extends StatelessWidget {
  final String languageIcon;
  final String language;
  final String selected;

  const LanguageItem({super.key, required this.languageIcon, required this.language, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      padding: const EdgeInsets.only(left: 24, right: 16, top: 20, bottom: 20),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(width: 2.w, color: selected == language ? AppTheme.faintTextColor : AppTheme.faintBorder),
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(languageIcon, height: 32.h, width: 32.w,),
              const XMargin(16),
              CustomAxiformaText(text: language, textColor: AppTheme.white, textSize: 16.sp, fontWeight: FontWeight.w500,),
            ],
          ),
          if(selected == language)
            Image.asset(AppImgAssets.check, height: 32.h, width: 32.w,),
        ],
      ),
    );
  }
}
