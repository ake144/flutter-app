// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:my_flutter_app/route_generator.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';



// class FormSection extends StatelessWidget {
//   const FormSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'htttp demo',
//       home: SecondPage(data: 'hiiii'),
//       // initialRoute: '/second',
//       // onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class HomePage extends StatefulWidget{
//   const HomePage({super.key});

//   @override
//   _HomePageState  createState()=> _HomePageState();
// }

// class _HomePageState extends State<HomePage>{
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _email = '';

//   _launchURL() async {
//   final Uri url = Uri.parse('https://www.geeksforgeeks.org/');
//   if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
//     throw Exception('Could not launch $url');
//   }
// }


// // final channel = IOWebSocketChannel.connect('ws://echo.websocket.org');



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Form Example'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _name = value!;
//                 },
//               ),
//               TextFormField(

//                 decoration: InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _email = value!;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Processing Data: $_name, $_email')),
//                     );
//                   }
//                 },
//                 child: Text('Submit'),
//               ),

//             ElevatedButton(
//                onPressed: _launchURL,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                 ),
//                child: Text('open in browser'),
//              ),
            
//              Container(
//                padding: const EdgeInsets.all(12.0),
//                decoration: BoxDecoration(
//                  color: Colors.green,
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: const Text(
//                         'Tap Button',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       }
//     }


// class FirstPage extends StatelessWidget{
//   const FirstPage({super.key});

//     @override
//     Widget build(BuildContext context){
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('First Page'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: (){
//               Navigator.of(context).pushNamed('/second', arguments: 'Hello from First Page');
//             },
//             child: Text('Go to Second Page'),
//           ),
//         ),
//       );  
//     }
// }


//     class SecondPage extends StatefulWidget {
//       final String data;
//       const SecondPage({super.key, required this.data});
    
//       @override
//       _SecondPageState createState() => _SecondPageState();
//     }
    
//     class _SecondPageState extends State<SecondPage> {
//       final TextEditingController _controller = TextEditingController();
//       late Future<List<Album>> _futureAlbum;
    
//       @override
//       void initState() {
//         super.initState();
//         _futureAlbum = fetchAlbum();
//       }
    
//       @override
//       Widget build(BuildContext context) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('Second Page'),
//           ),
//           body: Container(
//             alignment: Alignment.center,
//             padding: const EdgeInsets.all(8.0),
//             child: FutureBuilder<List<Album>>(
//               future: _futureAlbum,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return CircularProgressIndicator();
//                 } else if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.red),);
//                 } else if (snapshot.hasData) {
//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
                    
                    
//                     children:[
//                       Expanded(
//                         child: ListView.builder(
//                           itemCount: snapshot.data!.length,
//                           itemBuilder: (context, index) {
//                             final album = snapshot.data![index];
//                             return ListTile(
//                               leading: CircleAvatar(
//                                 child: Text(album.id.toString()),
//                               ),
//                               title: Text(album.title),
//                               subtitle: Text('Album ${album.id}'),
//                               hoverColor: Colors.green[100],
//                               trailing: IconButton(
//                                 icon: Icon(Icons.delete),
//                                 onPressed: () {
//                                   setState(() {
//                                     _futureAlbum = deleteAlbum(album.id.toString()).then((_) => snapshot.data!..removeAt(index));
//                                   });
//                                 },
//                               ),
//                               onTap: () {
//                                 Navigator.push(context,
//                                   MaterialPageRoute(
//                                     builder: (context) => DetailsPage(data: album.title)
//                                   )
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       ),
//                       TextField(
//                         controller: _controller,
//                         decoration: InputDecoration(hintText: 'Enter Title'),
//                       ),
//                       SizedBox(height: 20),
//                       ElevatedButton(onPressed: (){
//                         setState(() {
//                           _futureAlbum = updateAlbum(_controller.text).then((album) => [album]);
//                         });
//                       }, child: Text('Update Album')),
//                       SizedBox(height: 20),
//                       ElevatedButton(
//                         child: Text('create Album'),
//                         onPressed: (){
//                           setState(() {
//                             _futureAlbum = createAlbum( _controller.text).then((album) => [album]);
//                           });
//                         },
//                       ),

//                     ],
//                   );
//                 } else {
//                   return Text('No data');
//                 }
//               },
//             ),
//           ),
//         );
//       }
//     }


//         class Album {
//           final int id;
//           final String title;

//           Album({required this.id, required this.title});
//           factory Album.fromJson(Map<String, dynamic> json){
//              return Album(
//               id: json['id'],
//               title: json['title'],
//              );
//           }
//         }




//          Future<Album>  updateAlbum(String title) async {
//               final http.Response response = await http.put(
//                 Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
//                 headers: <String, String>{
//                   'Content-Type': 'application/json; charset=UTF-8',
//                     'Accept': 'application/json',
//               'User-Agent': 'Mozilla/5.0 (FlutterApp)',
//                 },
//                 body: jsonEncode(<String, String>{
//                   'title': title,
//                 }),
//               );
//                print('Status code update: ${response.statusCode}, result: ${response.body}');
//               if(response.statusCode == 200) {
//                 return Album.fromJson(jsonDecode(response.body));
//               } else {
//                 throw Exception('Failed to update album');
//               }
//          }


//         Future<List<Album>> fetchAlbum() async {
//           final response = await http.get(
//             Uri.parse('https://jsonplaceholder.typicode.com/albums'),
//             headers: <String, String>{
//               'Content-Type': 'application/json; charset=UTF-8',
//               'Accept': 'application/json',
//               'User-Agent': 'Mozilla/5.0 (FlutterApp)',
//             }
//           );
//             print('Status code fetch: ${response.statusCode}, result: ${response.body}');
//            if(response.statusCode == 200){
//             List<dynamic> body = jsonDecode(response.body);
//             List<Album> albums = body.map((dynamic item)=> Album(id: item['id'], title: item['title'])).toList();
//             return albums;
//            }
//             else {
//               throw Exception('Failed to load album');
//             }
//         }

//         Future<Album> deleteAlbum(String id) async {
//           final http.Response response = await http.delete(
//             Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
//             headers: <String, String>{
//               'Content-Type': 'application/json; charset=UTF-8',
//               'Accept': 'application/json',
//               'User-Agent': 'Mozilla/5.0 (FlutterApp)',
//             },
//           );
//           print('Status code delete: ${response.statusCode}, result: ${response.body}');
//           if(response.statusCode == 200){
//             return Album.fromJson(jsonDecode(response.body));
//           } else {
//             throw Exception('Failed to delete album');
//           }
//         }


//         Future<Album> createAlbum(String title) async {
//           final http.Response response = await http.post(
//             Uri.parse('https://jsonplaceholder.typicode.com/albums'),
//             headers: <String, String>{
//               'Content-Type': 'application/json; charset=UTF-8',
//               'Accept': 'application/json',
//               'User-Agent': 'Mozilla/5.0 (FlutterApp)',
//             },
//             body: jsonEncode(<String, String>{
//               'title': title,
//             }),
//           );
//           print('Status code create: ${response.statusCode}, result: ${response.body}');
//           if(response.statusCode == 201){
//             return Album.fromJson(jsonDecode(response.body));
//           } else {
//             throw Exception('Failed to create album');
//           }
//         }


// class DetailsPage extends StatefulWidget{
//   final String data;
//   const DetailsPage({super.key, required this.data});

//   @override
//   _DetailsPageState createState()=> _DetailsPageState();
// }

// class _DetailsPageState extends State<DetailsPage>{
//   File? galleryFile;
//   final picker = ImagePicker();

//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Details Page'),
//       ),
//       body: Builder(builder: (BuildContext context) {
//         return Center(

//           child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//              ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.green,
//             padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//             foregroundColor: Colors.white,
//             textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           onPressed: (){
//             _showPicker(context: context);
//           },
//           child: const Text(' Select an image'),
//         ),
//         const SizedBox(height: 16),
         
//          SizedBox(
//           height:200,
//           width: 200,
//           child: galleryFile ==null ?
//             const Center(
//               child: Text('No image selected'),
//             )
//             : Center(
//               child: Image.file(galleryFile!),
//             )
//          ),
//           ],
//         )
//       );

//       }
//       ),
//     );
//   }


//   void _showPicker({required BuildContext context}) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bc) {
//         return SafeArea(
//           child: Wrap(
//             children: <Widget>[
//               ListTile(
//                   leading: Icon(Icons.photo_library),
//                   title: Text('Photo Library'),
//                   onTap: () {
//                     getImage(ImageSource.gallery);

//                     Navigator.of(context).pop();
//                   }, trailing: Icon(Icons.chevron_right)),
//               ListTile(
//                 leading: Icon(Icons.photo_camera),
//                 title: Text('Camera'),
//                 onTap: () {
//                   getImage(ImageSource.camera);
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       }
//     );
//   }

//   Future getImage(ImageSource source) async {
//     final pickerFile = await picker.pickImage(source: source);

//     XFile? xfilePick = pickerFile;
//      setState(
//       (){
//         if(xfilePick != null){
//           galleryFile = File(pickerFile!.path);
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('No image selected'))
//           );
//         }
//       }
//      );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/config/database_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:http/http.dart' as http;
import 'package:faker/faker.dart';



class FormSection extends StatefulWidget {
  const FormSection({super.key});

  @override
  State<FormSection> createState() => _FormSectionState();


}

class _FormSectionState extends State<FormSection>{

  late Future<int>  dataFuture;

  @override
  void initState(){
    super.initState();
    dataFuture = getData();
  }




  
@override
Widget build(BuildContext context){
  var faker = new Faker();


  return Scaffold(
    appBar: AppBar(
      title: Text('Quiz App with BLoC by ${faker.person.name()}'),
    ),
    body: Column(
      children: [
        ButtonWidget(
          label:"Get Quiz Data",
          callback: () async{
            await DatabaseService().read(path: "quiz_questions");
            // Handle button press
          },
        ),
        SizedBox(height: 20),
        ButtonWidget(
          label: "Submit Answers",
          callback: () async{
            await DatabaseService().saveQuizResult(22);
          },
        ),
        SizedBox(height: 20),
        ButtonWidget(
          label: "View Results",
          callback: () async {
            await DatabaseService().fetchQuizResults();
          },
        ),
      SizedBox(height: 20),
        ButtonWidget(
          label: "Restart Quiz",
          callback: () {
            // Handle button press
          },
        ),  
      SizedBox(height: 20),
      ButtonWidget(
          label: "Contact Support",
          callback: () {
            _sendEmail(faker.internet.email());
          },
        ),
      SizedBox(height: 20),
      ButtonWidget(label: "send SMS", callback: () {
        _sendSms(faker.phoneNumber.us());
      }),
      SizedBox(height: 20),
      ElevatedButton(onPressed: (){
        WakelockPlus.enable();
      },
       child: const Text("Wakelock Enable")),
      SizedBox(height: 20),
      ElevatedButton(onPressed: (){
        WakelockPlus.disable();
      },
       child: const Text("Wakelock Disable")) 
      ],
    ),
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Navigation Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    floatingActionButton: buildSpeedDial(),
  );
}

}

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback callback;

  const ButtonWidget({super.key, required this.label, required this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: Text(label),
    );
  }
}

Future<int>  getData() async{
    final result  = await http.get(
      Uri.parse('https://randomnumberapi.com/api/v1.0/random?min=100&max=1000&count=1'),
    );

    await Future.delayed(Duration(seconds: 2));

    final body = json.decode(result.body);

    print('Result: $body');

    int randomNumber = (body as List).first;

    return randomNumber;
}


 
Future<void> _sendEmail(String email) async {
  var _url = Uri.parse("mailto:$email");

   if (await canLaunchUrl(_url)) {
     await launchUrl(_url, mode: LaunchMode.externalApplication);
   } else {
     throw 'Could not launch $_url';
   }
}

Future<void> _sendSms(String phoneNumber) async {
    var _url = Uri.parse("sms:$phoneNumber");
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $_url';
    }
}

SpeedDial buildSpeedDial(){
  return SpeedDial(
     animatedIcon: AnimatedIcons.menu_close,
     animatedIconTheme: IconThemeData(size: 22.0),
     backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
     visible: true,
     curve: Curves.bounceInOut,
     children: [
        SpeedDialChild(
           child: Icon(Icons.message),
           backgroundColor: Colors.red,
            label: 'Message',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('Message Tapped'),
        ),
        SpeedDialChild(
          child: Icon(Icons.email),
          backgroundColor: Colors.green,
          label: 'Email',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => print('Email Tapped'),
        ),
        SpeedDialChild(
          backgroundColor:Colors.orange ,
          child: Icon(Icons.phone),
          label: 'Phone',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => print('Phone Tapped'),
          )
     ],
  
  );
}