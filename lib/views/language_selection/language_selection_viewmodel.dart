import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_asset.dart';
import 'components/language_item.dart';

class LanguageSelectionViewmodel extends GetxService{
  RxString selected = "I speak English".obs;

}