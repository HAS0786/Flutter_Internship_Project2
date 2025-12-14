import 'package:flutter/material.dart';
import 'package:project2_counter_tolist_by_sharedpreferences/counter/counter_page.dart';
import 'package:project2_counter_tolist_by_sharedpreferences/todolist/todolist_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
      // home: TodoList(),
    );
  }
}


