
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/data/repositories/auths_repository.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:io';

import 'package:my_flutter_app/presentation/widgets/nav_bar.dart';

class LoginScreen extends StatefulWidget {
      const  LoginScreen({super.key}); 


      @override
  State<LoginScreen> createState() => _loginScreenState();  
}



  class _loginScreenState extends State<LoginScreen>{   
     TextEditingController phoneController = TextEditingController();
     
     TextEditingController usernameController = TextEditingController();
     TextEditingController passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
       appBar: AppBar(
        title: const Text('Login Screen', style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
         backgroundColor: Colors.blueAccent, 
       ),
       drawer: const NavBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Wellcome! Please log in.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
                SizedBox(height: 24.0),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),  
                SizedBox(height: 16.0),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
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
                     final username = usernameController.text.trim();
                    final password = passwordController.text.trim();
                    LoginRepository.LoginUser(context, username, password);
                    
                  },
                  child: const Text('Login'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    context.go('/signup');
                  },
                  child: const Text('Do not have an account? Sign Up'),
                ),
                SizedBox(height: 16.0),
                // TextField(
                //   controller: phoneController,
                   
                //   decoration: const InputDecoration(
                //     labelText: 'Phone Number',
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
                //     ),
                //   ),
                //   maxLength: 12,
                //   keyboardType: TextInputType.number,
                //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                // ),
                // const SizedBox(height: 16.0),
                // ElevatedButton(
                //   onPressed: () {
                //     final raw = phoneController.text.trim();
                //     final digits = raw.replaceAll(RegExp(r'\D'), '');

                //     if (digits.length == 12) {
                //       final e164 = '+$digits';
                //       AuthRepository.verifyPhoneNumber(context, e164);
                //     } else {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         const SnackBar(content: Text('Please enter a valid 12-digit phone number.')),
                //       );
                //     }
                //   },
                //   child: const Text('Login'),
                // ),
              ]
              ),

            
          )
        
        ),

    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }



}
