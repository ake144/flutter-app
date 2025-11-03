import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class AuthBloc  extends Bloc<AuthEvent, AuthState> {
  final _storage = const FlutterSecureStorage();
  final String backendUrl = 'http://localhost:3000';

  AuthBloc() : super(AuthState.initial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogOutRequested>(_onLogoutRequested);
    on<AuthCheckStatus>(_onCheckStatus);
  }


  Future<void> _onLoginRequested(
        AuthLoginRequested event, Emitter<AuthState> emit) async {
          emit(state.copyWith(errorMessage: null));

          try{
            final response = await http.post(
        Uri.parse('$backendUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': event.username,
          'password': event.password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['access_token'];
        await _storage.write(key: 'token', value: token);

        emit(state.copyWith(
            isAuthenticated: true, 
             token: token));
      } else {
        emit(state.copyWith(
            isAuthenticated: false,
            errorMessage: 'Invalid credentials'));
      }
          }

      
          catch (e) {
            emit(state.copyWith(errorMessage: 'Login failed: $e'));
          }
    }

    Future<void> _onLogoutRequested(
        AuthLogOutRequested event, Emitter<AuthState> emit) async {
          await _storage.delete(key: 'token');
          emit(AuthState.initial());
    }

    Future<void> _onCheckStatus(
        AuthCheckStatus event, Emitter<AuthState> emit) async {
      final token = await _storage.read(key: 'token');
      if (token != null) {
        emit(state.copyWith(isAuthenticated: true, token: token));
      } else {
        emit(state.copyWith(isAuthenticated: false));
      }
    }


}