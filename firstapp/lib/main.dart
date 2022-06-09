// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:firstapp/Login/login-type-info.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

// Screen
import 'Login/login-social.dart';
import 'Login/login-password.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Bitback', home:LoginSocial(), routes: {
      LoginSocial.routeName: (ctx) => LoginSocial(),
      LoginPassword.routeName: (ctx) => LoginPassword(),
      LoginTypeInfo.routeName: (ctx) => LoginTypeInfo(),
    });
  }
}

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  int loadingPercent = 0;

  Future<Widget> loadFromFuture() async {
    // <fetch data from server. ex. login>
    while (this.loadingPercent < 100) {
      this.setState(() {
        this.loadingPercent++;
        print("Percent: " + this.loadingPercent.toString());
      });
      // Delay 100 millisecond.
      await Future.delayed(const Duration(milliseconds: 100));
    }
    // Show Main Screen (After Splash Screen)
    return Future.value(LoginSocial());
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        navigateAfterFuture: loadFromFuture(),
        useLoader: false,
        photoSize: 80,
        image: Image.asset('assets/img/BitbackLogo.png'),
        loadingText: Text('Bitback',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            )));
  }
}
