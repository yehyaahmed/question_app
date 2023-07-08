import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:question_app/quiz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Quiz quiz = Quiz();

  Color colorBgAnswer_1 = Colors.black;
  Color colorBgAnswer_2 = Colors.black;
  Color colorBgAnswer_3 = Colors.black;

  bool isChooseAnswer = false;

  int score = 0;
  String nextText = 'Next';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question App'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Spacer(),
            Text(
              quiz.getQuestionText(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => colorBgAnswer_1),
                  ),
                  onPressed: isChooseAnswer
                      ? null
                      : () {
                          if (quiz.getQuestionAnswer() == quiz.getAnswer_1()) {
                            score++;
                            colorBgAnswer_1 = Colors.green;
                          } else {
                            colorBgAnswer_1 = Colors.red;
                          }

                          setState(() {
                            isChooseAnswer = true;
                          });
                        },
                  child: Text(
                    quiz.getAnswer_1(),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => colorBgAnswer_2),
                  ),
                  onPressed: isChooseAnswer
                      ? null
                      : () {
                          if (quiz.getQuestionAnswer() == quiz.getAnswer_2()) {
                            score++;
                            colorBgAnswer_2 = Colors.green;
                          } else {
                            colorBgAnswer_2 = Colors.red;
                          }

                          setState(() {
                            isChooseAnswer = true;
                          });
                        },
                  child: Text(
                    quiz.getAnswer_2(),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => colorBgAnswer_3),
                  ),
                  onPressed: isChooseAnswer
                      ? null
                      : () {
                          if (quiz.getQuestionAnswer() == quiz.getAnswer_3()) {
                            score++;
                            colorBgAnswer_3 = Colors.green;
                          } else {
                            colorBgAnswer_3 = Colors.red;
                          }

                          setState(() {
                            isChooseAnswer = true;
                          });
                        },
                  child: Text(
                    quiz.getAnswer_3(),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      colorBgAnswer_1 = Colors.black;
                      colorBgAnswer_2 = Colors.black;
                      colorBgAnswer_3 = Colors.black;

                      isChooseAnswer = false;

                      if (quiz.isFinished()) {
                        Alert(
                          context: context,
                          title: "Your Score",
                          desc: "3 / $score",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Done",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                nextText = 'Next';
                                score = 0;
                                quiz.reset();
                                Navigator.pop(context);
                                setState(() {});
                              },
                              color: Color.fromRGBO(0, 179, 134, 1.0),
                            ),
                          ],
                        ).show();
                      } else {

                        quiz.nextQuestion();
                        if (quiz.isLastQuestion()) {
                          nextText = 'Finish';
                        }

                      }
                    });
                  },
                  child: Text(
                    nextText,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
