import 'package:flutter/material.dart';

import 'widgets/AddToCart/Provider/Cart.dart';

import 'package:provider/provider.dart';

import 'widgets/AddToCart/views/MyHome.dart';

void main() {
  runApp(FirstApp());
}

class FirstApp extends StatelessWidget {
  const FirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return (CartModel());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        title: "Phone shop",
        home: MyHome(),
      ),
    );
  }
}
