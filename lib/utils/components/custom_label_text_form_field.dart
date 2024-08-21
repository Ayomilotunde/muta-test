import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muta/utils/app_theme.dart';
import 'package:muta/utils/components/custom_text.dart';


class CustomLabelUnderlineInputText extends StatelessWidget {
  const CustomLabelUnderlineInputText({
    Key? key,
    required this.label,
    required this.controller,
    this.placeholder,
    this.maxLength,
    required this.keyboardType,
    required this.inputAction,
    this.validate,
    this.enabled,
    this.obscureText = false,
    this.readOnly = false,
    this.labelColor,
    this.borderColor,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.sentences,
    this.suffixIcon,
    this.prefixIcon,
    this.onKeyUp,
    this.onEditingComplete,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final String? placeholder;
  final int? maxLength;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final FormFieldValidator<String>? validate;
  final bool? enabled;
  final bool obscureText;
  final bool readOnly;
  final Color? labelColor;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onKeyUp;
  final Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: CustomAxiformaText(
            text: label,
            textColor: labelColor ?? Colors.black,
            textSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          height: 64,
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
          child: TextFormField(
            onChanged: onKeyUp,
            onEditingComplete: onEditingComplete,
            controller: controller,
            validator: validate,
            textInputAction: inputAction,
            keyboardType: keyboardType,
            maxLength: maxLength,
            style: const TextStyle(fontSize: 16, color: AppTheme.white),
            decoration: InputDecoration(
                fillColor: Colors.grey,
                contentPadding: const EdgeInsets.only(bottom: 11),
                hintText: placeholder,
                prefixIcon: prefixIcon,
                hintStyle: const TextStyle(fontSize: 15, color: AppTheme.faintTextColor, fontWeight: FontWeight.w400),
                // border: InputBorder.none,
                suffixIcon: suffixIcon,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.faintTextColor),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.faintTextColor),
                ),

                suffixIconConstraints: const BoxConstraints(
                    maxHeight: 30, maxWidth: 24, minHeight: 20)),
            readOnly: readOnly,
            enabled: enabled,
            cursorColor: AppTheme.faintTextColor,
            inputFormatters: inputFormatters,
            textCapitalization: textCapitalization,
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}
