import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert'; //this enables converting json object to map object

class ChooseLocation extends StatefulWidget {
  // const ChooseLocation({Key key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;

  void getData() async {
    String username = await Future.delayed(Duration(seconds: 3), () {
      // print('yoshi');
      return 'yoshi';
    }); // similar to settimeout

    Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    print('result');
    print(jsonDecode(response.body)['title']); // Seems getting value using . doesn't work
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('initState function ran');;
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
          elevation: 0,
      ),
      body: ElevatedButton(
        onPressed: () => {
          setState(() { counter +=1; } )
        },
        child: Text('counter is $counter'),
      ),
    );
  }
}
