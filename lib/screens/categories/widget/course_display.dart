// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:tech_quiz/constants/app_colors.dart';
import 'package:tech_quiz/models/course_model.dart';
import 'package:tech_quiz/repository/quiz_repository.dart';
import 'package:tech_quiz/screens/categories/category_model.dart';
import 'package:tech_quiz/screens/quiz/quiz_detail.dart';

class CourseDisplay extends StatefulWidget {
  const CourseDisplay({
    super.key,
  });

  @override
  State<CourseDisplay> createState() => _CourseDisplayState();
}

class _CourseDisplayState extends State<CourseDisplay> {
  final quizRepo = QuizRepository();
  late Future<List<CategoryModel>> futureCatName;

  void setFuture() {
    setState(() {
      futureCatName = quizRepo.getCategory();
    });
  }

  @override
  void initState() {
    setFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Future<List<CategoryModel>> getCategories;
    return FutureBuilder<List<CategoryModel>>(
      future: futureCatName,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                height: 250,
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      'Data returned is empty try again!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: setFuture,
                      child: const Text(
                        'RELOAD',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final categoryModel = snapshot.data;
                return GestureDetector(
                  onTap: () {
                    // quizRepo.getQuiz(categoryModel[index].name);
                    Navigator.of(context).push(
                      MaterialPageRoute<QuizDetail>(
                        builder: (context) {
                          return QuizDetail(
                            categoryTitle: categoryModel[index].name,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          courses[index].courseImage,
                          height: 80,
                          width: 80,
                        ),
                        Text(
                          categoryModel![index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        } else if (snapshot.hasError) {
          return AlertDialog(
            title: const Text('No Data to Display'),
            content: Text(
              'Do you wanna reload the Page ${snapshot.error} occured',
            ),
            actions: [
              FilledButton(
                onPressed: setFuture,
                child: const Text(
                  'YES',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        }
        throw Exception();
      },
    );
  }
}
