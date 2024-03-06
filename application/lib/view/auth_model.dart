import 'package:flutter/widgets.dart';

class AuthModel extends ChangeNotifier {
  String _email = '';
  String _password = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void setEmail(String value) {
    emailController.text = _email;
    notifyListeners();
  }

  void setPassword(String value) {
    passwordController.text = _password;
    notifyListeners();
  }
}
