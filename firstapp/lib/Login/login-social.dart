import 'package:flutter/material.dart';
import '../Components/Button/button.dart';
import './login-password.dart';

class LoginSocial extends StatelessWidget {
  static const routeName = '/login-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LangSocial(),
            Image.asset('assets/img/BitbackLogo.png'),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 32),
                      child: Text('Đăng nhập với',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        loginButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(LoginPassword.routeName);
                          },
                          icon: Image.asset('assets/img/appleLogo.png'),
                          backgroundColor: Colors.black,
                        ),
                        loginButton(
                          onPressed: () {},
                          icon: Image.asset('assets/img/gmailLogo.png'),
                          backgroundColor: Colors.white,
                        ),
                        loginButton(
                          onPressed: () {},
                          icon: Image.asset('assets/img/facebookLogo.png'),
                          backgroundColor: Color.fromRGBO(24, 119, 242, 1),
                        ),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 50),
                        child: TextButton(
                            onPressed: () {},
                            child: Text('Bỏ qua',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(9, 21, 41, 0.6),
                                  backgroundColor: Colors.transparent,
                                  fontWeight: FontWeight.w700,
                                ))))
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
