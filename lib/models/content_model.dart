class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
    image: 'assets/images/emolearn.png',
    title: 'What is Emolearn?',
    description:
        "It's an emoji- based puzzle game that aims to help kids in their early primary develop memory skills.",
  ),
  OnboardingContent(
    image: 'assets/images/2.png',
    title: 'What are Emojis?',
    description:
        'An emoji is a visual representation of an emotion, object, or symbol',
  ),
  OnboardingContent(
    image: 'assets/images/1.png',
    title: 'How to play?',
    description:
        'It’s all about guessing a word an emoji or series of emojis represent.',
  ),
];
