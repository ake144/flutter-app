import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class DatabaseService {
  FirebaseDatabase? _firebaseDatabase;

  DatabaseService() {
    if (!Platform.isLinux) {
      try {
        _firebaseDatabase = FirebaseDatabase.instance;
      } catch (e) {
        debugPrint("Firebase not initialized: $e");
      }
    } else {
      debugPrint("Skipping Firebase setup on Linux");
    }
  }

  bool get isAvailable => _firebaseDatabase != null;

  Future<void> createNewData(String path, Map<String, dynamic> data) async {
    if (!isAvailable) {
      debugPrint("⚠️ Firebase not available — skipping createNewData()");
      return;
    }
    DatabaseReference ref = _firebaseDatabase!.ref().child(path);
    await ref.set(data);
  }

  Future<void> saveQuizResult(int score) async {
    if (!isAvailable) {
      debugPrint("⚠️ Firebase not available — skipping saveQuizResult()");
      return;
    }
    DatabaseReference ref = _firebaseDatabase!.ref("quiz_results").push();
    await ref.set({
      'score': score,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  Future<List<Map<String, dynamic>>> fetchQuizResults() async {
    if (!isAvailable) {
      debugPrint("⚠️ Firebase not available — skipping fetchQuizResults()");
      return [];
    }
    DatabaseReference ref = _firebaseDatabase!.ref("quiz_results");
    DatabaseEvent event = await ref.once();
    if (event.snapshot.value != null) {
      final data = event.snapshot.value as Map<dynamic, dynamic>;
      return data.entries.map((entry) {
        final value = entry.value as Map<dynamic, dynamic>;
        return {
          'score': value['score'] as int,
          'timestamp': DateTime.parse(value['timestamp'] as String),
        };
      }).toList();
    } else {
      return [];
    }
  }

  Future<DataSnapshot?> read({required String path}) async {
    if (!isAvailable) {
      debugPrint("⚠️ Firebase not available — skipping read()");
      return null;
    }
    final DatabaseReference ref = _firebaseDatabase!.ref().child(path);
    final DataSnapshot snapshot = await ref.get();
    return snapshot.exists ? snapshot : null;
  }

  Future<void> update({
    required String path,
    required Map<String, dynamic> values,
  }) async {
    if (!isAvailable) {
      debugPrint("⚠️ Firebase not available — skipping update()");
      return;
    }
    final DatabaseReference ref = _firebaseDatabase!.ref().child(path);
    await ref.update(values);
  }

  Future<void> delete({required String path}) async {
    if (!isAvailable) {
      debugPrint("⚠️ Firebase not available — skipping delete()");
      return;
    }
    final DatabaseReference ref = _firebaseDatabase!.ref().child(path);
    await ref.remove();
  }
}
