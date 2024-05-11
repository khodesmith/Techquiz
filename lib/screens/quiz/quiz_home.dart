// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:tech_quiz/constants/app_colors.dart';
import 'package:tech_quiz/screens/categories/widget/course_display.dart';

class QuizHome extends StatelessWidget {
  const QuizHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomAppNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome back, Elvie',
                style: TextStyle(fontSize: 16, color: kPrimaryColor),
              ),
              const SizedBox(height: 10),
              const Text(
                "Let's Play!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 130,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            children: [
                              Text(
                                '3 days on Strike!',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(
                                    Icons.monetization_on,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '+10 daily points',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Image.asset(
                            'image/coin2.png',
                            height: 70,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      LinearProgressIndicator(
                        minHeight: 12,
                        borderRadius: BorderRadius.circular(5),
                        value: 0.3,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: kPrimaryColor,
                ),
              ),
              const Expanded(
                child: CourseDisplay(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
