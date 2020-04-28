// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$themeAppAtom = Atom(name: '_AppControllerBase.themeApp');

  @override
  IThemeAppInterface get themeApp {
    _$themeAppAtom.context.enforceReadPolicy(_$themeAppAtom);
    _$themeAppAtom.reportObserved();
    return super.themeApp;
  }

  @override
  set themeApp(IThemeAppInterface value) {
    _$themeAppAtom.context.conditionallyRunInAction(() {
      super.themeApp = value;
      _$themeAppAtom.reportChanged();
    }, _$themeAppAtom, name: '${_$themeAppAtom.name}_set');
  }

  final _$getThemeDataAsyncAction = AsyncAction('getThemeData');

  @override
  Future getThemeData() {
    return _$getThemeDataAsyncAction.run(() => super.getThemeData());
  }

  final _$setThemeDataAsyncAction = AsyncAction('setThemeData');

  @override
  Future setThemeData(ThemeMode themeMode, {bool saveShared = true}) {
    return _$setThemeDataAsyncAction
        .run(() => super.setThemeData(themeMode, saveShared: saveShared));
  }

  @override
  String toString() {
    final string = 'themeApp: ${themeApp.toString()}';
    return '{$string}';
  }
}
