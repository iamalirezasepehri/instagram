import 'package:flutter/material.dart';
import 'package:instagram/constants/constants.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/screens/main_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: "GB",
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: custompink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: TextStyle(
              fontFamily: "GB",
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: darkblue,
        image: DecorationImage(
          image: AssetImage("images/pattern.png"),
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Center(
              child: Container(
                width: 155,
                height: 77,
                child: Image(
                  image: AssetImage("images/Startlogo.png"),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              child: Column(
                children: [
                  Text(
                    "From",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Alireza Daneshvar",
                    style: TextStyle(
                      color: custompink,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void GetData() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }
}
