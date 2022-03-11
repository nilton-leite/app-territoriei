import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static String route = '$Home';
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Início'),
        bottom: PreferredSize(
      child: Container(
         color: Colors.orange,
         height: 2.0,
      ),
      preferredSize: const Size.fromHeight(4.0)),
   
      ),
      backgroundColor: const Color(0xff3E434C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Olá',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xffE5E5E5),
        tooltip: 'Nova retirada',
        child: const Icon(Icons.add, color: Color(0xffFFC000)),
      ), 
    );
  }
}