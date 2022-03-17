// ignore_for_file: use_full_hex_values_for_flutter_colors, file_names

import 'package:flutter/material.dart';
import 'package:territoriei/features/group/screens/screens.dart';
import 'package:territoriei/features/home/screens/screens.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);
  static String route = '$InitScreen';

  @override
  State<InitScreen> createState() => _InitScreenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _InitScreenState extends State<InitScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const <Widget>[Home(), GroupScreen()],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xffFFC000),
          border: Border(
            top: BorderSide(color: Color(0xffFFC000), width: 0.5),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xff3E434C),
          unselectedItemColor: const Color(0xffFFFFFFFF),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Grupos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xffFFC000),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
