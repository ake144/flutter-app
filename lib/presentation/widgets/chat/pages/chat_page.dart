import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/socket_manager.dart';
import 'package:my_flutter_app/presentation/widgets/nav_bar.dart';


class ChatPage extends StatefulWidget {
  final int courseId;
  final int userId;

  const ChatPage({super.key, 
  required this.courseId,
   required this.userId
   });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final SocketManager socketManager = SocketManager();
  final TextEditingController _controller = TextEditingController();
  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    socketManager.connect();

    Future.delayed(const Duration(seconds: 1), () {
      socketManager.joinCourse(widget.courseId);
    });


    socketManager.listenToMessages((data) {
      setState(() {
       messages.add('${data['userId']}: ${data['messsage']}');
      });
    });
  }

  @override
  void dispose() {
    socketManager.dispose();
    super.dispose();
  }

  void sendMessage() {
    if (_controller.text.isNotEmpty) {
      socketManager.sendMessage(widget.courseId, widget.userId, _controller.text);
      
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Course Chat')),
      drawer: NavBar(),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, i) =>
                  ListTile(title: Text(messages[i])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(controller: _controller),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
