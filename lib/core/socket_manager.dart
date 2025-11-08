import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketManager {
    // static final backendUrl = DotEnv().env['API_URL'] ?? 'http://localhost:3000';
  static final SocketManager _instance = SocketManager._internal();
  factory SocketManager() => _instance;


  late IO.Socket socket;

  SocketManager._internal();

static String get backendUrl => dotenv.env['API_URL'] ?? 'http://localhost:3000';

  void connect() {
    socket = IO.io(backendUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();

    socket.onConnect((_) => print('✅ Connected to WebSocket'));
    socket.onDisconnect((_) => print('❌ Disconnected from WebSocket'));
  }

  void sendMessage(Map<String, dynamic> message) {
    socket.emit('message', message);
  }

  void listenToMessages(Function(dynamic) callback) {
    socket.on('message', callback);
  }

  void dispose() {
    socket.dispose();
  }
}
