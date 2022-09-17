import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.transparent),
      backgroundColor: Color(0xff002c7b),
      actions: <Widget>[
        Row(
          children: <Widget>[
            Image.asset(
              "assets/icons/account.png",
              color: Colors.white,
              height: 40,
              width: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 40,
              width: 2,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: const <Widget>[
                  CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage("assets/icons/IN.png")),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'india',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 110,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: Image.asset(
                    "assets/icons/qr.png",
                    color: Colors.white,
                    height: 24,
                    width: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: Image.asset(
                    "assets/icons/bell.png",
                    color: Colors.white,
                    height: 24,
                    width: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 13,
                  ),
                  child: Image.asset(
                    "assets/icons/FAQ.png",
                    color: Colors.white,
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
            ),
          ],
        )
      ]);
}
