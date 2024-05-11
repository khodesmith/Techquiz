// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:tech_quiz/constants/app_colors.dart';
import 'package:tech_quiz/custom_text_buttton.dart';
import 'package:tech_quiz/models/quiz_model.dart';
import 'package:tech_quiz/repository/quiz_repository.dart';
import 'package:tech_quiz/screens/quiz/quiz_question_screen.dart';
import 'package:tech_quiz/screens/quiz/widget/icon_text_box.dart';

class QuizDetail extends StatelessWidget {
  const QuizDetail({required this.categoryTitle, super.key});
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
        title: const Text(
          'Quiz of the Week',
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  scale: 3,
                  // fit: BoxFit.contain,
                  image: AssetImage('image/trophy.png'),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              categoryTitle,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconTextBox(
                  boxText: '5 Questions',
                  iconImage: 'image/coin2.png',
                ),
                IconTextBox(
                  boxText: '+10 Points',
                  iconImage: 'image/devops2.png',
                ),
                IconTextBox(
                  boxText: '3 Lives',
                  iconImage: 'image/networking.png',
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Become the best and fastest player of quiz of the week worldwide'
              ' and win \$50! \n',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 17,
              ),
            ),
            const Text(
              textAlign: TextAlign.left,
              'This quiz is about design tools for non-designers. Challenge '
              'yourself and your friends!!!',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 120),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StartQuizButton(
                  categoryTitle: categoryTitle,
                ),
                const CustomTextButton(
                  buttonText: 'Challenge Friends',
                  textColor: Colors.white,
                  backgroundColor: kPrimaryColor,
                ),
              ],
            ),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class StartQuizButton extends StatefulWidget {
  const StartQuizButton({
    required this.categoryTitle,
    super.key,
  });

  // final List<dynamic> quizQuestions;
  final String categoryTitle;

  @override
  State<StartQuizButton> createState() => _StartQuizButtonState();
}

class _StartQuizButtonState extends State<StartQuizButton> {
  List<QuizModel> quizQuestions = [];
  final quizRepo = QuizRepository();
  Future<List<QuizModel>>? futureQuizQuestions;

  void setQuizQuestion() {
    setState(() {
      futureQuizQuestions = quizRepo.getQuiz(widget.categoryTitle);
    });
  }

  // Future<List<dynamic>> getQuestions() async {
  //   return quizQuestions = List.from(
  //     await quizRepo.getQuiz(widget.categoryTitle),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureQuizQuestions,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          Future.delayed(
            Duration.zero,
            () {
              Navigator.of(context).push(
                MaterialPageRoute<QuizQuestionScreen>(
                  builder: (context) => QuizQuestionScreen(
                    quizQuestions: snapshot.data!,
                  ),
                ),
              );
            },
          );
        }
        return CustomTextButton(
          buttonText: 'Play Solo',
          onTap: setQuizQuestion,
        );
      },
    );
  }
}
