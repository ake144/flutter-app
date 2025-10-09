import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {

   const TextSection( {super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
       ),
       child: Scaffold(
         appBar: AppBar(
           title: const Text('Custom Test Page'),
         ),
         body: Center(
           child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
              foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).push(_createAnotherPageRoute());
            },
            child: const Text('Go to Another Page'),
           )
         ),
       ),
    );
  }

    Route _createAnotherPageRoute() {
      return  PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation)=> const AnotherPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });

    }

}


class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Another Page'),
      ),
      body: const Center(
        child: Text('This is another page'),
      ),
    );
  }
}

