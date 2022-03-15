import 'package:flutter/material.dart';
import 'package:proyectolinea/View/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  HomeStart createState() => HomeStart();
}

class HomeStart extends State<Home> {
  Widget build(BuildContext context) {
    return MaterialApp(
        // title: Text('ProyectoLinea'),
        home: Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset('image/electronica.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(400, 50)),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Login()));
                },
                child: Text('Ingresar'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
