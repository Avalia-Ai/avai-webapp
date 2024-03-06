import 'package:flutter/widgets.dart';

class AuthModel extends ChangeNotifier {
  String _email = '';
  String _password = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String get email => _email;
  String get password => _password;

  void setEmail(String value) {
    print(value);
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    print(value);
    _password = value;
    notifyListeners();
  }
}
