import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';
import 'dart:convert';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;


class LoginRepository {
  
  static Future<void> LoginUser(BuildContext context, String username, String password) async {
  
   final backendUrl = dotenv.env['API_URL'] ?? 'http://localhost:3000';


  final uri = Uri.parse('$backendUrl/auth/login');

  try {
    print('Sending login request: $username / $password');

    final client = HttpClient();
    final request = await client.postUrl(uri);
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.add(utf8.encode(jsonEncode({
      'username': username,
      'password': password,
    })));
    final response = await request.close();
    final body = await response.transform(utf8.decoder).join();
    if (response.statusCode == 200) {
     print('Login successful: $body');
     context.go('/');

    } else {
       print('Login error');

    }
    client.close();
  } catch (e) {
    print('Login error: $e');
    // Handle login error
  }
}

static Future<void> SignUpUser(BuildContext context,  String name, String email, String password) async {
          
        final backendUrl = dotenv.env['API_URL'] ?? 'http://localhost:3000';


        final uri = Uri.parse('$backendUrl/users');

         final response = await http.post(
           uri,
           headers: {'Content-Type': 'application/json'},
           body: jsonEncode({
             'name': name,
             'email': email,
             'password': password,
           }),
         );

         if (response.statusCode == 200) {
           // Sign up successful
           final data = jsonDecode(response.body);
           print('Sign up successful: $data');
           context.pushReplacementNamed('/login');
           // Handle successful sign up (e.g., navigate to another screen)
         } else {
           // Sign up failed
           final error = jsonDecode(response.body);
           print('Sign up failed: $error');
           // Handle sign up error (e.g., show error message)
         }
    }

}