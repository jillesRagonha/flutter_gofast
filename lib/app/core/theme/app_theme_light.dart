import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter_gofast/app/core/consts/colors_const.dart';
import 'package:flutter_gofast/app/core/interfaces/theme_app_interface.dart';

class AppThemeLight implements IThemeAppInterface {
  @override
  ThemeData getTheme() {
    return ThemeData(
        fontFamily: "Google",
        scaffoldBackgroundColor: Colors.white,
        primaryColor: ColorsConst.primaryColor,
        buttonColor: ColorsConst.primaryColor,
        buttonTheme: ButtonThemeData(
            height: 50,
            minWidth: double.infinity,
            buttonColor: ColorsConst.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            textTheme: ButtonTextTheme.primary),);
  }
}
