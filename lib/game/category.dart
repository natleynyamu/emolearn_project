import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:on_boarding/game/gamelevel.dart';

// user can select the level of difficulty to play from either the fruit or vegetable category
class FruitCategory extends StatelessWidget {
  const FruitCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
          Color.fromRGBO(245, 235, 250, 1.0),
          Color.fromRGBO(235, 214, 245, 1.0),
        ])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 32.0, bottom: 32.0),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            side: const BorderSide(
                                width: 1,
                                color: Color.fromRGBO(62, 20, 82, 1.0))),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 24.0),
                            child: Row(
                              children: const [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 2.0),
                                    child: Icon(
                                      FontAwesomeIcons.circleArrowLeft,
                                      color: Color.fromRGBO(62, 20, 82, 1.0),
                                    )),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  "Back",
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      color: Color.fromRGBO(62, 20, 82, 1.0)),
                                )
                              ],
                            )))
                  ]),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Text("Fruits",
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Color.fromRGBO(62, 20, 82, 1.0))),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Image.asset("assets/images/fruits_large.png",
                        width: 272, height: 143.52)
                  ]),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Text("Select Difficulty",
                      style: TextStyle(
                          fontSize: 28.0,
                          color: Color.fromRGBO(62, 20, 82, 1.0))),
                  const SizedBox(
                    height: 40.0,
                  ),
                  // Buttons to select the level of difficulty in fruits category
                  OutlinedButton(
                      onPressed: (() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const GameLevel(level: 1)));
                      }),
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          side: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(62, 20, 82, 1.0))),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Easy",
                                style: TextStyle(
                                    fontSize: 24.0,
                                    color: Color.fromRGBO(62, 20, 82, 1.0)),
                              )
                            ],
                          ))),
                  const SizedBox(
                    height: 24.0,
                  ),
                  OutlinedButton(
                      onPressed: (() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const GameLevel(level: 2)));
                      }),
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          side: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(62, 20, 82, 1.0))),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Medium",
                                style: TextStyle(
                                    fontSize: 24.0,
                                    color: Color.fromRGBO(62, 20, 82, 1.0)),
                              )
                            ],
                          ))),
                  const SizedBox(
                    height: 24.0,
                  ),
                  OutlinedButton(
                      onPressed: (() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const GameLevel(level: 3)));
                      }),
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          side: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(62, 20, 82, 1.0))),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Hard",
                                style: TextStyle(
                                    fontSize: 24.0,
                                    color: Color.fromRGBO(62, 20, 82, 1.0)),
                              )
                            ],
                          ))),
                ],
              ),
            ))));
  }
}

class VegetableCategory extends StatelessWidget {
  const VegetableCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
          Color.fromRGBO(245, 235, 250, 1.0),
          Color.fromRGBO(245, 235, 250, 1.0),
        ])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 32.0, bottom: 32.0),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            side: const BorderSide(
                                width: 1,
                                color: Color.fromRGBO(62, 20, 82, 1.0))),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 24.0),
                            child: Row(
                              children: const [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 2.0),
                                    child: Icon(
                                      FontAwesomeIcons.circleArrowLeft,
                                      color: Color.fromRGBO(62, 20, 82, 1.0),
                                    )),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  "Back",
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      color: Color.fromRGBO(62, 20, 82, 1.0)),
                                )
                              ],
                            )))
                  ]),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Text("Vegetables",
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Color.fromRGBO(62, 20, 82, 1.0))),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Image.asset("assets/images/vegetables_large.png",
                        width: 272, height: 143.52)
                  ]),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Text("Select Difficulty",
                      style: TextStyle(
                          fontSize: 28.0,
                          color: Color.fromRGBO(62, 20, 82, 1.0))),
                  const SizedBox(
                    height: 40.0,
                  ),
                  // Buttons to select the level of difficulty in vegetables category
                  OutlinedButton(
                      onPressed: (() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const GameLevel(level: 4)));
                      }),
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          side: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(62, 20, 82, 1.0))),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Easy",
                                style: TextStyle(
                                    fontSize: 24.0,
                                    color: Color.fromRGBO(62, 20, 82, 1.0)),
                              )
                            ],
                          ))),
                  const SizedBox(
                    height: 24.0,
                  ),
                  OutlinedButton(
                      onPressed: (() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const GameLevel(level: 5)));
                      }),
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          side: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(62, 20, 82, 1.0))),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Medium",
                                style: TextStyle(
                                    fontSize: 24.0,
                                    color: Color.fromRGBO(62, 20, 82, 1.0)),
                              )
                            ],
                          ))),
                  const SizedBox(
                    height: 24.0,
                  ),
                  OutlinedButton(
                      onPressed: (() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const GameLevel(level: 6)));
                      }),
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          side: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(62, 20, 82, 1.0))),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Hard",
                                style: TextStyle(
                                    fontSize: 24.0,
                                    color: Color.fromRGBO(62, 20, 82, 1.0)),
                              )
                            ],
                          ))),
                ],
              ),
            ))));
  }
}
