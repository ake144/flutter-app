import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
   final bool isAuthenticated;
   final String email;
   final String? token;
   final String? errorMessage;

  const  AuthState({
     required this.isAuthenticated,
     required this.email,
     required this.token,
     required this.errorMessage,
   });
 
  factory AuthState.initial()=>
      const AuthState(
         isAuthenticated: false,
         email: '',
         token: null,
         errorMessage: null,
       );

    AuthState copyWith({
     bool? isAuthenticated,
     String? email,
     String? token,
     String? errorMessage,
   }) {
      return AuthState(
       isAuthenticated: isAuthenticated ?? this.isAuthenticated,
       email: email ?? this.email,
       token: token ?? this.token,
       errorMessage: errorMessage ?? this.errorMessage,
     );
   }

  @override
   List<Object?> get props => [isAuthenticated, email, token, errorMessage];

}