import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMagicaText extends StatelessWidget {
  final String text;
  final double? textSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? alignText;
  final TextOverflow? overflow;
  final bool? softwrap;
  final TextDecoration? decoration;
  final int? maxline;

  const CustomMagicaText({
    Key? key,
    required this.text,
    this.textSize,
    this.fontWeight,
    this.textColor,
    this.alignText,
    this.overflow,
    this.softwrap,
    this.decoration,
    this.maxline,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
           TextStyle(
        fontFamily: fontFamily ?? "Magica",
        fontSize: textSize,
        fontWeight: fontWeight,
        color: textColor,
        decoration: decoration,
      ),
      maxLines: maxline,
      textAlign: alignText,
      overflow: overflow,
      softWrap: softwrap,
    );
  }
}

class CustomAxiformaText extends StatelessWidget {
  final String text;
  final double? textSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? alignText;
  final TextOverflow? overflow;
  final bool? softwrap;

  const CustomAxiformaText({
    Key? key,
    required this.text,
    this.textSize,
    this.fontWeight,
    this.textColor,
    this.alignText,
    this.overflow,
    this.softwrap,
    this.fontFamily,
  }) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily ?? "Axiforma",
        fontSize: textSize,
        fontWeight: fontWeight,
        color: textColor,
      ),
      textAlign: alignText,
      overflow: overflow,
      softWrap: softwrap,
    );
  }
}

