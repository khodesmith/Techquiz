// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:tech_quiz/constants/app_colors.dart';
import 'package:tech_quiz/models/quiz_model.dart';
import 'package:tech_quiz/quiz_score/quiz_score_screen.dart';
// import 'package:tech_quiz/screens/quiz/quiz_detail.dart';
// import 'package:tech_quiz/repository/quiz_repository.dart';
import 'package:tech_quiz/screens/quiz/widget/options_button.dart';

class QuizQuestionScreen extends StatefulWidget {
  const QuizQuestionScreen({required this.quizQuestions, super.key});

  final List<QuizModel> quizQuestions;

  @override
  State<QuizQuestionScreen> createState() => _QuizQuestionScreenState();
}

int currIndex = 0;
bool isSelected = false;

String optionSelected = '';

List<String> selectedAnswer = [];

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  // void handleAnswer(String aswer) {
  //   final answers = widget.quizQuestions[currIndex].answers;
  //   final anotherAnswer =
  //       widget.quizQuestions[currIndex].answers as List<String>;
  //   final cAnswers = widget.quizQuestions[currIndex].correctAnswer
  //       .where((answer) => answer == 'true')
  //       .toList();
  //   final indexOfAnswer = anotherAnswer.indexOf(aswer);
  //   print(indexOfAnswer);
  //   final zippedList = List.generate(
  //     answers.length,
  //     (index) {
  //       final key = answers[index].answer!;
  //       final value = cAnswers[index].correctAnswer as bool;
  //       return {key: value};
  //     },
  //   );
  // }

  void handleContinue() {
    setState(() {
      if (currIndex == widget.quizQuestions.length - 1) {
        Navigator.of(context).push(
          MaterialPageRoute<QuizScoreScreen>(
            builder: (context) => QuizScoreScreen(
              quizQuestion: widget.quizQuestions,
            ),
          ),
        );
      } else {
        currIndex++;
        isSelected = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final listOfAnswers = widget.quizQuestions[currIndex].answers
        .where((item) => item.answer != null)
        .toList();
    Widget continueButton = Container();
    if (isSelected) {
      continueButton = TextButton(
        style: const ButtonStyle(
            // backgroundColor: MaterialStatePropertyAll(
            //   Color(0xFFFFFFFF),
            // ),
            ),
        onPressed: () {
          setState(() {
            handleContinue();
            // isSelected = true;
            print('continue clicked');
          });
        },
        child: const Text(
          'Continue',
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: kPrimaryColor),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_back_ios_new_sharp,
                          ),
                        ),
                        const Icon(
                          Icons.hourglass_top_outlined,
                          color: Colors.white,
                        ),
                        const Text(
                          '2.14',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.pink.shade100),
                        Icon(Icons.favorite, color: Colors.pink.shade100),
                        Icon(Icons.favorite, color: Colors.pink.shade100),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Text(
                  'Question ${currIndex + 1} out of ${widget.quizQuestions.length}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFF6A7DDA),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  textAlign: TextAlign.center,
                  widget.quizQuestions[currIndex].question,
                  style:
                      const TextStyle(fontSize: 35, color: Color(0xFFFFFFFF)),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: ListView.builder(
                    itemCount: listOfAnswers.length,
                    itemBuilder: (context, index) {
                      final selectedOption = listOfAnswers[index].answer!;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            isSelected = true;
                            if (selectedAnswer.contains(selectedOption)) {
                              selectedAnswer.removeWhere(
                                (element) => element == selectedOption,
                              );
                            } else {
                              selectedAnswer.add(selectedOption);
                            }
                            ;
                            if (selectedAnswer.isEmpty) {
                              isSelected = false;
                            }
                            print(selectedAnswer.toString());
                          });
                        },
                        child: OptionButtonWidget(
                          color: selectedAnswer.contains(selectedOption)
                              ? kSelected
                              : Colors.white,
                          optionsText: isSelected == true
                              ? listOfAnswers[index++].answer!
                              : listOfAnswers[index].answer!,
                        ),
                      );
                    },
                  ),
                ),
                Align(alignment: Alignment.bottomRight, child: continueButton),
                // OptionButtonWidget(
                //   optionsText: quizQuestions[0].answers[1].answer!,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
