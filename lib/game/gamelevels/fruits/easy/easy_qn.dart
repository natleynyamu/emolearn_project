// this class contains the list of all the contacts as list of type Contact Class
class EasyQuestion {
  final String question;
  final String imageUrl;
  final String answer;

  EasyQuestion({
    required this.question,
    required this.imageUrl,
    required this.answer,
  });
}

List<EasyQuestion> easyList = [
  //ADD questions and answer here

  EasyQuestion(
      question: "What fruit is this?",
      imageUrl: "assets/images/grapes.png",
      answer: "GRAPES"),
  EasyQuestion(
      question: "What fruit is this?",
      imageUrl: "assets/images/orange.png",
      answer: "ORANGE"),
  EasyQuestion(
      question: "What fruit is this?",
      imageUrl: "assets/images/pear.png",
      answer: "PEAR"),
  EasyQuestion(
      question: "What fruit is this?",
      imageUrl: "assets/images/lemon_easy.png",
      answer: "LEMON"),
  EasyQuestion(
      question: "What fruit is this?",
      imageUrl: "assets/images/avocado_easy.png",
      answer: "AVOCADO"),
  EasyQuestion(
      question: "What fruit is this?",
      imageUrl: "assets/images/guava_easy.png",
      answer: "GUAVA"),
];
