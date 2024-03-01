import 'package:avalia_ai/view/auth_page.dart';
import 'package:avalia_ai/view/homepage.dart';
import 'package:avalia_ai/view/initial_page.dart';
import 'package:avalia_ai/view/professors_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class FluroRoute {
  static final FluroRouter router = FluroRouter();

  static final Handler initialPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        const InitialPage(),
  );

  static final Handler registerHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        AuthPage(
      register: true,
    ),
  );

  static final Handler loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        AuthPage(
      register: false,
    ),
  );

  static final Handler homepageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const HomePage());

  static final Handler professorsPageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          ProfessorsPage(subjectId: params['subjectId'][0]));

  static void setupRouter() {
    router.define(
      '/',
      handler: initialPageHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/auth/register',
      handler: registerHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/auth/login',
      handler: loginHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/home',
      handler: homepageHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/professors/:subjectId',
      handler: professorsPageHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
