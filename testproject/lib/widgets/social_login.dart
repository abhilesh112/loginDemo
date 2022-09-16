import 'package:flutter/material.dart';
import 'package:testproject/widgets/social_Icon.dart';

import 'divider.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocialIcon(
               borderColor:const Color.fromARGB(255, 100, 71, 16),
              iconSrc: "assets/icons/google.png",
              press: () {},
            ),
            SocialIcon(
               borderColor:const Color.fromARGB(255, 12, 49, 80),
              iconSrc: "assets/icons/facebook.png",
              press: () {},
            ),
            SocialIcon(
              borderColor:const Color.fromARGB(255, 12, 49, 80),
              iconSrc: "assets/icons/linkedin.png",
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}
