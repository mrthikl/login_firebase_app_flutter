import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_firebase_app/components/rounded_button.dart';
import 'package:login_firebase_app/contants.dart';
import 'package:login_firebase_app/screens/login/login_screen.dart';
import 'package:login_firebase_app/screens/welcome/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Welcome to App".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        SvgPicture.asset(
          "assets/icons/chat.svg",
          height: size.height * 0.45,
        ),
        SizedBox(
          height: 40,
        ),
        RoundedButton(
          text: "Login".toUpperCase(),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScsreen()));
          },
        ),
        SizedBox(
          height: 20,
        ),
        RoundedButton(
          text: "Login".toUpperCase(),
          onPressed: () {},
          color: kPrimaryLightColor,
          textColor: Colors.black,
        ),
      ],
    ));
  }
}
