import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class loginButton extends StatelessWidget {
  final icon, backgroundColor, onPressed;

  loginButton({this.icon, this.backgroundColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(61, 0, 39, 0.06),
          spreadRadius: 8,
          blurRadius: 24,
          offset: Offset(0, 3),
        )
      ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: backgroundColor,
            side: BorderSide(color: Colors.transparent)),
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}

class LangSocial extends StatefulWidget {
  const LangSocial({Key? key}) : super(key: key);

  @override
  State<LangSocial> createState() => _LangSocialState();
}

class _LangSocialState extends State<LangSocial> {
  bool _isClicked = true;

  void clicked() {
    setState(() {
      _isClicked = !_isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () => clicked(),
              child: Text(
                'VN',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: _isClicked ? FontWeight.w700 : FontWeight.w400,
                  color: _isClicked
                      ? Colors.pinkAccent
                      : Color.fromRGBO(9, 21, 41, 0.6),
                  // foreground: Paint()..shader = LinearGradient(
                  //   colors: <Color>[
                  //     Color.fromRGBO(245, 67, 81, 1),
                  //     Color.fromRGBO(208, 0, 143, 1),
                  //   ],
                  // ).createShader(Rect.fromLTRB(20, 30, 10, 0))
                ),
              )),
        ),
        Gap(4),
        SizedBox(
          width: 1,
          height: 14,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(9, 21, 41, 0.6),
            ),
          ),
        ),
        Gap(4),
        SizedBox(
            width: 34,
            height: 24,
            child: TextButton(
                style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () => clicked(),
                child: Text(
                  'ENG',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: _isClicked ? FontWeight.w400 : FontWeight.w700,
                    color: _isClicked
                        ? Color.fromRGBO(9, 21, 41, 0.6)
                        : Colors.pinkAccent,
                  ),
                )))
      ],
    );
  }
}

class SubmitButton extends StatelessWidget {
  final onPressed, TextVal;
  SubmitButton({this.onPressed,this.TextVal});
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: EdgeInsets.zero,
              side: BorderSide(
                color: Colors.transparent,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))),
          onPressed: onPressed,
          child: Text(TextVal,
              style: TextStyle(
                backgroundColor: Colors.transparent,
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              )),
        ),
      ),
    );
  }
}

// class SubmitButton extends StatelessWidget {
//   final TextVal, onPressed;
//
//   SubmitButton({this.TextVal, this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.zero,
//             side: BorderSide(
//               color: Colors.transparent,
//             ),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
//         onPressed: () {},
//         child: Container(
//             width: 263,
//             height: 48,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(4),
//                 gradient: LinearGradient(
//                   colors: <Color>[
//                     Color.fromRGBO(245, 67, 81, 1),
//                     Color.fromRGBO(208, 0, 143, 1),
//                   ],
//                 )),
//             child: SizedBox(
//                 width: double.infinity,
//                 height: double.infinity,
//                 child: TextButton(
//                   style: TextButton.styleFrom(
//                     padding: EdgeInsets.zero,
//                     primary: Colors.green,
//                     shadowColor: Colors.transparent,
//                   ),
//                   onPressed: onPressed,
//                   child: Text(TextVal,
//                       style: TextStyle(
//                         backgroundColor: Colors.transparent,
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                       )),
//                 ))));
//   }
// }

class LoginWithId extends StatefulWidget {
  const LoginWithId({Key? key}) : super(key: key);

  @override
  State<LoginWithId> createState() => _LoginWithIdState();
}

class _LoginWithIdState extends State<LoginWithId> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.transparent, shadowColor: Colors.transparent),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(4))),
                  builder: (context) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 64,
                            height: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(15, 36, 71, 0.15),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Gap(28),
                          Image.asset(
                            'assets/img/loginfaceid-icon.png',
                            width: 96,
                            height: 96,
                          ),
                          Gap(28),
                          Text('Tính năng Face ID chưa được kích hoạt',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                          Gap(10),
                          Text('Kích hoạt sau trong phần cài đặt',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                          Gap(65),
                          SubmitButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              TextVal: 'OK')
                        ],
                      ),
                    );
                  });
            },
            child: Image.asset('assets/img/loginfaceid.png'),
          ),
        );
      },
    );
  }
}
