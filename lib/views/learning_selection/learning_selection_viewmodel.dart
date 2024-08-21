import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muta/utils/app_asset.dart';
import 'package:muta/utils/app_theme.dart';
import 'package:muta/views/learning_selection/component/learning_item.dart';

class LearningSelectionViewmodel extends GetxService{
  RxBool isChecked = false.obs;
  RxList<Widget> languages = <Widget>[
    const LearningItem(languageIcon: AppImgAssets.swahili, language: "Swahili"),
    const LearningItem(languageIcon: AppImgAssets.amharic, language: "Amharic"),
    const LearningItem(languageIcon: AppImgAssets.yoruba, language: "Yoruba"),
    const LearningItem(languageIcon: AppImgAssets.fula, language: "Fula"),
    const LearningItem(languageIcon: AppImgAssets.igbo, language: "Igbo"),
    const LearningItem(languageIcon: AppImgAssets.hausa, language: "Hausa"),
    const LearningItem(languageIcon: AppImgAssets.oromo, language: "Oromo"),
    const LearningItem(languageIcon: AppImgAssets.zulu, language: "Zulu"),
    const LearningItem(languageIcon: AppImgAssets.shona, language: "Shona"),
  ].obs;

}