import 'package:chat_adda/Widgets/widgets.dart';
import 'package:chat_adda/helper/Helper.dart';
import 'package:chat_adda/services/auth.dart';
import 'package:chat_adda/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_adda/views/chatlist.dart';
class SignUp extends StatefulWidget {
  Function ChangeView;
  SignUp(this.ChangeView);
  Authentication _authentication=new Authentication();
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  DataBaseMethods _dataBaseMethods=new DataBaseMethods();
  final  _formkey= GlobalKey<FormState>();
  TextEditingController _usernameTextController=new TextEditingController();
  TextEditingController _emailTextController=new TextEditingController();
  TextEditingController _passwordTextController=new TextEditingController();

  bool isLoading=false;
  AuthMethods authMethods=new AuthMethods();
  signMe()async{
    if(_formkey.currentState.validate())   {

      Map<String,String> usermap={
        "Name":_usernameTextController.text,
        "Email":_emailTextController.text,

      };
        setState(() {
          isLoading=true;
        });
     await authMethods.signupWithEmail(_emailTextController.text, _passwordTextController.text).then((value) {

      // print("${value.uid}");
       _dataBaseMethods.UploadUserByName(usermap);
       Navigator.pushReplacement(context, MaterialPageRoute(
           builder:(context)=>ChatList()
       ));

      });
     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      body:isLoading?Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ): SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height-90,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            Form(
              key:_formkey,
                child: Column(
                  children: <Widget>[
                TextFormField(
                  decoration: TextFormDecoration("username"),
                  style:  simpleTextStyle(16),
                  controller: _usernameTextController,
                  validator: (val){
                   return val.isEmpty||val.length<6?"atleast 6 char":null;
                  },

                ),
                TextFormField(
                  decoration: TextFormDecoration("email"),
                  style:  simpleTextStyle(16),
                  controller: _emailTextController,
                  validator: (val){
                   return RegExp(
                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]"
                    ).hasMatch(val) ?null:"Enter Valid Email";
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: TextFormDecoration("password"),
                  style: simpleTextStyle(16),
                  controller: _passwordTextController,
                  validator: (val){
                   return val.isEmpty||val.length<6?"enter at least 6 char":null;
                  },
                ),
              ],
            )
            ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                  child: Text("forget password??",style: simpleTextStyle(15),),
                ),
              ),
              SizedBox(height: 12,),
              GestureDetector(
                onTap: (){
                    signMe();
                },
                child: Container(

                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange[300],
                          Colors.yellow[300],
                          Colors.green[200]
                        ],
                      ),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: new Text("Sign up",
                      style: new TextStyle(fontSize: 25,color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // ),
              SizedBox(height: 18,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey[300],
                        Colors.white,
                      ],
                    ),

                ),
                child: new Text("Sign in with google", style: new TextStyle(fontSize: 18,color: Colors.black)
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>
                [
                  new Text("Already have a account ? ",style: simpleTextStyle(16),),
                  GestureDetector(
                    onTap: (){
                      widget.ChangeView();
                    },
                    child: Container(
                       padding: EdgeInsets.symmetric(vertical: 8),
                      child: new Text("Sign In",
                          style: new TextStyle(color: Colors.white,fontSize: 16,decoration: TextDecoration.underline)),
                    ),
                  ),
                ],),
              SizedBox(height: 100,),
            ],
          ),
        ),
      ),

    );
  }
}
