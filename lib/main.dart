import 'package:flutter/material.dart';
import 'package:flutter_app_1/pages/home.dart';
import 'package:flutter_app_1/pages/loading.dart';
import 'package:flutter_app_1/pages/choose_location.dart';

void main() => runApp(MaterialApp(
  // home: Home(),
  initialRoute: '/home', // overwrites routes root path '/'
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));

// class CustomHome extends StatelessWidget {
//   // const CustomHome({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) { //This makes hot reload easier
//     return Scaffold(
//       appBar: AppBar(
//           title: Text('title'),
//           centerTitle: true,
//           backgroundColor: Colors.red[300] //Ctrl + q
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//         color: Colors.grey[400],
//         child: Text('hello'),
//
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Text('click'),
//         onPressed: () => {},
//       ),
//     );
//   }
// }

