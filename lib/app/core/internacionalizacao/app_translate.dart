import 'package:flutter/cupertino.dart';
import 'package:flutter_gofast/app/core/internacionalizacao/app_localizations.dart';

class AppTranslate {
  final BuildContext context;

  AppTranslate(this.context);

  String text(String key) {
    return AppLocalizations.of(context).translate(key);
  }
}
