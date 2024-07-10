import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String email = "";
  String password = "";
  String confirmPassword = "";
  bool isTextFieldMailVisible = true;
  bool isTextFieldPasswordVisible = false;
  bool isTextFieldConfirmPasswordVisible = false;

  String get Getemail {
    return email;
  }

  void setMail(v) {
    email = v;
    notifyListeners();
  }

  void setPassword(v) {
    password = v;
    notifyListeners();
  }

  void setConfirmPassword(v) {
    confirmPassword = v;
    notifyListeners();
  }

  void setVisibleMail(v) {
    isTextFieldMailVisible = v;
    notifyListeners();
  }

  void setVisiblePass(v) {
    isTextFieldPasswordVisible = v;
    notifyListeners();
  }

  void setVisibleConfirmPass(v) {
    isTextFieldConfirmPasswordVisible = v;
    notifyListeners();
  }

  String get Getpassword {
    return password;
  }
}
