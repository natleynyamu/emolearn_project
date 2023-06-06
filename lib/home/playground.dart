import 'package:flutter/material.dart';
import 'package:on_boarding/game/category.dart';

// user can select category to play
class Playground extends StatelessWidget {
  const Playground({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Text("Hey buddy,",
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(62, 20, 82, 1.0))),
            Text("Let's play!",
                style: TextStyle(
                    fontSize: 40.0, color: Color.fromRGBO(62, 20, 82, 1.0)))
          ])
        ]),
        const SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/emoji.png',
              width: 88.0,
              height: 24.24,
            ),
          ],
        ),
        const SizedBox(
          height: 40.0,
        ),
        // category 1: fruits
        Stack(clipBehavior: Clip.none, children: [
          // For content and links with slight elevation on the sides
          Container(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
            constraints: const BoxConstraints.expand(
              height: 92.0,
            ),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(224, 82, 129, 1.0),
                borderRadius: BorderRadius.circular(24.0)),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FruitCategory()));
                },
                child: const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Fruits",
                      style: TextStyle(fontSize: 28.0, color: Colors.white),
                    ))),
          ),
          Positioned(
            right: 16.0,
            bottom: 65.0,
            child: Image.asset('assets/images/fruits.png',
                width: 140.0, height: 75.0),
          ),
        ]),
        const SizedBox(
          height: 64.0,
        ),
        // category 2: vegetables
        Stack(clipBehavior: Clip.none, children: [
          // For content and links with slight elevation on the sides
          Container(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
            constraints: const BoxConstraints.expand(
              height: 92.0,
            ),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(251, 123, 4, 1.0),
                borderRadius: BorderRadius.circular(24.0)),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VegetableCategory()));
                },
                child: const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Vegetables",
                      style: TextStyle(fontSize: 28.0, color: Colors.white),
                    ))),
          ),
          Positioned(
            right: 16.0,
            bottom: 65.0,
            child: Image.asset('assets/images/vegetables.png',
                width: 140.0, height: 75.0),
          ),
        ])
      ],
    );
  }
}
