import 'dart:convert';
import 'package:assistantstroke/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SymptomModel {
  bool headache;
  bool numbness;
  bool dizziness;
  bool speechDifficulty;
  bool temporaryMemoryLoss;
  bool confusion;
  bool visionLoss;
  bool imbalance;
  bool nausea;
  bool difficultyswallowing;

  SymptomModel({
    required this.headache,
    required this.numbness,
    required this.dizziness,
    required this.speechDifficulty,
    required this.temporaryMemoryLoss,
    required this.confusion,
    required this.visionLoss,
    required this.imbalance,
    required this.nausea,
    required this.difficultyswallowing,
  });

  Map<String, dynamic> toJson({
    required int userId,
    required String recordedAt,
  }) {
    return {
      "userID": userId,
      "recordedAt": recordedAt,
      "dauDau": headache,
      "teMatChi": numbness,
      "chongMat": dizziness,
      "khoNoi": speechDifficulty,
      "matTriNhoTamThoi": temporaryMemoryLoss,
      "luLan": confusion,
      "giamThiLuc": visionLoss,
      "matThangCan": imbalance,
      "buonNon": nausea,
      "khoNuot": difficultyswallowing,
    };
  }
}

class SymptomController {
  final String url = ApiEndpoints.symptom;

  Future<bool> saveSymptoms(SymptomModel model) async {
    final prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt("userId");

    if (userId == null) {
      debugPrint("Không tìm thấy userId trong SharedPreferences");
      return false;
    }

    final String now = DateTime.now().toUtc().toIso8601String();

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(model.toJson(userId: userId, recordedAt: now)),
    );

    debugPrint("Response: ${response.statusCode} - ${response.body}");

    return response.statusCode == 200 || response.statusCode == 201;
  }
}
