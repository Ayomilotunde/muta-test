import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muta/utils/app_asset.dart';
import 'package:muta/utils/app_theme.dart';
import 'package:muta/utils/button.dart';
import 'package:muta/utils/components/custom_text.dart';
import 'package:muta/utils/utils_helper.dart';
import 'package:muta/views/proficiency/components/proficiency_item.dart';
import 'package:muta/views/signup/signup_view.dart';

class ProficiencyView extends StatefulWidget {
  const ProficiencyView({super.key});

  @override
  State<ProficiencyView> createState() => _ProficiencyViewState();
}

class _ProficiencyViewState extends State<ProficiencyView> {
  String _selectedLevel = "Beginner";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(AppImgAssets.back)),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YMargin(24),
            CustomAxiformaText(
              text: "How would you rate your\nproficiency in Yoruba?",
              textColor: AppTheme.white,
              fontWeight: FontWeight.w600,
              textSize: 20.sp,
            ),
            const YMargin(64),
            GestureDetector(
                onTap: () {
                  _selectedLevel = "Novice";
                  setState(() {});
                },
                child: ProficiencyItem(
                  proficiencyIcon: AppImgAssets.level1,
                  proficiency: "Novice",
                  proficiencySubText: "I’m new to Yoruba",
                  isSelected: _selectedLevel,
                )),
            const YMargin(32),
            GestureDetector(
                onTap: () {
                  _selectedLevel = "Beginner";
                  setState(() {});
                },
                child: ProficiencyItem(
                  proficiencyIcon: AppImgAssets.level2,
                  proficiency: "Beginner",
                  proficiencySubText: "I know some words in Yoruba",
                  isSelected: _selectedLevel,
                )),
            const YMargin(32),
            GestureDetector(
                onTap: () {
                  _selectedLevel = "Intermediate";
                  setState(() {});
                },
                child: ProficiencyItem(
                  proficiencyIcon: AppImgAssets.level3,
                  proficiency: "Intermediate",
                  proficiencySubText:
                      "I can have simple\nconversations in Yoruba ",
                  isSelected: _selectedLevel,
                )),
          ],
        ),
      ),
      bottomSheet: Container(
        color: AppTheme.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 17),
        child: Button(onPressed: (){
          Get.to(() => const SignupView());
        }, text: 'Continue',textSize: 14,  block: true, textColor: AppTheme.black, color: AppTheme.secondaryColor, borderColor: AppTheme.border,),
      ),
    );
  }
}
