import 'package:chat_adda/Widgets/widgets.dart';
import 'package:chat_adda/services/auth.dart';
import 'package:chat_adda/views/chatlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SignIn extends StatefulWidget {
Function ChangeScreen;
  SignIn(this.ChangeScreen);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthMethods _authMethods=new AuthMethods();
  bool isLoading=false;
  final _formKey=GlobalKey<FormState>();
     final TextEditingController EmailtextController=new TextEditingController();
     final TextEditingController PasswordtextController=new TextEditingController();

     signMeIn()async{
       if(_formKey.currentState.validate()){
              setState(() {
                isLoading=true;
              });
         await _authMethods.signInWithEmail(EmailtextController.text, PasswordtextController.text);
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder:(context)=>ChatList()
              )
              );
       }

     }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      body: isLoading?Center(
        child: Container(
          child: CircularProgressIndicator()
             ),
          ): SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height-100,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Form(key: _formKey,
                        child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: TextFormDecoration("email"),
                          style:  simpleTextStyle(16),
                          controller: EmailtextController,
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
                          controller: PasswordtextController,
                          validator: (val){
                             return val.isEmpty||val.length<6?"atleast 6 char":null;
                          },

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
                            signMeIn();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
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
                            child: new Text("Sign in", style: new TextStyle(fontSize: 25,color: Colors.black)),
                          ),
                        ),
                      ],
                    )),
                    SizedBox(height: 18,),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.grey[300],
                              Colors.white,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: new Text("Sign in with google", style: new TextStyle(fontSize: 18,color: Colors.black)),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>
                      [
                      new Text("Don't have a account ? ",style: simpleTextStyle(16),),
                        GestureDetector(
                          onTap: (){
                            widget.ChangeScreen();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: new Text("Sign Up",
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
