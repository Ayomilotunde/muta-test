import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muta/utils/app_asset.dart';
import 'package:muta/utils/app_theme.dart';
import 'package:muta/utils/button.dart';
import 'package:muta/utils/components/custom_text.dart';
import 'package:muta/utils/utils_helper.dart';
import 'package:muta/views/proficiency/proficiency_view.dart';

import 'learning_selection_viewmodel.dart';

class LearningSelection extends GetView<LearningSelectionViewmodel> {
  const LearningSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(AppImgAssets.back)),
        backgroundColor: AppTheme.primaryColor,

      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const YMargin(24),
                CustomAxiformaText(text: "I want to learn...", textColor: AppTheme.white, fontWeight: FontWeight.w600, textSize: 20.sp,),
                const YMargin(32),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    crossAxisSpacing: 8,
                    physics: const BouncingScrollPhysics(),
                    mainAxisSpacing: 8,
                    children: List.generate(controller.languages.length, (index) {
                      return GestureDetector(
                        onTap: (){
                          // controller.languages[index];
                        },
                          child: controller.languages[index]);
                    }),
                  ),
                ),
                const YMargin(62),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: AppTheme.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 17),
        child: Button(onPressed: (){
    Get.to(() => const ProficiencyView());
    }, text: 'Continue',textSize: 14,  block: true, textColor: AppTheme.black, color: AppTheme.secondaryColor, borderColor: AppTheme.border,),
      ),
    );
  }
}
