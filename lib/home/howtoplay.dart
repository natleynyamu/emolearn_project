import 'package:flutter/material.dart';

class HowToPlay extends StatelessWidget {
  const HowToPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text("How to Play:",
          style: TextStyle(
              fontSize: 40.0, color: Color.fromRGBO(62, 20, 82, 1.0))),
      const SizedBox(
        height: 24.0,
      ),
      const Text("Choose any category you wish to play from the playground",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0, color: Color.fromRGBO(62, 20, 82, 1.0))),
      const SizedBox(
        height: 24.0,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset("assets/images/howto1.png", width: 197.0, height: 196.1)
      ]),
      const SizedBox(
        height: 24.0,
      ),
      const Text("Choose the level of difficulty you wish to play",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0, color: Color.fromRGBO(62, 20, 82, 1.0))),
      const SizedBox(
        height: 24.0,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset("assets/images/howto2.png", width: 197.0, height: 196.1)
      ]),
    ]);
  }
}
