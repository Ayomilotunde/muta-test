import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;
  final Color? color;
  final Color? borderColor;
  bool light = false;
  final IconData? icon;
  final Color? textColor;
  bool block = false;
  double? textSize;

  Button(
      {super.key,
      required this.onPressed,
      required this.text,
      this.color,
      this.borderColor,
      this.light = false,
      this.icon,
      this.textColor,
      this.block = false, this.textSize
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: block == true ? MediaQuery.of(context).size.width : 130,
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),
          border: Border.all(
              color: borderColor != null ? borderColor! : Colors.white)),

      child: ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          elevation: 0,
          backgroundColor: light == false ? color : Colors.white,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8)),
        ),
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // k30HorizontalSpacing,
                  // k10HorizontalSpacing,
                  // k10HorizontalSpacing,
                  Icon(
                    icon,
                    color: light == false
                        ? Colors.white
                        : textColor ?? (color ?? Colors.blue),
                    size: 25,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  // k5HorizontalSpacing,
                  Expanded(
                    child: Text("$text  ",
                        style: TextStyle(
                            letterSpacing: 1,
                            color: light == false
                                ? Colors.white
                                : textColor ?? (color ?? Colors.blue),
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                  ),
                ],
              )
            : Center(
                child: Text(text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 1,
                        color: textColor ??
                            (light == false ? Colors.white : Colors.blue),
                        fontWeight: FontWeight.w700,
                        fontSize: textSize ?? 13)),
              ),
      ),
    );
  }
}
