import 'package:chat_adda/helper/Helper.dart';
import 'package:chat_adda/services/auth.dart';
import 'package:chat_adda/views/signin.dart';
import 'package:chat_adda/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:chat_adda/views/Search.dart';


class ChatList extends StatefulWidget {
  @override

  _ChatListState createState() => _ChatListState();

}

class _ChatListState extends State<ChatList> {
  bool isLoading=true;
  AuthMethods _authMethods=new AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        //backgroundColor: Colors.black,
        centerTitle: true,
        title: new Text("ChatAdda",style: new TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.normal,),
      ),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>Search()
              )
              );
            },
            child: new Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.grey[900]
                  ]
                ) ,
              ),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
              child: Image.asset("assets/images/search.png"),
            ),
          ),

          // GestureDetector(
          //   onTap: (){
          //     _authMethods.signout();
          //     Navigator.pushReplacement(context, MaterialPageRoute(
          //         builder: (context)=>Authentication()
          //     )
          //     );
          //   },
          //   child: new Container(
          //     color: Colors.black26,
          //     margin: EdgeInsets.all(12),
          //     padding: EdgeInsets.symmetric(horizontal: 16),
          //     child: Icon(Icons.logout,color: Colors.black,),
          //   ),
          // )
        ],
      ),
    );
  }
}
