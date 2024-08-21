import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muta/utils/app_asset.dart';
import 'package:muta/utils/app_theme.dart';
import 'package:muta/utils/components/custom_text.dart';

import '../../../utils/utils_helper.dart';

class LearningItem extends StatelessWidget {
  final String languageIcon;
  final String language;
  final bool? isSelected;
  const LearningItem({super.key, required this.languageIcon, required this.language, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 163.w,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(width: 1.w, color: isSelected != null && isSelected! ? AppTheme.primaryColor : AppTheme.faintTextColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(languageIcon, height: 64.h, width: 64.w,),
          const YMargin(24),
          CustomAxiformaText(text: language, textColor: AppTheme.white, fontWeight: FontWeight.w600, textSize: 20.sp,),
        ],
      ),
    );
  }
}
