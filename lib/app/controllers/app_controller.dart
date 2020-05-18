import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../core/theme/app_theme_dark.dart';
import '../core/theme/app_theme_light.dart';
import '../interfaces/shared_repository_interface.dart';
import '../interfaces/theme_app_interface.dart';
import '../repositories/shared_repositories.dart';

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
  IThemeAppInterface themeApp = AppThemeLight() as IThemeAppInterface;

  @action
  setThemeData(ThemeMode themeMode, {bool saveShared = true}) async {
    switch (themeMode) {
      case ThemeMode.dark:
        themeApp = AppThemeDark() as IThemeAppInterface;
        break;
      default:
        themeApp = AppThemeLight() as IThemeAppInterface;
        break;
    }
    if (saveShared) {
      await sharedRepositories.setValue('theme_mode', themeMode.toString());
    }
  }
}
