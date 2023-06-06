import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class WordGame extends StatefulWidget {
  const WordGame({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WordGameState createState() => _WordGameState();
}

class _WordGameState extends State<WordGame> {
  final List<String> words = ['grapes', 'orange', 'pear'];
  String? currentWord;
  String? missingLetter;
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    generateWord();
  }

  void generateWord() {
    // randomly select a word from the list
    currentWord = words[0];
    // randomly choose a letter to be missing
    int missingIndex = Random().nextInt(currentWord!.length);
    missingLetter = currentWord![missingIndex];
    currentWord = currentWord!.replaceFirst(missingLetter!, '◻');
  }

  void checkGuess() {
    String guess = textController.text.toLowerCase();
    if (guess == missingLetter) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You guessed it right!'),
        duration: Duration(seconds: 1),
      ));
      generateWord();
      textController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Incorrect guess! Try again.'),
        duration: Duration(seconds: 1),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    TextEditingController? _textController;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentWord!,
          style: const TextStyle(
              fontSize: 24, color: Color.fromARGB(255, 60, 5, 70)),
        ),
        const SizedBox(
          height: 16.0,
        ),
        TextField(
          maxLength: 1,
          selectionWidthStyle: BoxWidthStyle.max,
          cursorColor: Colors.green,
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: Color.fromARGB(255, 60, 5, 70)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Color.fromARGB(255, 60, 5, 70)),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
            labelText: 'Enter the missing letter',
            labelStyle: const TextStyle(
                color: Color.fromARGB(255, 60, 5, 70),
                fontSize: 20.0),
          ),
          controller: _textController,
        ),
      ],
    );
  }
}
