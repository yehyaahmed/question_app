import 'package:question_app/question.dart';

class Quiz {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
      'Who is the discoverer of gravity?',
      'Albert Einstein',
      'Isaac Newton',
      'Werner Heisenberg',
      'Isaac Newton',
    ),
    Question(
      'What is the operating system used in Samsung devices',
      'Android',
      'IOS',
      'Google',
      'Android',
    ),
    Question(
      'What color is the tomato?',
      'red',
      'yallow',
      'blue',
      'red',
    ),
  ];

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getAnswer_1() {
    return _questionBank[_questionNumber].answer_1;
  }

  String getAnswer_2() {
    return _questionBank[_questionNumber].answer_2;
  }

  String getAnswer_3() {
    return _questionBank[_questionNumber].answer_3;
  }

  String getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  bool isLastQuestion() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
