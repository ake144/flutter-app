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


  void joinCourse(int courseId){
    socket.emit('joinCourse', {'courseId': courseId});

    print('Joined course room: $courseId');
  }

  void leaveCourse(int courseId) {
    socket.emit('leaveCourse', {'courseId': courseId});

    print('Left course room: $courseId');
  }


  void sendMessage(int courseId, int userId, String message){
    socket.emit('sendMessage', {
      'courseId': courseId,
      'message': message,
      'userId': userId,
    });

    print('Sent message: $message to course: $courseId from user: $userId');
  }

   void listenToMessages(Function(dynamic data) calledBack) {
    socket.on('newMessage', (data) {
      print('Received message: $data');
      calledBack(data);
    });
  }

  void listenToMessageHistory(Function(List<dynamic> data) calledBack) {
    socket.on('messageHistory', (data) {
      print('Received message history: $data');
      if(data is List<dynamic>) {
        calledBack(data);
      }
    });
  }
    

  void dispose() {
    socket.dispose();
  }
}
