import 'package:flutter/material.dart';
import 'package:muta/utils/app_asset.dart';
import 'package:muta/utils/app_theme.dart';
import 'package:muta/utils/utils_helper.dart';

class CustomAlertDialog extends StatelessWidget {
  final String? title;
  final String content;
  const CustomAlertDialog({super.key, this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              // Color(0xFFAA00FF), // Start color
              // Color(0xFFFF00FF), // End color
              AppTheme.alertError,
              AppTheme.secondaryColor
            ],
          ),
        ),
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,

          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 13),
                    child: Icon(Icons.close,color: Colors.black, size: 24,),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red.shade100,
                child: Image.asset(AppImgAssets.error, height: 107, width: 107,),
              ),
              const SizedBox(height: 22),
              Text(
                title ?? '',
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 9),
              Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400
                ),
              ),
              const YMargin(44),
            ],
          ),
        ),
      ),
    );
  }
}
