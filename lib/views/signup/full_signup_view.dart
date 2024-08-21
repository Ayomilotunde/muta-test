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
import 'package:muta/views/login/login_view.dart';

import '../../utils/app_theme.dart';

class FullSignupView extends GetView<AuthController> {
  const FullSignupView({super.key});

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
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                YMargin(24.h),
                CustomAxiformaText(
                  text: "Enter name and password",
                  textColor: AppTheme.white,
                  fontWeight: FontWeight.w700,
                  textSize: 24.sp,
                  alignText: TextAlign.center,
                ),
                YMargin(40.h),
                CustomLabelUnderlineInputText(
                  label: "",
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  placeholder: "Enter email address",
                  validate: (value) {
                    // Validator.validateEmail(value);
                    return Validator.validateIsNotEmpty(value);
                  },
                  onKeyUp: (value) {
                    controller.email = value;
                  },
                ),
                YMargin(32.h),
                CustomLabelUnderlineInputText(
                  label: "",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  placeholder: "Enter Firstname",
                  onKeyUp: (value) {
                    controller.firstName = value;
                  },
                  validate: (value) {
                    // Validator.validateEmail(value);
                    return Validator.validateIsNotEmpty(value);
                  },
                ),
                YMargin(32.h),
                CustomLabelUnderlineInputText(
                  label: "",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  placeholder: "Enter Lastname",
                  onKeyUp: (value) {
                    controller.lastName = value;
                  },
                  validate: (value) {
                    // Validator.validateEmail(value);
                    return Validator.validateIsNotEmpty(value);
                  },
                ),
                YMargin(32.h),
                CustomLabelUnderlineInputText(
                  label: "",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.done,
                  obscureText: true,
                  placeholder: "Enter password",
                  onKeyUp: (value) {
                    controller.password = value;
                  },
                  validate: (value) {
                    // Validator.validateEmail(value);
                    return Validator.validateIsNotEmpty(value);
                  },
                ),
                YMargin(32.h),
                Button(
                  onPressed: () {
                    if (controller.formKey2.currentState != null &&
                        controller.formKey2.currentState!.validate()) {
                      controller.createAccount().then((isSuccessful) {
                        if (isSuccessful) {

                          Get.to(
                              transition: Transition.fadeIn,
                              () => const LoginView());
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const CustomAlertDialog(
                                    title: "SignUp Successful",
                                    content: "You have successfully created an account");
                              });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomAlertDialog(
                                    title: "SignUp Error",
                                    content: controller.errorMessage);
                              });
                        }
                      });
                    }
                  },
                  text: 'sign up'.toUpperCase(),
                  textSize: 14,
                  block: true,
                  textColor: AppTheme.black,
                  color: AppTheme.secondaryColor,
                  borderColor: AppTheme.border,
                ),
                YMargin(24.h),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Already a Muta user? ',
                    style: TextStyle(
                      color: AppTheme.white,
                      fontSize: 12,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Log in',
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
          ),
        ),
      ),
    );
  }
}
