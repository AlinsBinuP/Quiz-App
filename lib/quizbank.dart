import 'question.dart';

class QuizBank {
  int _questionNumber = 0;

  List<Question> _quesbank = [
    Question(q: 'Sharks are mammals', a: false),
    Question(q: 'Sea otters have a favorite rock they use to break open food.', a: true),
    Question(q: 'The blue whale is the biggest animal to have ever lived.', a: true),
    Question(q: 'The hummingbird egg is the world\'s smallest bird egg.', a: true),
    Question(q: 'Pigs roll in the mud because they don\'t like being clean.', a: false),
    Question(q: 'Bats are blind.', a: false),
    Question(q: 'Camels store water in their humps.', a: false),
    Question(q: 'Octopuses have three hearts.', a: true),
    Question(q: 'Slugs have four noses.', a: true),
    Question(q: 'Some turtles can breathe through their butts.', a: true),
    Question(q: 'Elephants are the only animals that can\'t jump.', a: true),
    Question(q: 'Dolphins sleep with one eye open.', a: true),
    Question(q: 'A group of flamingos is called a "flamboyance".', a: true),
    Question(q: 'Frogs drink water through their mouths.', a: false),
    Question(q: 'Butterflies taste with their feet.', a: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _quesbank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _quesbank[_questionNumber].queText;
  }

  bool getQuestionAnswer() {
    return _quesbank[_questionNumber].queAnswer;
  }

  bool isFinished() {
    return _questionNumber >= _quesbank.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }
}
