import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());

  }
}
class Home extends StatefulWidget{
  @override
  HomeStart createState() => HomeStart();

}
 class HomeStart extends State<Home>{
  Widget build(BuildContext context){
    return MaterialApp(
     // title: Text('ProyectoLinea'),
      home: Scaffold(
      appBar:AppBar(
        title: Text('Bienvenido'),
      )
    )
    );
  }
 }
