import 'package:chat_adda/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chat_adda/Widgets/widgets.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchTextEditingContoller = new TextEditingController();
  QuerySnapshot _querySnapshot;


  DataBaseMethods _dataBaseMethods = new DataBaseMethods();

  Initiatestate(){
    _dataBaseMethods
        .getUser(_searchTextEditingContoller.text)
        .then((val) {
          setState(() {
            _querySnapshot=val;
          });

    });
  }
  CreateChatRoomAndStartConversation(String username,){
      _dataBaseMethods.CreateChatRoom();
  }

  Widget SearchList(){
    return _querySnapshot != null? ListView.builder(
      shrinkWrap: true,
      itemCount: _querySnapshot.docs.length ,
        itemBuilder: (context,index){
          var data = _querySnapshot.docs[index].data();
        return SearchTile(
            username:data["Name"],
            email:data["Email"]
        );
        }
    ):Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        leadingWidth: 40,
        backgroundColor: Colors.white24,
        title: Container(
          decoration: BoxDecoration(),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _searchTextEditingContoller,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: new TextStyle(color: Colors.white38, fontSize: 25),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                style: TextStyle(color: Colors.white, fontSize: 20),
                cursorColor: Colors.grey,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Initiatestate();
            },
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: Image.asset("assets/images/search.png"),
              padding: EdgeInsets.only(bottom: 10, top: 10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: Colors.black),
            ),
          ),
        ],
      ),
      body: SearchList(),
    );
  }
}

class SearchTile extends StatelessWidget {
  final  username;
  final  email;

  SearchTile({this.username, this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      child: new Row(
        children: <Widget>[
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(username, style: simpleTextStyle(13)),

              Text(email, style: simpleTextStyle(13)),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(35)),
              child: new Text("message"),
            ),
          )
        ],
      ),
    );
  }
}
