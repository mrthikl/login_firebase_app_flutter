import 'package:flutter/material.dart';
import 'package:login_firebase_app/screens/login/components/body.dart';

class LoginScsreen extends StatelessWidget {
  const LoginScsreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Body(),
    );
  }
}
