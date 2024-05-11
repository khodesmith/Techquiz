// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:tech_quiz/constants/quiz_api.dart';
import 'package:tech_quiz/models/quiz_model.dart';
import 'package:tech_quiz/screens/categories/category_model.dart';

class QuizRepository {
  Future<List<QuizModel>> getQuiz(String category) async {
    const url = '${baseUrl}questions';
    try {
      final uri = Uri.parse(url).replace(
        queryParameters: {
          'apiKey': dotenv.env['apiKey'],
          'limit': '5',
          'category': category,
        },
      );

      final response = await http.get(uri);
      final body = jsonDecode(response.body) as List<dynamic>;
      log(body.toString());
      return List<Map<String, dynamic>>.from(body)
          .map(
            QuizModel.fromJson,
          )
          .toList();
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }

  Future<List<CategoryModel>> getCategory() async {
    const url = '$baseUrl$categoryEndpoint';
    try {
      final uri = Uri.parse(url).replace(
        queryParameters: {
          'apiKey': dotenv.env['apiKey'],
        },
      );
      final response = await http.get(uri);
      final body = jsonDecode(response.body) as List<dynamic>;
      log(body.toString());
      return List<dynamic>.from(body)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList();
      // return [];
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
