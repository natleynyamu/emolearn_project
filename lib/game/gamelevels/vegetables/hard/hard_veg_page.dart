import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../utilities/dialogs.dart';
import 'hard_veg_qn.dart';
import '../../../../main.dart';

class HardVegPage extends StatefulWidget {
  const HardVegPage({super.key});
  // final HardQuestion hardList;

  @override
  State<HardVegPage> createState() => _HardVegPageState();
}

class _HardVegPageState extends State<HardVegPage> {
  // Create a text controller  to retrieve the value
  final _textController = TextEditingController();
  final HelpDialogs hardDialog = HelpDialogs();
  final formKey = GlobalKey<FormState>();
  final WrongAnswerDialogs wrongAnswerDialog = WrongAnswerDialogs();
  final CorrectAnswerDialogs correctAnswerDialogs = CorrectAnswerDialogs();
  int index = 0;
  int hardScore = 0;
  late bool isLastHardQuestion = false;

  //Creating a variable to reference to the box
  late final Box sampleBox;

  // late int questionNo;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  // set up and open a Hive box named "userscore"
  Future<void> _openBox() async {
    await Hive.initFlutter();
    sampleBox = await Hive.openBox('userscore');
  }

  // close the Hive box
  @override
  void dispose() {
    sampleBox.close();
    super.dispose();
  }

// The updateScore method updates the user's score in a Hive box called userscore.
// 1. The method first checks if the userscore box is already open.
// If not, it calls the _openBox() method to open it.

// 2. If the box is empty, meaning there is no score stored in it yet,
// the method puts the user's current score in the box using the key score.

// 3. If the box already has a score stored in it,
// the method retrieves the stored score,
// adds the user's current score to it,
// and puts the updated score back in the box.

// 4. If any errors occur while updating the score,
// they are caught and printed to the console.
  Future<void> updateScore(int num) async {
    try {
      if (!Hive.isBoxOpen('userscore')) {
        await _openBox();
      }

      if (sampleBox.isEmpty) {
        sampleBox.put('score', num);
      } else {
        int storedScore = sampleBox.get('score', defaultValue: 0);
        storedScore += num;
        sampleBox.put('score', storedScore);
      }
    } catch (e) {
      // Handle any errors that occur while updating the score
      if (kDebugMode) {
        print('Error updating score: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 0.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Emolearn",
                style: TextStyle(
                  fontSize: 28,
                  color: Color.fromARGB(255, 60, 5, 70),
                )),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      hardDialog.dialogBox(
                          'HARD - Write your answer accurately matches the word formed by combining the emojis.',
                          'assets/images/hard_help.png',
                          context);
                    },
                    child: Ink.image(
                      image: const AssetImage('assets/images/info_icon.png'),
                      width: 38,
                      height: 24,
                    )),
                const SizedBox(
                  width: 8,
                ),
                // Cancel button
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Ink.image(
                      image: const AssetImage('assets/images/close_icon.png'),
                      width: 42,
                      height: 28,
                    )),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(color: const Color.fromRGBO(140, 214, 92, 1.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
            child: Column(children: [
              if (index <= hardList.length - 1)
                Text(
                  "Question ${index + 1} of ${hardList.length.toString()}",
                  style: const TextStyle(
                      fontSize: 24, color: Color.fromARGB(255, 60, 5, 70)),
                ),
              Text(
                hardList[index].question,
                style: const TextStyle(
                    fontSize: 24, color: Color.fromARGB(255, 60, 5, 70)),
              ),
              Image.asset(
                hardList[index].imageUrl,
                width: 250.0,
                height: 250.0,
              ),
            ]),
          ),
        ),
        const SizedBox(
          height: 48.0,
        ),
        Form(
          key: formKey,
          child: Column(
            children: [
              // The user will type something here
              TextFormField(
                controller: _textController,
                cursorColor: const Color(0XFF8CD65C),
                // selectionWidthStyle: BoxWidthStyle.max,
                decoration: InputDecoration(
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 60, 5, 70)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 60, 5, 70))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: 'Type answer here...',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 60, 5, 70), fontSize: 20.0),
                  fillColor: const Color(0xFFFFFFFF),
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill this field';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 48.0,
              ),
              hardNextQuestion(),
            ],
          ),
        )
      ]),
    );
  }

  // Function to determine whether to move to the next question
  //or to end the quiz deepending on whether the current
  // question is the last one or not.
  hardNextQuestion() {
    bool isLastHardQuestion = false;
    if (index == hardList.length - 1) {
      isLastHardQuestion = true;
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          backgroundColor: const Color.fromRGBO(140, 214, 92, 1.0),
        ),
        onPressed: () async {
          final validated = formKey.currentState!.validate();
          if (!validated) return;
          if (isLastHardQuestion) {
            //display score
            setState(() {
              checkHardAnswer();
            });
            await Future.delayed(const Duration(seconds: 3));

            // ignore: use_build_context_synchronously
            showDialog(context: context, builder: (_) => showHardScoreDialog());

            // Calling the updateScore method
            //to update the user's score in a Hive box
            updateScore(hardScore);
          } else {
            //next question
            setState(() {
              checkHardAnswer();
              _textController.clear();

              index++;
            });
          }
        },
        child: Text(
          isLastHardQuestion ? "Finish" : "Submit",
        ),
      ),
    );
  }
  // Function that checks if the player got a question right,
  // if so, informs the player that they were correct
  // else a user in informed that they were wrong
  //and is shown what the right answer was supposed to be

  checkHardAnswer() {
    String answer = _textController.text.trim();
    if (answer.toLowerCase() == hardList[index].answer) {
      hardScore++;
      correctAnswerDialogs.dialogBox('You are correct', context);
    } else {
      wrongAnswerDialog.dialogBox(
          'The correct answer is: ${hardList[index].answer}', context);
    }
  }

  // Custom dialog which shows the score
  // of the player in a quiz with buttons
  // to replay the game of go to the playground

  showHardScoreDialog() {
    return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          side: BorderSide(
            color: Color(
              0XFF3E1452,
            ),
            width: 2.0,
          ),
        ),
        backgroundColor: const Color.fromRGBO(235, 214, 245, 1.0),
        elevation: 1.0,
        title: Center(
          child: Column(children: [
            Image.asset(
              "assets/images/star_emoji.png",
              height: 50,
              width: 50,
            ),
            const SizedBox(
              height: 15,
            ),
            Column(children: [
              const Text(" Total Score ",
                  style: TextStyle(
                    fontSize: 24,
                  )),
              Text("$hardScore / ${hardList.length.toString()}",
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold)),
            ]),
            const SizedBox(
              height: 10.0,
            ),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(220, 32),
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                    backgroundColor: const Color.fromRGBO(140, 214, 92, 1.0),
                  ),
                  child: const Text("Restart Quiz",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      index = 0;
                      hardScore = 0;

                      _textController.clear();
                    });
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(220, 32),
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                    backgroundColor: const Color.fromARGB(255, 60, 5, 70),
                  ),
                  child: const Text("Playground",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const MyHomePage())));
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ]),
        ));
  }
}
