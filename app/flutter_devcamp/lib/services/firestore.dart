import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/models.dart';

class FirestoreService {
  /// Reads all documments from the topics collection
  Future<List<Topic>> getTopics() async {
    final response =
        await rootBundle.loadString('assets/mock_data_topics.json');

    final List<dynamic> decodedList = jsonDecode(response) as List;
    final List<Topic> topics = decodedList.map((listItem) {
      return Topic.fromJson(listItem);
    }).toList();
    // var ref = _db.collection('topics');
    // var snapshot = await ref.get();
    // var data = snapshot.docs.map((s) => s.data());
    // var topics = data.map((d) => Topic.fromJson(d));
    return topics.toList();
  }

  /// Retrieves a single quiz document
  Future<Quiz> getQuiz(String quizId) async {
    final response =
        await rootBundle.loadString('assets/mock_data_quizzes.json');

    final decodedList = jsonDecode(response);

    return Quiz.fromJson(decodedList);

    // var ref = _db.collection('quizzes').doc(quizId);
    // var snapshot = await ref.get();
    // return Quiz.fromJson(snapshot.data() ?? {});
  }

  /// Listens to current user's report document in Firestore
  // Stream<Report> streamReport() {}

  /// Updates the current user's report document after completing quiz
  //Future<void> updateUserReport(Quiz quiz) {}
}
