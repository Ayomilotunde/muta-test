import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muta/controller/auth.dart';
import 'package:muta/utils/app_asset.dart';
import 'package:muta/utils/button.dart';
import 'package:muta/utils/components/custom_label_text_form_field.dart';
import 'package:muta/utils/components/custom_text.dart';
import 'package:muta/utils/dialog.dart';
import 'package:muta/utils/utils_helper.dart';
import 'package:muta/utils/validators.dart';
import 'package:muta/views/dashboard/dashboard_view.dart';

import '../../utils/app_theme.dart';

class FullLoginView extends GetView<AuthController> {
  const FullLoginView({super.key});

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
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Form(
          key: controller.formKey1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              YMargin(24.h),
              CustomAxiformaText(
                text: "Enter your password",
                textColor: AppTheme.white,
                fontWeight: FontWeight.w700,
                textSize: 24.sp,
                alignText: TextAlign.center,
              ),
              YMargin(40.h),
              CustomLabelUnderlineInputText(label: "", controller: controller.emailController, keyboardType: TextInputType.emailAddress, inputAction: TextInputAction.next,
                validate: (value) {
                  // Validator.validateEmail(value);
                  return Validator.validateIsNotEmpty(value);
                },
                placeholder: "Enter email address", onKeyUp: (value){controller.email = value;},),
              YMargin(32.h),
              CustomLabelUnderlineInputText(label: "", controller: TextEditingController(), keyboardType: TextInputType.emailAddress, inputAction: TextInputAction.done, placeholder: "Enter password", validate: (value) {
                // Validator.validateEmail(value);
                return Validator.validateIsNotEmpty(value);
              },
                onKeyUp: (value){controller.password = value;},
              ),
              YMargin(32.h),
              Button(onPressed: (){
                if (controller
                    .formKey1.currentState !=
                    null &&
                    controller.formKey1.currentState!
                        .validate()) {
                  controller
                      .logIn()
                      .then((isSuccessful) {
                    if (isSuccessful) {

                      Get.to(
                          transition:
                          Transition.fadeIn,
                              () => const DashboardView());
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const CustomAlertDialog(
                              title: "Login Successful",
                                content: "You have successfully login");
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomAlertDialog(
                                title: "Login Error",
                                content: controller
                                    .errorMessage);
                          });
                    }
                  });
                }
              }, text: 'Login'.toUpperCase(),textSize: 14,  block: true, textColor: AppTheme.black, color: AppTheme.secondaryColor, borderColor: AppTheme.border,),
              YMargin(24.h), RichText(
                textAlign: TextAlign.center,
                text:  const TextSpan(
                  text: 'Don’t have a Muta account? ',
                  style: TextStyle(
                    color: AppTheme.white,
                    fontSize: 12,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: AppTheme.secondaryColor,
                        fontWeight: FontWeight.w600,
                      ),

                    ),
                  ],
                ),
              ),
            ],
          ),
        ),),
    );
  }
}
