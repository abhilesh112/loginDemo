import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final String? iconSrc;
  final Function? press;
  final Color? borderColor;
  const SocialIcon({
    Key? key,
    this.iconSrc,
    this.press,
    this.borderColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: borderColor!,
          ),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          iconSrc!,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
