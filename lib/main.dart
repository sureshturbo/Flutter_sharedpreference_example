

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shared preference',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  TextEditingController check = TextEditingController();
  ///declare the variable for access the package
  late SharedPreferences s_pref;
  ///this variable used for the view the data
  String temp = '';

  ///save data
  _save_data() async{
    s_pref = await SharedPreferences.getInstance();
    ///save format
    s_pref.setString("key_1", check.text.toString());


  }
  _view_data() async{
    s_pref = await SharedPreferences.getInstance();
    // s_pref.containsKey(check.text.toString());
    ///view format
    setState(() {
      temp =s_pref.getString('key_1').toString();
    });

  }

  _delete_data() async {
    s_pref =await SharedPreferences.getInstance();
    s_pref.remove('key_1');
    setState(() {
      temp="";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Shared preference')),
      body: SafeArea(
          top: true,
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: TextField(
                    controller: check,
                    decoration: InputDecoration(
                        labelText:'enter the here.......',
                        border:OutlineInputBorder()
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: ElevatedButton(onPressed: (){
                    _save_data();
                  }, child: Text('save data'),style: ElevatedButton.styleFrom(
                      primary:Colors.green
                  ),),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: ElevatedButton(onPressed: (){
                    _view_data();
                  }, child: Text('view data'),style: ElevatedButton.styleFrom(
                      primary:Colors.green
                  ),),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: ElevatedButton(onPressed: (){
                    _delete_data();
                  }, child: Text('delete data'),style: ElevatedButton.styleFrom(
                      primary:Colors.green
                  ),),
                ),
                Container(
                  child: Text('${temp.toString()}',style: TextStyle(fontSize: 25, color: Colors.black),
                    textAlign: TextAlign.center,),
                )
              ],
            ),
          )
      ),

    );
  }
}

