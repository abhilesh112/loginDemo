import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  String centerText;
  VoidCallback actionButton;

  LoginButton({super.key, required this.centerText, required this.actionButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin:const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        primary:const Color.fromARGB(255, 189, 77, 114)
        ),
        onPressed:() => actionButton(),
        child: Text(centerText),
      ),
    );
  }
}
