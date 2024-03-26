import 'package:flutter/widgets.dart';

class AuthModel extends ChangeNotifier {
  String _email = '';
  String _password = '';
  String _username = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  void setEmail(String value) {
    emailController.text = _email;
    notifyListeners();
  }

  void setUsername(){
    emailController.text = _username;
    notifyListeners();
  }

  void setPassword(String value) {
    passwordController.text = _password;
    notifyListeners();
  }
}
