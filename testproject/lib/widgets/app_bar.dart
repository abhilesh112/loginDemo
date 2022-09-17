import 'package:flutter/material.dart';

Widget _appBar() {
    return  AppBar(
      backgroundColor: Colors.deepPurple,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 124),
          child: Row(
            children: <Widget>[
              Image.asset(
                "assets/outline_account_circle.png",
                color: Colors.white,
                height: 40,
                width: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Your Location',
                      style: TextStyle(fontSize: 10),
                    ),
                    Row(children: <Widget>[
                      Text(
                        'Noida',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 13),
              child: Image.asset(
                "assets/outline_qrscan.png",
                color: Colors.white,
                height: 24,
                width: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 13),
              child: Image.asset(
                "assets/notifications.png",
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
                "assets/outline_help.png",
                color: Colors.white,
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
      ],
      elevation: 0,
    );
  }
