import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Home Page",style: TextStyle(color: Colors.white),),
      ),
      body: Center(child: Text("Welcome to Home Page",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),)),
    );
  }
}