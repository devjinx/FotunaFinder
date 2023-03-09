import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//title: MyApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Number App',
      home: RandomNumberPage(),
    );
  }
}

//Functions
class RandomNumberPage extends StatefulWidget {
  @override
  _RandomNumberPageState createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  String _randomNumber = '';

  void _generateRandomNumber() {
    var random = Random();
    setState(() {
      _randomNumber = (random.nextInt(99) + 1).toString().padLeft(2, '0');
    });
    //imput and output show in display
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('เลขสองตัวท้าย'),
        content: Text('เลขที่ออกก็คือ $_randomNumber'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'เลขสองหลักก็คือ',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _generateRandomNumber,
              child: Text('กดปุ่มนี้เพื่อสุ่ม'),
            ),
          ],
        ),
      ),
    );
  }
}
