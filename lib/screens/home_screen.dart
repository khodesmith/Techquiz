// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:tech_quiz/bottom_appbar.dart';
import 'package:tech_quiz/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 80),
              const Text(
                'Quizard',
                style: TextStyle(
                  fontFamily: 'ShareTech',
                  fontSize: 90,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 400,
                child: Text(
                  textAlign: TextAlign.center,
                  '1,000+ quizzes to challenge you and your friends on all topics!',
                  style: TextStyle(
                    fontFamily: 'ShareTech',
                    fontSize: 15,
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('image/techquiz.jpeg'),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<Widget>(
                      builder: (context) => const BottomAppNavBar(),
                    ),
                  );
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(kLightBlue),
                  minimumSize: MaterialStatePropertyAll(
                    Size(280, 55),
                  ),
                ),
                child: const Text(
                  'Start Playing',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
