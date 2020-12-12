import 'package:chat_adda/helper/Helper.dart';
import 'package:chat_adda/views/chatlist.dart';
import 'package:flutter/material.dart';
import 'package:chat_adda/views/signup.dart';
import 'package:chat_adda/views/signin.dart';
import 'package:firebase_core/firebase_core.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ChatAdda",
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.black,
       // backgroundColor: Colors.black,
        //accentColor: Color(0xff007EF4),
        scaffoldBackgroundColor: Color(0xff1F1F1F),
      ),
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Authentication();
  }
}
