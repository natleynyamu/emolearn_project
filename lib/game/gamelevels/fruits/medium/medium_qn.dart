class MediumQuestion {
  final String question;
  final String imageUrl;
  final List<Answer> answersList;
  final String correctAnswerText;

  MediumQuestion(
      {required this.question,
      required this.imageUrl,
      required this.answersList,
      required this.correctAnswerText});
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<MediumQuestion> getQuestions() {
  List<MediumQuestion> mediumList = [];

  mediumList.add(MediumQuestion(
      question: "Choose the correct answer from the ones given below",
      imageUrl: "assets/images/pear_medium.png",
      answersList: [
        Answer("A    Peach", false),
        Answer("B    Pear", true),
        Answer("C    Paw paw", false)
      ],
      correctAnswerText: "B    Pear"));

  mediumList.add(MediumQuestion(
      question: "Which fruit is this?",
      imageUrl: "assets/images/coconut_medium.png",
      answersList: [
        Answer("A    Coca-cola", false),
        Answer("B    Groundnuts", false),
        Answer("C    Coconut", true)
      ],
      correctAnswerText: "C    Coconut"));

  mediumList.add(MediumQuestion(
      question: "Which fruit is this?",
      imageUrl: "assets/images/apple_medium.png",
      answersList: [
        Answer("A    Apple", true),
        Answer("B    Pill", false), 
        Answer("C    Pomegranate", false)
      ],
      correctAnswerText: "A    Apple"));

  mediumList.add(MediumQuestion(
      question: "Which fruit is this?",
      imageUrl: "assets/images/pineapple_medium.png",
      answersList: [
        Answer("A    Apple", false),
        Answer("B    Apple Tree", false),
        Answer("C    Pineapple", true)
      ],
      correctAnswerText: "C    Pineapple"));

  mediumList.add(MediumQuestion(
      question: "Which fruit is this?",
      imageUrl: "assets/images/blueberry_medium.png",
      answersList: [
        Answer("A    Blue", false),
        Answer("B    Blueberry", true),
        Answer("C    Cherry", false)
      ],
      correctAnswerText: "B    Blueberry"));

  mediumList.add(MediumQuestion(
      question: "Which fruit is this?",
      imageUrl: "assets/images/dates_medium.png",
      answersList: [
        Answer("A    Calculator", false),
        Answer("B    Calender", false),
        Answer("C    Dates", true)
      ],
      correctAnswerText: "C    Dates"));

  mediumList.add(MediumQuestion(
      question: "Which fruit is this?",
      imageUrl: "assets/images/papaya_medium.png",
      answersList: [
        Answer("A    Person", false),
        Answer("B    Papaya", true),
        Answer("C    Papa", false)
      ],
      correctAnswerText: "C    Dates"));

  return mediumList;
}
