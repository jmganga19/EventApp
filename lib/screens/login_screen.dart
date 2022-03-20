import 'package:eventapp/screens/event_screen.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 bool _isLogin = true;
 String? _userId;
 String? _password;
 String? _email;
 String? _message;
 

 final _emailController = TextEditingController();
 final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   backgroundColor: const Color(0xFF00ACEE),
     appBar: AppBar(title: Text('Eventify'),),
      body: Container(
        padding: EdgeInsets.only(top:0,left:7,right:7),

        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children:[
                Container(
                  padding: EdgeInsets.only(top:20),
                
                  child: Image(image: AssetImage('assets/eventy.jpg'),
                  )),
               Column(
              children: <Widget>[ 
                emailInput(),
                passwordInput(),
                mainButton(),
                secondaryButton(),
                validationMessage(),
              ],),
              ]),),),));
  }
  Widget emailInput(){
    return Padding(
      padding: EdgeInsets.only(top: 75),
      child: TextFormField(
              controller:_emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon:Icon(Icons.mail),
                hintText: 'Email'
                ),
                validator: (text) => text!.isEmpty ? 'Email is required':'',
            ),
      
      
      );
  }
   Widget passwordInput(){
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
              controller:_passwordController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                icon:Icon(Icons.lock),
                hintText: 'Password',
                ),
                obscureText: true,
                validator: (text) => text!.isEmpty ? 'Password is required':'',
            ),
      );
  }
  Widget mainButton(){
    String buttonText = _isLogin ? 'Login' : 'Sign up';
    return Padding(
      padding: EdgeInsets.only(top: 120),
      child: Container(
        height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.redAccent,
          textStyle: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold)
        ),
        child: Text(buttonText),
        onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>EventScreen()));
        },
      
      )));
      //padding: EdgeInsets.only(top: 120));
  }
  Widget secondaryButton(){
    String buttonText = !_isLogin ? 'Login':'Sign up';
    return FlatButton(
      onPressed: (){
        setState(() {
          _isLogin = ! _isLogin;
        });
      },
       child: Text(buttonText)
       );
  }
  Widget validationMessage(){
    return Text('_message',
    style: TextStyle(fontSize: 14,
    color: Colors.red,
    fontWeight: FontWeight.bold),
    );
  }
}