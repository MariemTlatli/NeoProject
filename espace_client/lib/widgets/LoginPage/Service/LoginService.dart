import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:espace_client/utils/CustomToast.dart';
import 'package:espace_client/widgets/LoginPage/core/Api/DioConsumer.dart';
import 'package:espace_client/widgets/LoginPage/core/Api/EndPoint.dart';
import 'package:espace_client/widgets/LoginPage/core/Errors/exceptions.dart';
import 'package:flutter/material.dart';

class LoginService {
  final DioConsumer api;
  LoginService({required this.api});

  MailExist({
    required String email,
  }) async {
    try {
      final response = await api.post(
        EndPoint.loginEndPoint,
        isFromData: true,
        data: {
          "email": email,
        },
      );
      print(response);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<Either<String, String>> Login({
    required String email,
    required String password,
    required String apiKey,
  }) async {
    try {
      final response = await api.post(
        EndPoint.loginEndPoint,
        isFromData: false,
        data: {
          "email": email,
          "password": password,
          "ApiKey": apiKey,
        },
      );
      print("------------------");
      print(response);
      print("------------------");
      return Right("right");
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
