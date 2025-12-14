import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2_counter_tolist_by_sharedpreferences/todolist/todolist_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() {
    // TODO: implement createState
    return Counter();
  }
}

class Counter extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _LoadCount();
  }

  Future<void> _SaveCount() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt("countvalue", _count);
  }

  Future<void> _LoadCount() async {
    final preferences = await SharedPreferences.getInstance();
    setState(() {
      _count = preferences.getInt("countvalue") ?? 0;
    });
  }

  var _count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App "),
        centerTitle: true,
        backgroundColor: Colors.black45,
        titleTextStyle: TextStyle(fontSize: 24, color: Colors.white),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/images/tasbeeh.jpeg"),
            fit: BoxFit.cover, // fills whole screen
            filterQuality: FilterQuality.high,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _count.toString(),
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_count > 0) {
                        _count--;
                      }
                    });
                    _SaveCount();
                  },
                  child: Text("-"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.all(20),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 18),
                    minimumSize: Size(100, 50),
                  ),
                ),
                SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _count++;
                    });
                    _SaveCount();
                  },
                  child: Text("+"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.all(20),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 18),
                    minimumSize: Size(100, 50),
                  ),
                ),
                SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _count = 0;
                    });
                    _SaveCount();
                  },
                  child: Text("Reset"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.all(20),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 18),
                    minimumSize: Size(100, 50),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      bottomSheet: Container(
        color: Colors.black45,
        child: Card(
          color: Colors.transparent,
          elevation: 0, // as like Shadow
          child: ListTile(
            leading: Icon(Icons.list_alt_outlined, color: Colors.white),
            title: Text(
              "To-Do-List Page",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),

            trailing: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TodoList(),));
              },
              icon: Icon(Icons.arrow_forward_ios_outlined),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
