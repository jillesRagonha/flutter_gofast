import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../controllers/intro_controller.dart';
import '../../../core/consts/colors_const.dart';
import '../../../core/internacionalizacao/app_translate.dart';
import 'widgets/slide_dots_widget.dart';
import 'widgets/slide_widget.dart';

class IntroPage extends StatefulWidget {
  final String title;

  const IntroPage({Key key, this.title = "Intro"}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends ModularState<IntroPage, IntroController> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      AppTranslate(context).text('intro.welcome'),
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SlideWidget(
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                    SlideDotsWidget(
                      currentPage: currentIndex,
                    ),
                    SizedBox(
                      height: _height * 0.06,
                    ),
                    RaisedButton(
                        onPressed: () {},
                        child: Text(
                          AppTranslate(context).text('intro.login_now'),
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            height: 1, color: ColorsConst.grey400, width: 100),
                        Text(
                          AppTranslate(context).text('intro.or'),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: ColorsConst.grey600),
                        ),
                        Container(
                            height: 1, color: ColorsConst.grey400, width: 100),
                      ],
                    ),
                    SizedBox(
                      height: _height * 0.04,
                    ),
                    RaisedButton(
                      color: Colors.red,
                      onPressed: () {},
                      child: Text(
                        AppTranslate(context).text('intro.login_google'),
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
