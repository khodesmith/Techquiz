// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:tech_quiz/constants/app_colors.dart';
import 'package:tech_quiz/screens/categories/categories.dart';
import 'package:tech_quiz/screens/leaderboard/leaderboard_screen.dart';
import 'package:tech_quiz/screens/profile/profile_screen.dart';
import 'package:tech_quiz/screens/quiz/quiz_home.dart';

class BottomAppNavBar extends StatefulWidget {
  const BottomAppNavBar({super.key});

  @override
  State<BottomAppNavBar> createState() => _BottomAppNavBarState();
}

class _BottomAppNavBarState extends State<BottomAppNavBar> {
  int currClick = 0;
  List<Widget> screens = const [
    QuizHome(),
    CategoryScreen(),
    LeaderBoardScreen(),
    ProfileScreen(),
  ];
  List<Widget> get icons => [
        const Icon(Icons.house_rounded),
        const Icon(Icons.view_list_rounded),
        const Icon(Icons.bar_chart),
        const Icon(Icons.person),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currClick],
      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            icons.length,
            (index) => IconButton(
              // splashRadius: 100,
              onPressed: () {
                setState(() {
                  currClick = index;
                });
              },
              icon: icons[index],
              iconSize: 30,
              color: currClick == index ? Colors.blue : kPrimaryColor,
            ),
          ),

          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       currClick = 0;
          //     });
          //   },
          //   icon: const Icon(Icons.house_rounded),
          //   iconSize: 30,
          //   color: currClick == 0 ? Colors.blue : kPrimaryColor,
          // ),
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       currClick = 1;
          //     });
          //   },
          //   icon: const Icon(Icons.view_list_rounded),
          //   iconSize: 30,
          //   color: currClick == 1 ? Colors.blue : kPrimaryColor,
          // ),
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       currClick = 2;
          //     });
          //   },
          //   icon: Image.asset(
          //     'image/bar-graph.png',
          //     width: 25,
          //     height: 23,
          //     color: currClick == 2 ? Colors.blue : kPrimaryColor,
          //   ),
          // ),
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       currClick = 3;
          //     });
          //   },
          //   icon: Icon(
          //     Icons.person,
          //     size: 30,
          //     color: currClick == 3 ? Colors.blue : kPrimaryColor,
          //   ),
          // )
        ),
      ),
    );
  }
}
