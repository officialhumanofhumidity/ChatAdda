import'package:firebase_auth/firebase_auth.dart';
import 'package:chat_adda/model/user.dart';

class AuthMethods
{
  final FirebaseAuth _auth=FirebaseAuth.instance;


   _userFromFirebaseUser(User fuser){
    return fuser!=null ?user(userId: fuser.uid):"null";
  }

  Future signInWithEmail(String email,String password) async{
    try{
      final UserCredential result=(
          await _auth.signInWithEmailAndPassword
            (email: email, password: password)
      );
      User user=result.user;
      print(user.uid);
      return _userFromFirebaseUser(user);


    }catch(e){
        print(e.toString());
    }
  }

  Future signupWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Future signupWithEmail(String email,String password)async{
  //  try{
  //    FirebaseUser firebaseUser=( await
  //         _auth.createUserWithEmailAndPassword
  //      (email: email, password:password)).user;
  //    return _userFromFirebaseUser(firebaseUser);
  //
  //  }catch(e){
  //    print(e.toString());
  //  }
  // }

  Future resetpassword(String email)async{
    try{
    return (await _auth.sendPasswordResetEmail(email: email));
  }catch(e){
      print(e.toString());
    }
  }


Future signout()async{
  try {
    return (await _auth.signOut());
      }
  catch(e){
    print(e.toString());
          }
  }
}