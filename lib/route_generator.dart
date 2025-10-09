// import 'package:flutter/material.dart';
// import 'package:my_flutter_app/list_page.dart';

// class RouteGenerator {
//   static Route<dynamic>  generateRoute(RouteSettings settings){
//     var args = settings.arguments;


//     switch(settings.name){
//       case '/':
//         return MaterialPageRoute(builder: (_)=> FirstPage());
//       case '/second':
//         if(args is String){
//           return MaterialPageRoute(builder: (_)=> SecondPage(data:args)
//           );
//         }
//         return _errorRoute();
//       default:
//         return _errorRoute();
//     }
    

//   }
//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Error'),
//         ),
//         body: Center(
//           child: Text('Error'),
//         ),
//       );
//     });
//   }
// }