import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Wrapper(),
    );
  }
}


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Coastal Social"),),
    body: Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.end,mainAxisSize:MainAxisSize.max,crossAxisAlignment: CrossAxisAlignment.center ,children: [
          
          TextButton(onPressed: (){}, child: SizedBox(height: 50,width: 200,child: Center(child: FittedBox(child: Text("Create Account")))),style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),backgroundColor: MaterialStateProperty.all(Colors.black),foregroundColor: MaterialStateProperty.all(Colors.white)),)
        ]),
      ),
    ),);
  }
}