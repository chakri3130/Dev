import 'package:flutter/foundation.dart';
import 'package:learnflutter/AuthService/authService.dart';
import '../Constants/constants.dart';

// ignore: camel_case_types
class login_provider extends ChangeNotifier {
  String? _email;
  String? _password;

  String? get email => _email;
  String? get password => _password;
  String? get Email_regEx => r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  String? get Password_regEx => r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';

  void validateEmail(String? email) {
    _email = email;
    notifyListeners();
  }

  void validatePassword(String? password) {
    _password = password;
    notifyListeners();
  }

  // verifies email and password and throws exception if not valid

  bool isEmailValid(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    } else {
      final emailRegExp = RegExp(Email_regEx!);
      if (!emailRegExp.hasMatch(email)) {
        return false;
      } else {
        return true;
      }
    }
  }

  bool isPasswordValid(String? password) {
    if (password == null || password.isEmpty) {
      return false;
    } else {
      final passwordRegExp = RegExp(Password_regEx!);
      if (!passwordRegExp.hasMatch(password)) {
        return false;
      } else {
        return true;
      }
    }
  }

  login(String email, String password) {
    if (isEmailValid(email) && isPasswordValid(password)) {
      print('Login Successful');
      print(Constants.login);
      var response = ApiService().fetchData(Constants.login, {
        'email': email,
        'password': password,
      });
      print("completed,$response");
    } else {
      throw Exception('Invalid Email or Password');
    }
  }
}
