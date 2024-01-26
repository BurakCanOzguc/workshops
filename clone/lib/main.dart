import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NewPage(),
    );
  }
}

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Button Gradient verme",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.green,
            Colors.orange,
          ],
          begin: Alignment.topLeft,
          transform: GradientRotation(50),
          tileMode: TileMode.mirror,
          end: Alignment.bottomRight,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Button Greadient"),
                style: ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.grey),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Butona tıklandığında yapılacak işlemler
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.all(16.0)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  elevation: MaterialStateProperty.all(20.0),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple, // Sol yarısı mavi
                        Colors.brown, // Sağ yarısı yeşil
                      ],
                      stops: [0.50, 0.50], // Renk geçişinin yarısında duracak
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    constraints: BoxConstraints(
                      minWidth: 88.0,
                      minHeight: 36.0,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Renkli Buton',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
