import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muta/utils/app_asset.dart';
import 'package:muta/utils/app_theme.dart';
import 'package:muta/utils/components/custom_text.dart';

import '../../../utils/utils_helper.dart';

class ProficiencyItem extends StatelessWidget {
  final String proficiencyIcon;
  final String proficiency;
  final String proficiencySubText;
  final String? isSelected;
  const ProficiencyItem({super.key, required this.proficiencyIcon, required this.proficiency, this.isSelected, required this.proficiencySubText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(width: 1.w, color: isSelected != null && isSelected == proficiency ? AppTheme.faintTextColor : AppTheme.faintBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28),
                child: Image.asset(proficiencyIcon, height: 32.h, width: 32.w,),
              ),
              const YMargin(24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomAxiformaText(text: proficiency, textColor: AppTheme.white, fontWeight: FontWeight.w600, textSize: 16.sp,),
                  CustomAxiformaText(text: proficiencySubText, textColor: AppTheme.faintTextColor, fontWeight: FontWeight.w400, textSize: 14.sp,),
                ],
              ),
            ],
          ),
          if(isSelected != null && isSelected == proficiency)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28),
            child: Image.asset(AppImgAssets.check, height: 32.h, width: 32.w,),
          ),
        ],
      ),
    );
  }
}
