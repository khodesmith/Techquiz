// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:tech_quiz/constants/app_colors.dart';
import 'package:tech_quiz/custom_text_buttton.dart';
import 'package:tech_quiz/models/quiz_model.dart';
import 'package:tech_quiz/screens/categories/categories.dart';
import 'package:tech_quiz/screens/categories/widget/course_display.dart';

class QuizScoreScreen extends StatelessWidget {
  const QuizScoreScreen({
    required this.quizQuestion,
    required this.quizScore,
    super.key,
  });

  final List<QuizModel> quizQuestion;
  final int quizScore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute<CourseDisplay>(
                builder: (context) => const CategoryScreen(),
              ));
            },
            icon: const Icon(
              Icons.close,
              size: 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Congrats!',
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'YOUR SCORE',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF778FF0),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '$quizScore/${quizQuestion.length}',
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'image/coin2.png',
                      height: 40,
                    ),
                    const Text(
                      '+90 points',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 70),
            Image.asset('image/trophy.png'),
            const SizedBox(height: 30),
            const CustomTextButton(
              buttonText: 'Play Again',
              backgroundColor: Color(
                0xFF3FE5ED,
              ),
              buttonWidth: 250,
            ),
          ],
        ),
      ),
    );
  }
}
