import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Login extends StatefulWidget {
  @override
  LoginApp createState() => LoginApp();
}

class LoginApp extends State<Login> {
  TextEditingController user=TextEditingController();
  TextEditingController pass=TextEditingController();
  DateTime selectedDate = DateTime.now();
  var _currentSelectedDate;

  void callDataPcker()async{
    var selectedDate=await getDatePickerWidget();
    setState(() {
      _currentSelectedDate=selectedDate;
    });
  }
  Future<DateTime?> getDatePickerWidget(){
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2025),
        builder: (context,child){
          return Theme(data: ThemeData.dark(), child: Center(child: child) );
        }
    );
  }
  validarDatos()async{
    try{
      CollectionReference ref =FirebaseFirestore.instance.collection("User");
      QuerySnapshot usuario=await ref.get();

      if (usuario.docs.length !=0){

        for(var cursor in usuario.docs){
          if (user.text==cursor.get('User')){
              if (pass.text==cursor.get('Pass')){
                mensaje('Mensaje', 'dato encontrado');
              }
          }
         //print(cursor.get('User'));
        }
      }
    }catch(e){
      mensaje('Error', e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.asset('image/electronica.png'),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: user,
                style: TextStyle(color: Colors.blueGrey),
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'User',
                  hintText: 'Digite el usuario',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Pass',
                  hintText: 'Digite la contraseña',

                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(500,50)),

              onPressed: (){
               // validarDatos();
                callDataPcker();
                pass.clear();
                //mensaje('Este es un título', 'Este es un mensaje');
              },
              child: Text('Ingresar'),
            ),
            ),
Text("$_currentSelectedDate")
          ],

        ),
      ),
    );
  }

  void mensaje(String titulo, String mess) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(mess),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                Text("Aceptar", style: TextStyle(color: Colors.blueGrey)),
              )
            ],
          );
        });
  }
}
