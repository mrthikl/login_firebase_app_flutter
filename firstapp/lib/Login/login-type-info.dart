import 'dart:async';

import 'package:firstapp/Components/Button/button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

CarouselController buttonCarouselController = CarouselController();

class LoginTypeInfo extends StatefulWidget {
  static const routeName = '/login-type-info';

  @override
  State<LoginTypeInfo> createState() => _LoginTypeInfoState();
}

class _LoginTypeInfoState extends State<LoginTypeInfo> {
  //  Verifition Email
  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;

  String _code = '';

  late Timer _timer;
  int _start = 30;

  void resend() {
    setState(() {
      _isResendAgain = true;
    });

    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 30;
          _isResendAgain = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  verify() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = Duration(milliseconds: 4000);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        _isLoading = false;
        _isVerified = true;
      });
    });
  }

  //  Verifition Email //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        CarouselSlider(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              scrollPhysics: NeverScrollableScrollPhysics(),
              viewportFraction: 1,
              enableInfiniteScroll: false,
            ),
            items: [
              StepsTypeScreen(
                children: [
                  Container(
                      child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: LangSocial(),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: Row(
                                children: [
                                  StepsTypeBoxOn(),
                                  Gap(8),
                                  StepsTypeBoxOff(),
                                  Gap(8),
                                  StepsTypeBoxOff(),
                                  Gap(8),
                                  StepsTypeBoxOff(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      TextFieldTypeInfo(
                        Image: Image.asset('assets/img/User.png'),
                        hintText: 'Họ và Tên',
                      )
                    ],
                  )),
                  SubmitButton(
                      onPressed: () {
                        buttonCarouselController.nextPage();
                      },
                      TextVal: 'Tiếp theo')
                ],
              ),
              StepsTypeScreen(
                children: [
                  Container(
                      child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BackItemButton(),
                                LangSocial(),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: Row(
                                children: [
                                  StepsTypeBoxOn(),
                                  Gap(8),
                                  StepsTypeBoxOn(),
                                  Gap(8),
                                  StepsTypeBoxOff(),
                                  Gap(8),
                                  StepsTypeBoxOff(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      TextFieldTypeInfo(
                        Image: Image.asset('assets/img/Mail.png'),
                        hintText: 'Nhập email',
                      )
                    ],
                  )),
                  SubmitButton(
                      onPressed: () {
                        buttonCarouselController.nextPage();
                      },
                      TextVal: 'Tiếp theo')
                ],
              ),
              StepsTypeScreen(
                children: [
                  Container(
                      child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BackItemButton(),
                                LangSocial(),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 40),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          'Mã OTP xác nhận Email',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Container(
                                          width: 320,
                                          child: Text.rich(
                                              textAlign: TextAlign.center,
                                              TextSpan(
                                                  text:
                                                      'Vui lòng nhập mã xác nhận gồm 4 chữ số đã được gửi đến email',
                                                  style: TextStyle(
                                                    height: 1.8,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            ' nguye***na@gmail.com',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ))
                                                  ]))),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        child: VerificationCode(
                          textStyle: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                          itemSize: 80,
                          keyboardType: TextInputType.number,
                          underlineColor: Colors.pinkAccent,
                          length: 4,
                          cursorColor: Colors.black,
                          onCompleted: (value) {
                            setState(() {
                              _code = value;
                            });
                          },
                          onEditing: (bool value) {},
                        ),
                      ),
                    ],
                  )),
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {
                              if (_isResendAgain) return;
                              resend();
                            },
                            child: Text(
                              _isResendAgain
                                  ? 'Gửi lại mã xác nhận (${_start.toString()}s)'
                                  : 'Gửi lại mã xác nhận (30s)',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  foreground: Paint()
                                    ..shader = LinearGradient(
                                      colors: <Color>[
                                        Color.fromRGBO(245, 67, 81, 1),
                                        Color.fromRGBO(208, 0, 143, 1),
                                      ],
                                    ).createShader(
                                        Rect.fromLTWH(200, 50, 200, 100))),
                            ),
                          )),
                      Container(
                          width: 263,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color.fromRGBO(245, 67, 81, 1),
                                  Color.fromRGBO(208, 0, 143, 1),
                                ],
                              )),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: _code.length < 4
                                ? null
                                : () {
                                    verify();
                                  },
                            child: SizedBox(
                              child: _isLoading
                                  ? Container(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                        strokeWidth: 1,
                                        color: Colors.black,
                                      ),
                                    )
                                  : _isVerified
                                      ? Icon(Icons.check_circle,
                                          color: Colors.white)
                                      : Text('Xác nhận',
                                          style: TextStyle(
                                            backgroundColor: Colors.transparent,
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          )),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ])
      ],
    ));
  }
}

class BackItemButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          color: Colors.black,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () {
            buttonCarouselController.previousPage();
          },
          icon: Icon(Icons.arrow_back_ios, size: 28),
        ),
      ],
    );
  }
}

class TextFieldTypeInfo extends StatefulWidget {
  final Image, hintText, onChanged;
  dynamic erro;

  String? get erroText {
    erro;
  }

  TextFieldTypeInfo({this.Image, this.hintText, this.onChanged, this.erro});

  @override
  State<TextFieldTypeInfo> createState() => _TextFieldTypeInfoState();
}

class _TextFieldTypeInfoState extends State<TextFieldTypeInfo> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorWidth: 0.5,
      cursorColor: Colors.black,
      style: TextStyle(),
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.pinkAccent,
          ),
        ),
        contentPadding: EdgeInsets.only(top: 15),
        prefixIcon: widget.Image,
        hintText: widget.hintText,
      ),
    );
  }
}

class StepsTypeBoxOn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 4,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color.fromRGBO(245, 67, 81, 1),
            Color.fromRGBO(208, 0, 143, 1),
          ]),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}

class StepsTypeBoxOff extends StatelessWidget {
  const StepsTypeBoxOff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 4,
      decoration: BoxDecoration(
          color: Color.fromRGBO(15, 36, 71, 0.15),
          borderRadius: BorderRadius.circular(20)),
    );
    ;
  }
}

// class VerificationEmail extends StatefulWidget {
//
//
//   @override
//   State<VerificationEmail> createState() => _VerificationEmailState();
// }
//
// class _VerificationEmailState extends State<VerificationEmail> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }

class StepsTypeScreen extends StatelessWidget {
  dynamic children;

  StepsTypeScreen({this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 60, 20, 60),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: children));
  }
}
