import 'package:flutter/material.dart';


Widget mainAppBar(BuildContext context){
  return AppBar(
    //backgroundColor: Colors.orange[300],
    centerTitle: true,
    title: new Text("ChatAdda",style: new TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.normal,),
    ),
  );
}
InputDecoration TextFormDecoration(String hintText){
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white54),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color : Colors.white),
  )
  );
}

TextStyle simpleTextStyle(double textsize){
  return TextStyle(
    color: Colors.white,
    fontSize: textsize,

  );
}