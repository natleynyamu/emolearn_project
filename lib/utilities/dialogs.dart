import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:on_boarding/utilities/notification_switch.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpDialogs {
  Future<void> dialogBox(
          String message, String imageUrl, BuildContext context) async =>
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(
                    0XFF3E1452,
                  ),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              backgroundColor: const Color.fromRGBO(235, 214, 245, 1.0),
              elevation: 1.0,
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Ink.image(
                              image: const AssetImage(
                                  'assets/images/window-close.png'),
                              width: 24,
                              height: 24,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'How to play',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0XFF3E1452),
                            fontSize: 24,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0XFF3E1452),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    imageUrl,
                    height: 300,
                  ),
                ],
              ),
            );
          });
}

class WrongAnswerDialogs {
  Future<void> dialogBox(
    String message,
    BuildContext context,
  ) async =>
      showDialog(
          context: context,
          builder: (BuildContext context) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pop();
            });
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(
                    0XFF3E1452,
                  ),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              backgroundColor: const Color.fromRGBO(235, 214, 245, 1.0),
              elevation: 1.0,
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/incorrect.png',
                      height: 50,
                      width: 166,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      'Oops!... wrong answer',
                      style: TextStyle(
                        color: Color(0XFF9B0404),
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Color(0XFF3E721D),
                    fontSize: 24,
                  ),
                ),
              ),
            );
          });
}

class CorrectAnswerDialogs {
  Future<void> dialogBox(String message, BuildContext context) async =>
      showDialog(
          context: context,
          builder: (BuildContext context) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pop();
            });
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(
                    0XFF3E1452,
                  ),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              backgroundColor: const Color.fromRGBO(235, 214, 245, 1.0),
              elevation: 1.0,
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/correct.png',
                      height: 50,
                      width: 166,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0XFF3E721D),
                    fontSize: 24,
                  ),
                ),
              ),
            );
          });
}

class UnansweredDialogs {
  Future<void> dialogBox(String message, BuildContext context) async =>
      showDialog(
          context: context,
          builder: (BuildContext context) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pop();
            });
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(
                    0XFF9B0404,
                  ),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              backgroundColor: const Color.fromRGBO(235, 214, 245, 1.0),
              elevation: 1.0,
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/alert.png',
                      height: 50,
                      width: 166,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0XFF9B0404),
                    fontSize: 24,
                  ),
                ),
              ),
            );
          });
}

class SettingsDialog {
//Link to privacy policy
  final Uri _url = Uri.parse(
      'https://docs.google.com/document/d/1PKbKpqLnXx61Bt-OPL15Q7dgB9uSVd__R3C5t1njIig/edit?usp=sharing');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> dialogBox(BuildContext context) async {
    await Hive.openBox("settingsBox");

    // ignore: use_build_context_synchronously
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Color(
                  0XFF3E1452,
                ),
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            backgroundColor: const Color.fromRGBO(235, 214, 245, 1.0),
            elevation: 1.0,
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Ink.image(
                            image: const AssetImage(
                                'assets/images/window-close.png'),
                            width: 24,
                            height: 24,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Settings',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0XFF3E1452),
                          fontSize: 32,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            content: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Send me reminders to learn",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromRGBO(62, 20, 82, 1.0)),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      NotificationSwitch()
                    ],
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: _launchUrl,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Privacy policy",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color.fromRGBO(62, 20, 82, 1.0)),
                              ),
                              SizedBox(width: 24.0),
                              Icon(
                                FontAwesomeIcons.angleRight,
                                color: Color.fromRGBO(5, 2, 7, 1),
                                size: 18.0,
                              ),
                            ],
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
