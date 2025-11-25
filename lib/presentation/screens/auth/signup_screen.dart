import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/presentation/widgets/nav_bar.dart';

class SignupScreen extends StatefulWidget {
       const SignupScreen({super.key});

      @override
      State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
       TextEditingController nameController = TextEditingController();
       TextEditingController emailController = TextEditingController();
       TextEditingController passwordController = TextEditingController();

    @override
    Widget build(BuildContext context){
        return(
          Scaffold(
            appBar: AppBar(
              title: const Text('Sign Up Screen'),
                backgroundColor: Colors.blueAccent, 
            ),
            drawer: const NavBar(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                     Text('This is the Sign Up Screen', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.blueAccent), ),
                  SizedBox(height: 30.0),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      final name = nameController.text.trim();
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();
                      SignUpUser(context, name, email, password);
                    },
                    child: Text('Sign Up'),
                  ),
                ],
                ),
              ),
            ),
          )
        );
      }
    Future<void> SignUpUser(BuildContext context,  String name, String email, String password) async {
         final backendUrl = 'http://192.168.0.198:3000';
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
           final data = await compute(jsonDecode, response.body);
           print('Sign up successful: $data');
           context.pushReplacementNamed('/login');
           // Handle successful sign up (e.g., navigate to another screen)
         } else {
           // Sign up failed
           final error = await compute(jsonDecode, response.body);
           print('Sign up failed: $error');
           // Handle sign up error (e.g., show error message)
         }
    }
         }
    