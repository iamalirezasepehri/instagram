import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram/screens/main_Screen.dart';

class SwitchAcountScreen extends StatelessWidget {
  const SwitchAcountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/shapes.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 250,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 2,
                        sigmaY: 2,
                      ),
                      child: Container(
                        width: 340,
                        height: 352,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.5),
                              Color.fromRGBO(255, 255, 255, 0.2),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 129,
                              height: 129,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/profile.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            Text(
                              "Alireza Daneshvar",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(
                              width: 129,
                              height: 46,
                              child: ElevatedButton(
                                style:
                                    Theme.of(context).elevatedButtonTheme.style,
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return MainScreen();
                                  }));
                                },
                                child: Text(
                                  "confirm",
                                ),
                              ),
                            ),
                            Text(
                              "switch account",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 132,
              bottom: 63,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account? /",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontFamily: "GB",
                  ),
                ),
                Text(
                  " Sign up",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
