
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:my_flutter_app/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:my_flutter_app/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:my_flutter_app/presentation/widgets/nav_bar.dart';

class LoginScreen extends StatefulWidget {
      const  LoginScreen({super.key}); 


      @override
  State<LoginScreen> createState() => _LoginScreenState();  
}

  class _LoginScreenState extends State<LoginScreen>{   
    TextEditingController phoneController = TextEditingController();
     
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool _isSubmitting = false;



  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // Stop any local loading indicator
        if (_isSubmitting) {
          setState(() {
            _isSubmitting = false;
          });
        }

        if (state.isAuthenticated) {
          // If authenticated, navigate to home (main also reacts to state)
          // Use named route if defined in your app routes
          context.goNamed('home-screen');
        } else if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      child: Scaffold(
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
                const SizedBox(height: 24.0),
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
                const SizedBox(height: 16.0),
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
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _isSubmitting
                      ? null
                      : () {
                          final username = usernameController.text.trim();
                          final password = passwordController.text.trim();

                          // Basic local validation
                          if (username.isEmpty || password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please enter username and password')),
                            );
                            return;
                          }

                          setState(() {
                            _isSubmitting = true;
                          });

                          // Dispatch event to AuthBloc
                          context.read<AuthBloc>().add(
                                AuthLoginRequested(username: username, password: password),
                              );
                        },
                  child: _isSubmitting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Login'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    context.go('/signup');
                  },
                  child: const Text('Do not have an account? Sign Up'),
                ),
                const SizedBox(height: 16.0),
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
                //
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }



}
