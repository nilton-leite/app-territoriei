import 'package:flutter/material.dart';
import 'package:territoriei/features/group/group.dart';
import 'package:territoriei/features/home/home.dart';

final Map<String, WidgetBuilder> routes = {
  Home.route: (context) {
    return const Home();
  },
  GroupScreen.route: (context) {
    return const GroupScreen();
  }
};
