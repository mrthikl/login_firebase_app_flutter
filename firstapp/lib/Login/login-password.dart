import 'package:firstapp/Components/Button/button.dart';
import 'package:firstapp/Login/login-type-info.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './login-social.dart';

class LoginPassword extends StatelessWidget {
  static const routeName = '/login-social';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
      child: Column(
        children: [
          Center(
            child: LangSocial(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.fromLTRB(24, 44, 24, 0),
              child: Column(
                children: [
                  Text('Xin chào, Nguyễn Văn A!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(24, 44, 24, 0),
              child: Column(
                children: [
                  Container(
                    child: textFieldForm(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.only(left: 0),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Quên mật khẩu?',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                foreground: Paint()
                                  ..shader = LinearGradient(
                                    colors: <Color>[
                                      Color.fromRGBO(245, 67, 81, 1),
                                      Color.fromRGBO(208, 0, 143, 1),
                                    ],
                                  ).createShader(
                                      Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))),
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  Colors.transparent)),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(LoginSocial.routeName);
                          },
                          child: Text(
                            'Thoát tài khoản',
                            style: TextStyle(
                              color: Color.fromRGBO(9, 21, 41, 0.6),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: SubmitButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(LoginTypeInfo.routeName);
                    }
                    ,TextVal: 'Dang nhap'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 32),
                    child: LoginWithId(),
                  )
                ],
              ))
        ],
      ),
    ));
  }
}

class TextFieldOTPNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      height: 40,
      width: 24,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: TextStyle(
          fontSize: 37,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        cursorWidth: 0,
        maxLines: 1,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        obscureText: true,
        decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.pinkAccent,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Container(
              margin: EdgeInsets.only(left: 1),
              child: Icon(
                FontAwesomeIcons.solidCircle,
                size: 12,
                color: Color.fromRGBO(15, 36, 71, 0.3),
              ),
            )),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}

class textFieldForm extends StatefulWidget {
  @override
  State<textFieldForm> createState() => _textFieldFormState();
}

class _textFieldFormState extends State<textFieldForm> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                'Mật khẩu',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )),
        Focus(
            child: Container(
                child: Align(
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFieldOTPNumber(),
                  Gap(39),
                  TextFieldOTPNumber(),
                  Gap(39),
                  TextFieldOTPNumber(),
                  Gap(39),
                  TextFieldOTPNumber(),
                  Gap(39),
                  TextFieldOTPNumber(),
                  Gap(39),
                  TextFieldOTPNumber(),
                ],
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color.fromRGBO(245, 67, 81, 1),
                      Color.fromRGBO(208, 0, 143, 1),
                    ])),
                  )),
            ],
          ),
        )))
      ],
    );
  }
}
