import 'package:flutter/material.dart';
import 'package:espace_client/Constants.dart' as constants;

class MyHeader extends StatelessWidget {
  final String text;

  MyHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(constants.NetworkImageHeader),
        ),
        Text(text),
      ],
    );
  }
}