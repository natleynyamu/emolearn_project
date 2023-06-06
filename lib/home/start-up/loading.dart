import 'dart:async';
import 'package:on_boarding/home/start-up/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() {
    return LoadingScreenState();
  }
}

class LoadingScreenState extends State<LoadingScreen> {

  final List<String> _statusMessages = ["Loading ...", "Almost there ...", "Done"];

  String _status = "Loading ...";
  int _position = 0;

  // function used to update the progress indicator after 1.5s
  void updateProgress() {
    Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      if (_position == 2) {
        timer.cancel();
      } else {
        setState(() {
          _position = _position + 1;
          _status = _statusMessages[_position];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_position < 2) {
      updateProgress();
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(62, 20, 82, 1.0),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Emolearn",
            style: TextStyle(color: Colors.white, fontSize: 40.0),
          ),
          const SizedBox(height: 48.0),
          Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: Container(
                height: 20,
                padding: const EdgeInsets.only(
                    left: 1.5, right: 1.5, top: 1, bottom: 1),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    // progress indicator 
                child: LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  animation: true,
                  lineHeight: 16.0,
                  animationDuration: 3000,
                  percent: 1.0,
                  barRadius: const Radius.circular(16),
                  progressColor: const Color.fromRGBO(62, 20, 82, 1.0),
                  backgroundColor: Colors.white,
                  onAnimationEnd: (() {
                    // After loading, the user is redirected to the onboarding page 
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const OnBoardingPage())));
                  }),
                ),
              )),
          const SizedBox(height: 8.0),
          Text(
            _status,
            style: const TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        ],
      )),
    );
  }
}
