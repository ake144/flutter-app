import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const TabsDemo());
}






class TabsDemo extends StatelessWidget {
  const TabsDemo({super.key});
   

   @override
   Widget build(BuildContext context){
     return MaterialApp(

       debugShowCheckedModeBanner: false,
       theme: ThemeData(
         primarySwatch: Colors.blue
        ),
        darkTheme: ThemeData.dark(),
         home: HomePage(),
      //  home: DefaultTabController(
      //   length: 4,
      //   child: Scaffold(
      //     appBar: AppBar(
      //       bottom: const TabBar(tabs:[
      //         Tab(icon: Icon(Icons.music_note),),
      //          Tab(icon: Icon(Icons.movie),),
      //           Tab(icon: Icon(Icons.games),),
      //            Tab(icon: Icon(Icons.book),),
      //       ]),
      //         foregroundColor: Colors.white,

      //       title: const Text('Tabs Demo'),
      //       backgroundColor: Color.fromARGB(255, 63, 81, 181),

      //     ),

      //     body: TabBarView(
      //       children: [
      //            CircularProgressIndicator(
      //             valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      //             strokeWidth: 10.0,
      //             value: 0.3,
      //             backgroundColor: Colors.grey,
                

      //            ),
      //            const SizedBox(height: 20),
      //            LinearProgressIndicator(
      //              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      //              backgroundColor: Colors.grey,
      //               minHeight: 10,
      //               value: 0.7,
      //            ),
      //         // Center(
      //         //   child: ElevatedButton(
      //         //     onPressed: () {
      //         //       showDialog(
      //         //         context: context,
      //         //         builder: (BuildContext context) {
      //         //           return AlertDialog(
      //         //             title: const Text('Welcome fam'),
      //         //             content: const Text('This is a simple alert dialog.'),
      //         //             actions: [
      //         //               TextButton(
      //         //                 onPressed: () {
      //         //                   Navigator.of(context).pop();
      //         //                 },
      //         //                 child: const Text('OK'),
      //         //               ),
      //         //               TextButton(
      //         //                 onPressed: () {
      //         //                   Navigator.of(context).pop();
      //         //                 },
      //         //                 child: const Text('Cancel'),
      //         //               ),
      //         //             ],
      //         //           );
      //         //         },
      //         //       );
      //         //     },
      //         //     child: const Text('Show Dialog'),
      //         //   ),
      //         // ),
      //         const Icon(Icons.movie, size: 350,),
      //         const Icon(Icons.games, size: 350,),
      //         ExpansionTile(
      //           title: const Text('Click to expand'),
      //           subtitle: const Text('This is a subtitle you can add'),
      //           leading: const Icon(Icons.book, size: 50,),
      //           initiallyExpanded: false,
      //           trailing: const Icon(Icons.arrow_drop_down_circle),
      //           collapsedBackgroundColor: Colors.amber,
      //           collapsedIconColor: Colors.black,
      //           collapsedTextColor: Colors.black,
      //           backgroundColor: Colors.blue,
      //           textColor: Colors.black,
      //           iconColor: Colors.red,
      //           children: [
      //             Container(
      //               padding: const EdgeInsets.all(16),
      //               child: const Text('This is the expanded content. You can add more widgets here as needed.'),
      //             )
      //           ],
      //         ),
      //       ],
      //     ),
      //   )
      //  )
           );
      
  }
}
     

          // body: TabBarView(
          //   children: [
              
          //     const Icon(Icons.music_note, size: 350,),
          //     const Icon(Icons.movie, size: 350,),
          //     const Icon(Icons.games, size: 350,),
              
          //     ExpansionTile(
          //       title: const Text('Click to expand'),
          //       subtitle: const Text('This is a subtitle you can add'),
          //       leading: const Icon(Icons.book, size: 50,),
          //     initiallyExpanded: false,
          //        trailing: const Icon(Icons.arrow_drop_down_circle),
          //     collapsedBackgroundColor: Colors.amber,
          //     collapsedIconColor: Colors.black,
          //     collapsedTextColor: Colors.black,

          //     backgroundColor: Colors.blue,
          //     textColor: Colors.black,
          //     iconColor: Colors.red,
          //       children:  [
          //         Container(
          //           padding: const EdgeInsets.all(16),
          //           child: const Text('This is the expanded content. You can add more widgets here as needed.'),
                    
          //         )
          //       ],
          //     )
          //   ],
    


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio page'),
      ),
      body: 
           Container(
             alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                 children: [
                   const Text(
                    "Welcome to Akanji Hero Section",
                    style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                   )
                   ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Image(image:   AssetImage('images/photo.jpg',), fit: BoxFit.cover,),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: MasonryGridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        itemCount: _cards.length,
                        itemBuilder: (context, index) {
                          return _cards[index];
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "This is a simple Flutter application demonstrating a staggered grid view layout. The grid items are displayed in a masonry style, allowing for a dynamic and visually appealing arrangement of content.",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: (){

                      },
                      child: const Text("Contact Me"),
                    ),
                 ],
              ),
           )
    );
  }
}

List <StaggeredGridTile> _cards = [
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Card(
        color: Colors.amber,
        child: const Center(
          child: Text('1'),
        ),
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Card(
        color: Colors.blue,
        child: const Center(
          child: Text('2'),
        ),
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Card(
        color: Colors.green,
        child: const Center(
          child: Text('3'),
        ),
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Card(
        color: Colors.purple,
        child: const Center(
          child: Text('4'),
        ),
      ),    

    )
];


