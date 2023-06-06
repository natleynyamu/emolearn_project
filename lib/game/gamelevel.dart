import 'package:flutter/material.dart';
import 'package:on_boarding/game/gamelevels/vegetables/easy/easy_veg_page.dart';
import 'package:on_boarding/game/gamelevels/vegetables/hard/hard_veg_page.dart';
import 'package:on_boarding/game/gamelevels/vegetables/medium/medium_veg_page.dart';
import 'gamelevels/fruits/medium/medium_page.dart';
import 'gamelevels/fruits/easy/easy_page.dart';
import 'gamelevels/fruits/hard/hard_page.dart';

class GameLevel extends StatelessWidget {
  const GameLevel({super.key, required this.level});

  final int level;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: RadialGradient(colors: [
        Color.fromRGBO(245, 235, 250, 1.0),
        Color.fromRGBO(235, 214, 245, 1.0),
      ])),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(245, 235, 250, 1.0),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 8.0, bottom: 32.0),
          child: getGameLevel(level),
        )),
      ),
    );
  }

  getGameLevel(int no) {
    if (no == 1) {
      return const EasyPage();
    } else if (no == 2) {
      return const MediumPage();
    } else if (no == 3) {
      return const HardPage();
    } else if (no == 4) {
      return const EasyVegPage();
    } else if (no == 5) {
      return const MediumVegPage();
    } else if (no == 6) {
      return const HardVegPage();
    }
  }
}
