import 'package:flutter/material.dart';
import 'package:flutterandroidstudio/quizbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question.dart';

QuizBank quizBank = QuizBank();
void main() {
  runApp(
      Quizzy());
}
class Quizzy extends StatelessWidget {
  const Quizzy({Key? key}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}
class QuizPage extends StatefulWidget {

  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> ScoreKeeper = [];
  void checkans(bool selectedanswer)
  {
  bool correct = quizBank.getQuestionAnswer();
  setState(() {
    if(quizBank.isFinished()==true)
      {
        Alert(
          context: context,
          title: 'Finshed',
          desc: 'You completed the quiz successfully',
        ).show();
        quizBank.reset();
        ScoreKeeper= [];
      }
    else
      {
        if(selectedanswer==correct)
        {
          ScoreKeeper.add(Icon(Icons.done,color: Colors.green,
          ),
          );
        }
        else
        {
          ScoreKeeper.add(Icon(Icons.close,color: Colors.red,
          ),
          );
        }
        quizBank.nextQuestion();
      }
  });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(quizBank.getQuestionText(),
                textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
       Expanded(
         child: Padding(
           padding: EdgeInsets.all(10.0),
           child: TextButton(
             style: TextButton.styleFrom(
               backgroundColor: Colors.green,
             ),
             onPressed: ()
           {
            checkans(true);
           },
             child: Text('True',
             style: TextStyle(
               color: Colors.white,
               fontSize: 20.0,
             ),
             ),
           ),
         ),
       ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: ()
              {
               checkans(false);
              },
              child: Text('False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),),
            ),
          ),
        ),
        Row(
          children: ScoreKeeper,
        ),
      ],
    );
  }
}
