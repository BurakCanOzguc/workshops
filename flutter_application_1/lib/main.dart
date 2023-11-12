import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

/*class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text("Stateless Widget"),
          foregroundColor: Colors.greenAccent,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset("assets/resim/resmim.jpeg"),
            const Text("Burak Can Özgüç",
                style: TextStyle(fontSize: 30, color: Colors.yellow)),
            const Text("Mobil Geliştirici 1-B",
                style: TextStyle(fontSize: 25, color: Colors.white)),
            const Text("31.10.2023",
                style: TextStyle(fontSize: 20, color: Colors.yellow)),
          ]),
        ));
  }
}
