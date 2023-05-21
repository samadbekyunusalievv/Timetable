import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:timetable_app/models/lesson_entity.dart';

class ApiClient{
  Future<List<LessonEntity>?> getTimetable(String studentNum) async {
    var client = http.Client();
    var url = Uri.http('192.168.240.166:8082', '/table/student/$studentNum');
    print(url);
    var response = await client.get(url, headers: <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
    });

      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        List<dynamic> jsonLesson = jsonDecode(responseBody) as List;
        List<LessonEntity> lessonList =
        jsonLesson.map((json) => LessonEntity.fromJson(json)).toList();
        return lessonList;
      } else {
        // Request failed with an error code
        print('Request failed with status: ${response.statusCode}');
        return null;
      }
  }
}