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
              borderColor: Color(0xffe15d5e),
              iconSrc: "assets/icons/google.png",
              press: () {},
            ),
            SocialIcon(
              borderColor: Color(0xff2463bb),
              iconSrc: "assets/icons/facebook.png",
              press: () {},
            ),
            SocialIcon(
              borderColor: Color(0xff2463bb),
              iconSrc: "assets/icons/linkedin.png",
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}
