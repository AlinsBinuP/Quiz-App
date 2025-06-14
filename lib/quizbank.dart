import 'question.dart';
class QuizBank {
  int _questionNumber = 0;
  List<Question> _quesbank = [
    Question(q: 'Sharks are mammals', a: false),
    Question(q: 'Sea otters have a favorite rock they use to break open food.',
        a: true),
    Question(
        q: 'The blue whale is the biggest animal to have ever lived.', a: true),
    Question(
        q: 'The hummingbird egg is the world\'s smallest bird egg.', a: true),
    Question(q: 'Pigs roll in the mud because they don\'t like being clean.',
        a: false),
  ];
  void nextQuestion()
  {
    if(_questionNumber < _quesbank.length - 1)
      {
        _questionNumber++;
        print(_questionNumber);
        print(_quesbank.length);
      }
  }
  String getQuestionText()
  {
    return _quesbank[_questionNumber].queText;
  }

  bool getQuestionAnswer()
  {
    return _quesbank[_questionNumber].queAnswer;
  }
  bool isFinished(){
    if(_questionNumber == _quesbank.length-1)
      {
        return true;
      }
    else
      {
        return false;
      }
  }
  void reset()
  {
    _questionNumber = 0;
  }
}