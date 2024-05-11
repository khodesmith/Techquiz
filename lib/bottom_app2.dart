// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class BottomApp extends StatefulWidget {
  const BottomApp({super.key});

  @override
  State<BottomApp> createState() => _BottomAppState();
}

class _BottomAppState extends State<BottomApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('PROFILE SCREEN'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.house_rounded),
          ),
          BottomNavigationBarItem(
            label: 'CATEGORY',
            icon: Icon(Icons.view_list_rounded),
          ),
          BottomNavigationBarItem(
            label: 'LEADERBOARD',
            icon: Icon(
              Icons.bar_chart,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: 'PROFILE',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
