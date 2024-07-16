import 'package:dio/dio.dart';
import 'package:espace_client/utils/CustomToast.dart';
import 'package:espace_client/widgets/LoginPage/Models/UserModel.dart';
import 'package:espace_client/widgets/LoginPage/Service/LoginService.dart';
import 'package:espace_client/widgets/LoginPage/core/Api/DioConsumer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:espace_client/Constants.dart' as constants;

class UserProvider extends ChangeNotifier {
  bool isTextFieldMailVisible = true;
  bool isTextFieldPasswordVisible = false;
  bool isTextFieldConfirmPasswordVisible = false;

  User _user = User(email: '', password: '', confirmPassword: '');
  // --------------------------------------
  final loginService = LoginService(api: DioConsumer(dio: Dio()));
  String _loginResult = '';
  bool _isLoading = false;

  TryLogin(email, password, apiKey, context) async {
    _isLoading = true;
    notifyListeners();

    final response = await loginService.Login(
        email: "mariem@gmail.com", password: "123456", apiKey: "123");
    print("eeeeeeeeeeeeeeee");

    _isLoading = false;
    notifyListeners();

    response.fold(
      (errMessage) {
        notifyListeners();
        print(errMessage);
        CustomFlushbar.showFlushbar(context, errMessage,
            backgroundColor: constants.ButtonColor);
      },
      (response) {
        print(response);
        notifyListeners();
      },
    );
  }

// ----------------------------------------
  User get user => _user;

  String get loginResult => _loginResult;
  bool get isLoading => _isLoading;

  void setMail(v) {
    _user.email = v;
    notifyListeners();
  }

  void setPassword(v) {
    _user.password = v;
    notifyListeners();
  }

  void setConfirmPassword(v) {
    _user.confirmPassword = v;
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
    return _user.password;
  }

  String get GetConfirmPassword {
    return _user.confirmPassword;
  }

  String get Getemail {
    return _user.email;
  }
}
