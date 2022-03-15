import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  LoginApp createState() => LoginApp();
}
class LoginApp extends State<Login>{
  @override
  Widget build(BuildContext context){
   return Scaffold(
     appBar: AppBar(
      title: Text('Login'),
     ),
   ) ;
  }
}
