import 'dart:convert';

import 'package:assistantstroke/services/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FamilyMember {
  final String name;
  final int relationshipId;
  final String email;
  final String relationshipType;

  FamilyMember({
    required this.name,
    required this.relationshipId,
    required this.email,
    required this.relationshipType,
  });

  factory FamilyMember.fromJson(Map<String, dynamic> json) {
    return FamilyMember(
      relationshipId: json['relationshipId'] ?? '',
      name: json['nameInviter'] ?? '',
      email: json['emailInviter'] ?? '',
      relationshipType: json['relationshipType'] ?? '',
    );
  }
}

class FamilyController {
  Future<List<FamilyMember>> getFamilyMembers() async {
    final String url = ApiEndpoints.get_elationship;

    final prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('userId');

    if (userId == null) {
      throw Exception('Không tìm thấy userId trong bộ nhớ!');
    }

    final baseUrl = Uri.parse("$url?userId=$userId");

    final response = await http.get(baseUrl);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => FamilyMember.fromJson(item)).toList();
    } else {
      throw Exception('Không thể tải danh sách người nhà');
    }
  }

  // class FamilyController {
  //   Future<List<FamilyMember>> getFamilyMembers() async {
  //     await Future.delayed(const Duration(seconds: 1));
  //     return [
  //       FamilyMember(
  //         name: 'Nguyễn Văn A',
  //         email: 'a@example.com',
  //         relationshipType: 'Cha',
  //       ),
  //       FamilyMember(
  //         name: 'Trần Thị B',
  //         email: 'b@example.com',
  //         relationshipType: 'Mẹ',
  //       ),
  //       FamilyMember(
  //         name: 'Lê Văn C',
  //         email: 'c@example.com',
  //         relationshipType: 'Anh trai',
  //       ),
  //     ];
  //   }

  Future<bool> deleteFamilyMember(FamilyMember member) async {
    final String url = ApiEndpoints.delete_relationship;

    int Id = member.relationshipId;
    final baseUrl = Uri.parse("$url\$$Id");
    final response = await http.delete(baseUrl, headers: {'accept': '*/*'});

    if (response.statusCode == 200) {
      print("Đã xoá thành viên: ${member.name}");
      return true;
    } else {
      print(response.statusCode);
      throw Exception('Không thể xoá thành viên');
    }
  }
}
