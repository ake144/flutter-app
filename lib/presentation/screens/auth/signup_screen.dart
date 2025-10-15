import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
      SignupScreen({super.key});


      @override
      Widget build(BuildContext context){
        return(
          Scaffold(
            appBar: AppBar(
              title: const Text('Sign Up Screen'),
            ),
            body: const Center(
              child: Text('This is the Sign Up Screen'),
            ),
          )
        );
      }
}