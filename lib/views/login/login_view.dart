import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muta/controller/auth.dart';
import 'package:muta/utils/app_asset.dart';
import 'package:muta/utils/app_theme.dart';
import 'package:muta/utils/button.dart';
import 'package:muta/utils/components/custom_label_text_form_field.dart';
import 'package:muta/utils/components/custom_text.dart';
import 'package:muta/utils/dialog.dart';
import 'package:muta/utils/utils_helper.dart';
import 'package:muta/utils/validators.dart';
import 'package:muta/views/login/full_login_view.dart';
import 'package:muta/views/signup/full_signup_view.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              YMargin(24.h),
              CustomAxiformaText(
                text: "Log in to Muta",
                textColor: AppTheme.white,
                fontWeight: FontWeight.w700,
                textSize: 24.sp,
                alignText: TextAlign.center,
              ),
              YMargin(96.h),
              Container(
                height: 56.h,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 12.0, bottom: 12, right: 32, left: 24),
                      child: Image.asset(
                        AppImgAssets.google,
                        height: 32.h,
                        width: 32.w,
                      ),
                    ),
                    Positioned(
                        top: 16,
                        bottom: 16,
                        right: 0,
                        left: 0,
                        child: CustomAxiformaText(
                          text: "SIGN UP WITH GOOGLE",
                          alignText: TextAlign.center,
                          textColor: AppTheme.primaryColor,
                          fontWeight: FontWeight.w700,
                          textSize: 14.sp,
                        )),
                  ],
                ),
              ),
              YMargin(24.h),
              Container(
                height: 56.h,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 12.0, bottom: 12, right: 32, left: 24),
                      child: Image.asset(
                        AppImgAssets.facebook,
                        height: 32.h,
                        width: 32.w,
                      ),
                    ),
                    Positioned(
                        top: 16,
                        bottom: 16,
                        right: 0,
                        left: 0,
                        child: CustomAxiformaText(
                          text: "SIGN UP WITH FACEBOOK",
                          alignText: TextAlign.center,
                          textColor: AppTheme.primaryColor,
                          fontWeight: FontWeight.w700,
                          textSize: 14.sp,
                        )),
                  ],
                ),
              ),
              YMargin(56.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 0.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomAxiformaText(
                      text: "OR",
                      textColor: AppTheme.white,
                      fontWeight: FontWeight.w700,
                      textSize: 14.sp,
                      alignText: TextAlign.center,
                    ),
                  ),
                  const Expanded(
                      child: Divider(
                    thickness: 0.5,
                  )),
                ],
              ),
              CustomLabelUnderlineInputText(
                label: "",
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                validate: (value) {
                  // Validator.validateEmail(value);
                  return Validator.validateIsNotEmpty(value);
                },
                placeholder: "Enter email address",
                onKeyUp: (value) {
                  controller.email = value;
                },
              ),
              YMargin(40.h),
              Button(
                onPressed: () {
                  if (controller.email.isNotEmpty) {
                    Get.to(() => const FullLoginView(

                    ));
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomAlertDialog(
                              content: "Please fill in your Email");
                        });
                  }
                },
                text: 'login with email'.toUpperCase(),
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
        ),
      ),
    );
  }
}
