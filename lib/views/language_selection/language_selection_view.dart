import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muta/utils/app_asset.dart';
import 'package:muta/utils/app_theme.dart';
import 'package:muta/utils/button.dart';
import 'package:muta/utils/util_helpers.dart';
import 'package:muta/views/language_selection/components/language_item.dart';
import 'package:muta/views/language_selection/language_selection_viewmodel.dart';
import 'package:muta/views/learning_selection/learning_selection.dart';

class LanguageSelectionView extends GetView<LanguageSelectionViewmodel> {
  const LanguageSelectionView({super.key});

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
      body: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  controller.selected.value = "I speak English";
                },
                child: LanguageItem(
                  languageIcon: AppImgAssets.english,
                  language: "I speak English",
                  selected: controller.selected.value,
                ),
              ),
              const YMargin(20),
              GestureDetector(
                onTap: () {
                  controller.selected.value = "Je parle Français";
                },
                child: LanguageItem(
                  languageIcon: AppImgAssets.french,
                  language: "Je parle Français",
                  selected: controller.selected.value,
                ),
              ),
              const YMargin(20),
              GestureDetector(
                onTap: () {
                  controller.selected.value = "Eu falo Português";
                },
                child: LanguageItem(
                  languageIcon: AppImgAssets.portuguese,
                  language: "Eu falo Português",
                  selected: controller.selected.value,
                ),
              ),
              const YMargin(20),
              GestureDetector(
                onTap: () {
                  controller.selected.value = "Yo hablo Español";
                },
                child: LanguageItem(
                  languageIcon: AppImgAssets.spanish,
                  language: "Yo hablo Español",
                  selected: controller.selected.value,
                ),
              ),
              const YMargin(64),
              Button(onPressed: (){
                Get.to(() => const LearningSelection());
              }, text: 'CONTINUE',textSize: 14,  block: true, textColor: AppTheme.black, color: AppTheme.secondaryColor, borderColor: AppTheme.border,),

            ],
          ),
        ),
      ),
    );
  }
}
