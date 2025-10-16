
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
      const  LoginScreen({super.key}); 


     @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Login Screen', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
       ),
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Wellcome! Please log in.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 2.0),
                child: TextField(
                  style: const TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    labelText: 'Username',
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
              ),
                SizedBox(height: 16.0),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 2.0, 24.0, 2.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  obscureText: true,
                )
                 ),

                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/');
                  },
                  child: const Text('Login'),
                ),
                SizedBox(height: 16.0),
                TextButton(onPressed: (){
                  context.go('/login');
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(25, 2, 0, 2),
                  foregroundColor: Colors.blue,
                ),
                child: OutlinedButton(
                  onPressed: () {
                    context.go('/signup');
                  },
                  child: const Text('don\'t have an account? Sign up'),
                ),
              ),

            ],
          )
        ),

    );
  }
}