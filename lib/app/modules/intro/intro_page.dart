import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/core/internacionalizacao/app_translate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'intro_controller.dart';

class IntroPage extends StatefulWidget {
  final String title;

  const IntroPage({Key key, this.title = "Intro"}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends ModularState<IntroPage, IntroController> {
  int currentIndex = 0;

  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        AppTranslate(context).text('intro.welcome'),
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SlideWidget()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
