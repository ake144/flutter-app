import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';
import 'dart:convert';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;



 class CourseRepository {
    static  final backendUrl = dotenv.env['API_URL'] ?? 'http://localhost:3000';


   static Future<Map<String, dynamic>> fetchCourseDetails(String courseId) async {

        final uri = Uri.parse('$backendUrl/course/$courseId');
        final headers = <String, String>{
          'Authorization': 'Bearer ${dotenv.env['API_TOKEN'] ?? ''}',
        };

        try {
            final response = await http.get(uri, headers: headers);
            if (response.statusCode == 200) {
                final data = jsonDecode(response.body) as Map<String, dynamic>;
                print('Course details fetched successfully: $data');
                return data;
            } else {
               throw Exception('Failed to fetch course details: ${response.statusCode}');

            }
        } catch (e) {
            print('Error fetching course details: $e');
            rethrow;
        }
    }

  static Future<List<dynamic>> fetchAllCourses() async {
       final uri = Uri.parse('$backendUrl/course');
      final headers = <String, String>{
          'Authorization': 'Bearer ${dotenv.env['API_TOKEN'] ?? ''}',
        };
        try {
            final response = await http.get(uri, headers: headers);
            if (response.statusCode == 200) {
                final data = jsonDecode(response.body) as List<dynamic>;
                print('All courses fetched successfully: $data');
                return data;
            } else {
                throw Exception('Failed to fetch courses: ${response.statusCode}');
            }
        } catch (e) {
            print('Error fetching courses: $e');
            rethrow;
        }
    }


    
  // Repository methods here
}