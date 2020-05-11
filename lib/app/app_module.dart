import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_gofast/app/core/consts/routers_const.dart';
import 'package:flutter_gofast/app/modules/intro/intro_module.dart';
import 'package:flutter_gofast/app/modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_controller.dart';
import 'app_widget.dart';
import 'core/interfaces/auth_repository_interface.dart';
import 'core/interfaces/shared_repository_interface.dart';
import 'core/repositories/auth_repository.dart';
import 'core/repositories/shared_repositories.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_page.dart';

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
