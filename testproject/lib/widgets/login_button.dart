import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  String centerText;
  VoidCallback actionButton;

  LoginButton(
      {super.key, required this.centerText, required this.actionButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            primary: const Color(0xffed5584)),
        onPressed: () => actionButton(),
        child: Text(centerText),
      ),
    );
  }
}
