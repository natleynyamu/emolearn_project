// class definitions for representing
//a medium difficulty quiz question and its answers.
class MediumQuestion {
  // String representing the question itself
  final String question;
  // String representing the URL of an image
  //related to the question
  final String imageUrl;
  // a List of Answer objects representing
  //the possible answers to the question
  final List<Answer> answersList;
  // String representing the text of the correct answer to the question
  final String correctAnswerText;

// constructor of class MediumQuestion
// for initialization
  MediumQuestion(
      {required this.question,
      required this.imageUrl,
      required this.answersList,
      required this.correctAnswerText});
}

// class definition representing an answer
//to a medium difficulty quiz in vegetable category
class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<MediumQuestion> getQuestions() {
  List<MediumQuestion> mediumList = [];

// initializing questions and their possibe answers
  mediumList.add(MediumQuestion(
      question: "Choose the correct answer from the ones given below",
      imageUrl: "assets/images/eggplant_medium.png",
      answersList: [
        Answer("A    Eggplant", true),
        Answer("B    Eggs", false),
        Answer("C    Plant", false)
      ],
      correctAnswerText: "A    Eggplant"));

  mediumList.add(MediumQuestion(
      question: "Which vegetable is this?",
      imageUrl: "assets/images/carrot_medium.png",
      answersList: [
        Answer("A    Car", false),
        Answer("B    Rat", false),
        Answer("C    Carrot", true)
      ],
      correctAnswerText: "C    Carrot"));

  mediumList.add(MediumQuestion(
      question: "Which vegetable is this?",
      imageUrl: "assets/images/olive_medium.png",
      answersList: [
        Answer("A    Olives", true),
        Answer("B    Orange", false),
        Answer("C    Leaves", false)
      ],
      correctAnswerText: "A    Olives"));

  mediumList.add(MediumQuestion(
      question: "Which vegetable is this?",
      imageUrl: "assets/images/onion_medium.png",
      answersList: [
        Answer("A    Apple", false),
        Answer("B    Onion", true),
        Answer("C    Iron", false)
      ],
      correctAnswerText: "B    Onion"));

  mediumList.add(MediumQuestion(
      question: "Which vegetable is this?",
      imageUrl: "assets/images/pepper_medium.png",
      answersList: [
        Answer("A    Water", false),
        Answer("B    Cup", false),
        Answer("C    Pepper", true)
      ],
      correctAnswerText: "C    Pepper"));

  mediumList.add(MediumQuestion(
      question: "Which vegetable is this?",
      imageUrl: "assets/images/tomato_medium.png",
      answersList: [
        Answer("A    Potato", false),
        Answer("B    Tomato", true),
        Answer("C    Feet", false)
      ],
      correctAnswerText: "B    Tomato"));

  mediumList.add(MediumQuestion(
      question: "Which vegetable is this?",
      imageUrl: "assets/images/ginger_medium.png",
      answersList: [
        Answer("A    Ginger", true),
        Answer("B    Pepper Jar", false),
        Answer("C    Jar", false)
      ],
      correctAnswerText: "A    Ginger"));

  mediumList.add(MediumQuestion(
      question: "Which vegetable is this?",
      imageUrl: "assets/images/garlic_medium.png",
      answersList: [
        Answer("A    Garlic", true),
        Answer("B    Ice-cream", false),
        Answer("C    Girl", false)
      ],
      correctAnswerText: "A    Garlic"));

  return mediumList;
}
