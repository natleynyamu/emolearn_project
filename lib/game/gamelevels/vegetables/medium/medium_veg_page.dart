import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:on_boarding/main.dart';
import '../../../../utilities/dialogs.dart';
import 'medium_veg_qn.dart';

class MediumVegPage extends StatefulWidget {
  const MediumVegPage({super.key});

  @override
  State<MediumVegPage> createState() => _MediumVegPageState();
}

class _MediumVegPageState extends State<MediumVegPage> {
  final HelpDialogs mediumDialog = HelpDialogs();
  final WrongAnswerDialogs wrongAnswerDialog = WrongAnswerDialogs();
  final CorrectAnswerDialogs correctAnswerDialogs = CorrectAnswerDialogs();
  final UnansweredDialogs unansweredDialogs = UnansweredDialogs();
  List<MediumQuestion> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int mediumscore = 0;
  Answer? selectedAnswer;
  int scoreIfCorrect = 0;

  int getStoredScore = 0;

  //Creating a variable to reference to the box
  late final Box sampleBox;

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
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 24.0),
      child: Column(
        children: [
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
                        mediumDialog.dialogBox(
                            'MEDIUM - Choose the correct word that accurately matches the word formed by combining the emojis from the list below.',
                            'assets/images/medium_help.png',
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
            height: 24.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(24.0),
              border:
                  Border.all(color: const Color.fromRGBO(140, 214, 92, 1.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(children: [
                Text(
                  "Question ${currentQuestionIndex + 1} of ${questionList.length.toString()}",
                  style: const TextStyle(
                      fontSize: 24, color: Color.fromARGB(255, 60, 5, 70)),
                ),
                Text(
                  questionList[currentQuestionIndex].question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 24, color: Color.fromARGB(255, 60, 5, 70)),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  questionList[currentQuestionIndex].imageUrl,
                  width: 250.0,
                  height: 250.0,
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          _answerList(),
          const SizedBox(
            height: 20.0,
          ),
          _nextQuestion(),
        ],
      ),
    );
  }

  // A function that creates a vertical layout widget.
  // It displays a list of answer buttons generated by the _answerButton method
  // based on the answersList of the current question in the questionList list.

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  // The schema of answer choices
  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 34,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              textStyle:
                  const TextStyle(fontSize: 20.0, fontFamily: 'Exo Space'),
              shape: const StadiumBorder(),
              backgroundColor: isSelected
                  ? const Color(0xFFC384E1)
                  : const Color.fromRGBO(245, 235, 250, 1.0),
              side: const BorderSide(width: 1, color: Color(0xFF52143F)),
            ),
            onPressed: () {
              if (selectedAnswer == null) {
                if (answer.isCorrect) {
                  mediumscore++;
                }
                setState(() {
                  selectedAnswer = answer;
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 30,
                    color: const Color(0XFF5D1E7B),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(answer.answerText[0],
                          // textAlign: TextAlign.center,
                          // answer.answerText,
                          style: const TextStyle(
                            color: Color(0XFFFFFFFF),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(answer.answerText.substring(1),
                      style: const TextStyle(
                        color: Color(0XFF5D1E7B),
                      )),
                ],
              ),
            )));
  }

// Function to determine whether to move to the next question
//or to end the quiz deepending on whether the current
// question is the last one or not.
  _nextQuestion() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          backgroundColor: const Color.fromRGBO(140, 214, 92, 1.0),
        ),
        onPressed: () async {
          // Making sure that a player is not skipping a question
          if (selectedAnswer != null) {
            if (isLastQuestion) {
              checkMediumQuestion();
              //display score
              await Future.delayed(const Duration(seconds: 3));
              // ignore: use_build_context_synchronously
              showDialog(
                  context: context, builder: (_) => showMediumScoreDialog());
              // Calling the updateScore method
              //to update the user's score in a Hive box
              updateScore(mediumscore);
            } else {
              checkMediumQuestion();
              scoreIfCorrect = mediumscore;
              currentQuestionIndex++;
              setState(() {
                selectedAnswer = null;
              });
            }
          } else {
            unansweredDialogs.dialogBox('You can not skip a question', context);
          }
        },
        child: Text(
          isLastQuestion ? "Finish" : "Submit",
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  // Function that checks if the player got a question right,
  // if so, informs the player that they were correct
  // else a user in informed that they were wrong
  //and is shown what the right answer was supposed to be

  checkMediumQuestion() {
    if (scoreIfCorrect < mediumscore) {
      correctAnswerDialogs.dialogBox('You are correct', context);
    } else {
      wrongAnswerDialog.dialogBox(
          'The answer is: ${questionList[currentQuestionIndex].correctAnswerText}',
          context);
    }
  }

  // Custom dialog which shows the score
  // of the player in a quiz with buttons
  // to replay the game of go to the playground

  showMediumScoreDialog() {
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
              Text("$mediumscore / ${questionList.length.toString()}",
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
                      currentQuestionIndex = 0;
                      mediumscore = 0;
                      selectedAnswer = null;
                      scoreIfCorrect = 0;
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
