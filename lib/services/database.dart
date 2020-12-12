import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {

  getUser(String Username)async{
  return await FirebaseFirestore.instance.collection("users")
      .where("Name",isEqualTo: Username).get();

  }
  UploadUserByName (usermap)async{
   await FirebaseFirestore.instance.collection("users").add(usermap);
  }
  
  CreateChatRoom(String ChatroomID,ChatroomMap)async{
   await FirebaseFirestore.instance.collection("chatroom")
       .doc(ChatroomID).set(ChatroomMap).catchError((e){
         print(e.toString());
   });
  }
}
