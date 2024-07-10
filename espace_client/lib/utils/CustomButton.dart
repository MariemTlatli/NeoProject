import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color; // Ajoutez le type Color ici
  final double myPadding;

  CustomButton(
      {required this.onPressed,
      required this.text,
      required this.color,
      required this.myPadding});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(myPadding),
        child: Text(text),
      ),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white, // Utilisez la couleur ici
        backgroundColor: color, // Utilisez la couleur ici
      ),
    );
  }
}
