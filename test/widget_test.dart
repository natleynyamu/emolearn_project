// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:on_boarding/game/category.dart';
import 'package:on_boarding/utilities/content_button.dart';
import 'package:on_boarding/models/content_model.dart';
import 'package:on_boarding/game/gamelevels/fruits/easy/easy_qn.dart';
import 'package:on_boarding/game/gamelevels/fruits/hard/hard_qn.dart';
import 'package:on_boarding/utilities/login_button.dart';
import 'package:on_boarding/game/gamelevels/fruits/medium/medium_qn.dart';
import 'package:on_boarding/home/start-up/onboarding_page.dart';
import 'package:on_boarding/home/start-up/start.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('getQuestions', () {
    test('returns a list of MediumQuestion objects', () {
      final questions = getQuestions();
      expect(questions, isInstanceOf<List<MediumQuestion>>());
    });
  });

  test('each MediumQuestion has a non-empty question string', () {
    final questions = getQuestions();
    for (final question in questions) {
      expect(question.question, isNotEmpty);
    }
  });

  test('each MediumQuestion has a non-empty imageUrl string', () {
    final questions = getQuestions();
    for (final question in questions) {
      expect(question.imageUrl, isNotEmpty);
    }
  });

  test('each MediumQuestion has a list of Answer objects', () {
    final questions = getQuestions();
    for (final question in questions) {
      expect(question.answersList, isInstanceOf<List<Answer>>());
    }
  });

  test('each MediumQuestion has a non-empty correctAnswerText string', () {
    final questions = getQuestions();
    for (final question in questions) {
      expect(question.correctAnswerText, isNotEmpty);
    }
  });

  group('HardQuestion', () {
    test('should create a HardQuestion object with the correct properties', () {
      final question = HardQuestion(
        question: 'Guess the fruit',
        imageUrl: 'images/watermelon.png',
        answer: 'watermelon',
      );

      expect(question.question, 'Guess the fruit');
      expect(question.imageUrl, 'images/watermelon.png');
      expect(question.answer, 'watermelon');
    });
  });

  group('EasyQuestion', () {
    test('Question is not null', () {
      for (var question in easyList) {
        expect(question.question, isNotNull);
      }
    });
  });

  test('Image URL is not null', () {
    for (var question in easyList) {
      expect(question.imageUrl, isNotNull);
    }
  });

  test('Answer is not null', () {
    for (var question in easyList) {
      expect(question.answer, isNotNull);
    }
  });

  test('Answer is not empty', () {
    for (var question in easyList) {
      expect(question.answer.isNotEmpty, isTrue);
    }
  });

  test('Answer is uppercase', () {
    for (var question in easyList) {
      expect(question.answer, equals(question.answer.toUpperCase()));
    }
  });

  testWidgets('StartScreen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: StartScreen()));

    // Verify that the 'Emolearn' text is displayed
    expect(find.text('Emolearn'), findsOneWidget);

    // Verify that the 'Are you ready?' text is displayed
    expect(find.text('Are you ready?'), findsOneWidget);

    // Verify that the 'Play' button is displayed
    expect(find.widgetWithText(TextButton, 'Play'), findsOneWidget);

    // Verify that the 'Save your progress' button is displayed
    expect(
        find.widgetWithText(TextButton, 'Save your progress'), findsOneWidget);
  });

  group('OnBoardingPage', () {
    testWidgets('displays the correct title', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: OnBoardingPage()));
      expect(find.text('Emolearn'), findsOneWidget);
    });
  });

  testWidgets('navigates to the next page on "Next" tap',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'ON_BOARDING': false});
    await tester.pumpWidget(const MaterialApp(home: OnBoardingPage()));
    final initialPage =
        tester.widget<PageView>(find.byType(PageView)).controller.page!.toInt();
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    final nextPage =
        tester.widget<PageView>(find.byType(PageView)).controller.page!.toInt();
    expect(nextPage, initialPage + 1);
  });

  testWidgets('LoginButton onTap should be called when tapped',
      (WidgetTester tester) async {
    var tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginButton(
            onTap: () {
              tapped = true;
            },
          ),
        ),
      ),
    );
    await tester.tap(find.text('Sign in'));
    expect(tapped, isTrue);
  });

  group('OnboardingContent', () {
    test('should create an instance with image, title, and description', () {
      final onboardingContent = OnboardingContent(
        image: 'assets/images/emolearn.png',
        title: 'What is Emolearn?',
        description:
            "It's an emoji- based puzzle game that aims to help kids in their early primary develop memory skills.",
      );

      expect(onboardingContent.image, 'assets/images/emolearn.png');
      expect(onboardingContent.title, 'What is Emolearn?');
      expect(onboardingContent.description,
          "It's an emoji- based puzzle game that aims to help kids in their early primary develop memory skills.");
    });
  });

  test('should create a list of OnboardingContent', () {
    final contents = [
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

    expect(contents.length, 3);
    expect(contents[0].image, 'assets/images/emolearn.png');
    expect(contents[1].title, 'What are Emojis?');
    expect(contents[2].description,
        'It’s all about guessing a word an emoji or series of emojis represent.');
  });

  testWidgets('PageButton should display the text "Sign Up"',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: PageButton(onTap: null),
        ),
      ),
    );

    expect(find.text('Sign Up'), findsOneWidget);
  });

  testWidgets('PageButton should call the onTap function when tapped',
      (WidgetTester tester) async {
    var tapped = false;
    void onTapFunction() {
      tapped = true;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PageButton(onTap: onTapFunction),
        ),
      ),
    );

    await tester.tap(find.byType(PageButton));
    expect(tapped, isTrue);
  });

  testWidgets('FruitCategory displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: FruitCategory()));
    expect(find.text('Fruits'), findsOneWidget);
    expect(find.text('Select Difficulty'), findsOneWidget);
    expect(find.text('Back'), findsOneWidget);
    expect(find.text('Easy'), findsOneWidget);
    expect(find.text('Medium'), findsOneWidget);
    expect(find.text('Hard'), findsOneWidget);
  });
}
