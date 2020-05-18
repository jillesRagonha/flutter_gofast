import 'package:flutter/src/material/theme_data.dart';
import '../../interfaces/theme_app_interface.dart';

class AppThemeDark implements IThemeAppInterface {
  @override
  ThemeData getTheme() {
    return ThemeData.dark();
  }
}
