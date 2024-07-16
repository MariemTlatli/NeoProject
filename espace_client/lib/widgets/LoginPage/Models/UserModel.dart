import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class User {
  String email;
  String password;
  String confirmPassword;

  User({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}
