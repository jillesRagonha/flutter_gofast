import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../controllers/app_controller.dart';
import '../core/consts/routers_const.dart';
import '../interfaces/auth_repository_interface.dart';
import '../interfaces/shared_repository_interface.dart';
import '../repositories/auth_repository.dart';
import '../repositories/shared_repositories.dart';
import '../views/pages/main/app_widget.dart';
import '../views/pages/splash/splash_page.dart';

import 'home_module.dart';
import 'intro_module.dart';
import 'login_module.dart';


class AppModule extends MainModule {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  List<Bind> get binds => [
        Bind<ISharedRepositoryInterface>((i) => SharedRepositories()),
        Bind((i) => AppController()),
        Bind(
          (i) => AppController(),
        ),
        Bind<IAuthRepository>(
          (i) => AuthRepository(firebaseAuth),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
        Router(
          RoutersConst.splash,
          child: (_, args) => SplashPage(),
          transition: TransitionType.noTransition,
        ),
        Router(
          RoutersConst.home,
          module: HomeModule(),
        ),
        Router(
          RoutersConst.login,
          module: LoginModule(),
        ),
        Router(
          RoutersConst.intro,
          module: IntroModule(),
        ),
      ];
}
