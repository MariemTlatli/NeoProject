import 'package:espace_client/widgets/MyContainer/Views/MyContainerView.dart';
import 'package:espace_client/widgets/LoginPage/Views/NewLoginScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyConatinerView(),
    );
  }
}
