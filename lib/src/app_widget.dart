import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fteam_test/src/core/colors/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F-Team Test',
      theme: ThemeData(primarySwatch: AppColors.customColor),
    ).modular();
  }
}
