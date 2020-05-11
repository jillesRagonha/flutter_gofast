import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'core/interfaces/shared_repository_interface.dart';
import 'core/interfaces/theme_app_interface.dart';
import 'core/repositories/shared_repositories.dart';
import 'core/theme/app_theme_dark.dart';
import 'core/theme/app_theme_light.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  SharedRepositories sharedRepositories =
      Modular.get<ISharedRepositoryInterface>();

  _AppControllerBase() {
    getThemeData();
  }

  @action
  getThemeData() async {
    await sharedRepositories.getValue<String>('theme_mode').then((value) {
      setThemeData(value == 'ThemeMode.dark' ? ThemeMode.dark : ThemeMode.light,
          saveShared: false);
    });
  }

  @observable
  IThemeAppInterface themeApp = AppThemeLight();

  @action
  setThemeData(ThemeMode themeMode, {bool saveShared = true}) async {
    switch (themeMode) {
      case ThemeMode.dark:
        themeApp = AppThemeDark();
        break;
      default:
        themeApp = AppThemeLight();
        break;
    }
    if (saveShared) {
      await sharedRepositories.setValue('theme_mode', themeMode.toString());
    }
  }
}
