import 'package:flutter/material.dart';
import 'package:instagram/constants/constants.dart';
import 'package:instagram/screens/switch_acount_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    f1.addListener(() {
      setState(() {});
    });
    f2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0XFF323A99),
            Color(0XFFF98BFC),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            GetUpper(),
            GetBottom(context),
          ],
        ),
      ),
    );
  }

  Widget GetUpper() {
    return Positioned(
      top: 50,
      bottom: 0,
      right: 0,
      left: 0,
      child: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage("images/rocket.png"),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget GetBottom(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: darkblue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: double.infinity),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign in to ",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Image(
                      image: AssetImage("images/minilogo.png"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    focusNode: f1,
                    style: Theme.of(context).textTheme.headline1,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "GM",
                        color: f1.hasFocus ? custompink : Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: custompink,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    focusNode: f2,
                    obscureText: true,
                    style: Theme.of(context).textTheme.headline1,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "GM",
                        color: f2.hasFocus ? custompink : Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: custompink,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return SwitchAcountScreen();
                    }));
                  },
                  child: Text("Sign in"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? / ",
                      style: TextStyle(
                        fontFamily: "GB",
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Sign up",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    f1.dispose();
    f2.dispose();
  }
}
