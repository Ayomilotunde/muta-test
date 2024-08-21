import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:muta/utils/app_theme.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        size: 50,
        color: AppTheme.primaryColor,
        secondRingColor: AppTheme.secondaryColor,
        thirdRingColor: AppTheme.accent,
      ),
    );
  }
}