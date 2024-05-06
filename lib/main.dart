import 'package:flutter/material.dart';
import 'package:flutter_json_http/local_json.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Json ve Api"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton (child: const Text("Araba Listesi Getir"), onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LocalJsonKullanimi()));
            },
            ),

          ],
        ),
      ),
    );
  }
}
