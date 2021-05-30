import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<dynamic> todoItems = [
    {
      'todo': "this is a test string",
      'completed': true,
    },
    {
      'todo': 'test string2',
      'completed': false,
    },
  ];
  String date = '2021-05-20';

  void getData() async {
    // Uri endpoint = Uri.parse('https://api.todiary.ml:2083');
    // var query = { 'userOid': '60a4c9f8708c73536cb73f49', 'toGrab': ['todolist']},
    // Uri apiUrl = Uri.https('api.todiary.ml:2083', '/accountdata', query);
    Uri apiUrl = Uri.https('api.todiary.ml:2083', '/accountdata',
        {
          'userOid': '60a4c9f8708c73536cb73f49',
          'toGrab[0]': 'todolist.${date}',
          // 'toGrab[1]': 'todolist.2021-05-22',
        });
    Response res = await get(apiUrl);
    Map data = jsonDecode(res.body);
    print(data['todolist'][date]);
    // Map<String, String> todoMaps = data['todolist'][date]['todos'];
    List todoMaps = data['todolist'][date]['todos'];
    // todoMaps.forEach((key, value) { todoItems[key[]] })
    setState(() {
      // todoMaps.forEach((value) { todoItems.add(value['todo']); });
      todoMaps.forEach((value) { todoItems.add(value); });
    });
  }

  void initState() {
    super.initState();
    // getData();
    print('init state todo list page');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todiary'), centerTitle: true,),
      body: Column(
        children: <Widget> [
          TextButton.icon(
              // onPressed: () => Navigator.pushNamed(context, '/location'),
              onPressed: () { getData(); },
              icon: Icon(Icons.update),
          label: Text('refresh todolist'),
          ),
          Expanded(
            child: SizedBox(
              height: 200.0,
              child: ListView.builder(
                  // padding: const EdgeInsets.all(8),
                  itemCount: todoItems.length,
                  itemBuilder: (BuildContext context, int idx) {
                    return Container(
                        // height: 50,
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        color: todoItems[idx]['completed'] ? Colors.red : Colors.amber[300],
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row (
                              children: <Widget> [
                              Text(
                                  todoItems[idx]['todo'],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(decoration: todoItems[idx]['completed'] ? TextDecoration.lineThrough : TextDecoration.none )
                              )
                            ]
                        ),
                    );
                  }
              ),
            ),
          ),
          Expanded(
              child: new Align(
                  alignment: Alignment.bottomCenter,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Icon(Icons.star),
                      new Text("Bottom Text"),
                      TextButton(
                          onPressed: () {
                            print('goto menu clicked');
                            // Navigator.pushNamed(context, '/location')
                          },
                          child: Text('goto Menu'))
                    ],
                  )
              )
          )
        ],
      ),
    );
  }
}
