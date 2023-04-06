import 'package:flutter/material.dart';

import '../Componts/ListSurahs.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        title: Text("A L Q U R A N"),
        centerTitle: true,

      ),
      body: ListSurahs(),
      //color: Colors.teal,
    );
  }
}
