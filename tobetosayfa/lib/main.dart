import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TobetoSayfa(),
    );
  }
}

class TobetoSayfa extends StatefulWidget {
  const TobetoSayfa({
    Key? key,
  }) : super(key: key);

  @override
  State<TobetoSayfa> createState() => _TobetoSayfaState();
}

class _TobetoSayfaState extends State<TobetoSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                    image: NetworkImage(
                        'https://tobeto.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Ftobeto-logo.409772fc.png&w=256&q=75')),
              ),
              TextButton(onPressed: () {}, child: const Text('data')),
            ],
          )
        ],
      ),
    );
  }
}
