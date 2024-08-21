
import 'package:get/get.dart';
import 'package:muta/controller/auth.dart';
import 'package:muta/views/learning_selection/learning_selection_viewmodel.dart';
import 'package:muta/views/welcome/welcome_view.dart';

import '../views/language_selection/language_selection_viewmodel.dart';

class AppController extends GetxService {
  @override
  Future<void> onInit() async {
    super.onInit();
    Get.put(LanguageSelectionViewmodel());
    Get.put(LearningSelectionViewmodel());
    Get.put(AuthController());
    await Future.delayed(
        const Duration(seconds: 3), () async => await Get.to(() => const WelcomeView()));
  }

}
