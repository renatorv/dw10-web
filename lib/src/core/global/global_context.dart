// import 'package:flutter/cupertino.dart';

// class GlobalContext {
//   late final GlobalKey<NavigatorState> _navigatorKey;

// }

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../storage/storage.dart';

class GlobalContext {
  late final GlobalKey<NavigatorState> _navigatorKey;
  static GlobalContext? _instance;

  GlobalContext._();

  static GlobalContext get instance {
    _instance ??= GlobalContext._();
    return _instance!;
  }

  set navigator(GlobalKey<NavigatorState> key) => _navigatorKey = key;

  void loginExpire() {
    Modular.get<Storage>().clean();
    ScaffoldMessenger.of(_navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.only(top: 72),
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Login expirado',
          message: 'Login expirado, faça login novamente',
          contentType: ContentType.failure,
        ),
      ),
    );
    Modular.to.navigate('/login');
  }
}