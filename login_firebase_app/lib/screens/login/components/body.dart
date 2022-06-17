import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_firebase_app/components/check_account.dart';
import 'package:login_firebase_app/components/round_input_password.dart';
import 'package:login_firebase_app/components/rounded_button.dart';
import 'package:login_firebase_app/components/rounded_input_field.dart';
import 'package:login_firebase_app/contants.dart';
import 'package:login_firebase_app/screens/login/components/background.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.35,
          ),
          const SizedBox(
            height: 20,
          ),
          RoundedInputField(
              onChanged: (value) {},
              icon: Icon(Icons.person),
              hintText: "Email"),
          RoundedPassword(
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 10,
          ),
          RoundedButton(text: "Login".toUpperCase(), onPressed: () {}),
          const SizedBox(
            height: 20,
          ),
          AlreadyHaveAnAccountCheck(
            onTap: () {},
          )
        ],
      ),
    );
  }
}
